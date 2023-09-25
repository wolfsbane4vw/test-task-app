<?php

namespace App\Console\Commands;

use App\Models\Sector;
use DOMDocument;
use DOMXPath;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;

class parseSectors extends Command
{
    #The &nbsp; character counts as 2 whitespaces so tab has 8 spaces
    private const WHITESPACES_IN_TAB = 8;
    private const ROOT_PARENT_ID = 0;

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:parse-sectors';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Parse sector information from the original index.html file.
    The original_index.html file is in the root directory';

    /**
     * Execute the console command.
     * @throws \Exception
     */
    public function handle()
    {
        //read in the html file
        $fileName = 'original_index.html';
        $filePath = base_path($fileName);

        if (!File::exists($filePath)) {
            throw new \Exception('File '. $fileName .' not found at - ' . $filePath);
        }

        $htmlContent = File::get($filePath);

        $dom = new DOMDocument();
        $dom->loadHTML('<?xml encoding="utf-8"?>' . $htmlContent);

        $xpath = new DOMXPath($dom);
        $selectNode = $xpath->query('//select[@multiple]')->item(0);
        $optionNodes = $xpath->query('//select[@multiple]/option', $selectNode);

        $sectors = [];

        foreach ($optionNodes as $optionNode) {
            $sectorID = $optionNode->getAttribute('value');
            $sectorNameWithWhitespaces = $optionNode->nodeValue;

            $encodedString = htmlentities($sectorNameWithWhitespaces, null, 'utf-8');
            $encodedStringUnicodeReplacedWithWhitespaces = str_replace("&nbsp;", " ", $encodedString);
            $decodedSectorName = html_entity_decode($encodedStringUnicodeReplacedWithWhitespaces,null, 'utf-8');

            $sectorName = preg_replace('/^[\s]+/', '', $decodedSectorName);
            $whiteSpaceCount = strlen($sectorNameWithWhitespaces) - strlen($sectorName);

            if ($whiteSpaceCount === 0) {
                $sectorLevel = 0;
            } else {
                $sectorLevel = $whiteSpaceCount / self::WHITESPACES_IN_TAB;
            }

            $sectors[] = [
                'sector_id' => $sectorID,
                'sector_name' => $sectorName,
                'sector_level' => $sectorLevel,
                'parent_id' => '',
            ];
        }

        $sectors = $this->findParentIDsOfSectors($sectors);
        $sectors = $this->buildSectorTreePaths($sectors);
        $this->saveSectors($sectors);
    }

    private function findParentIDsOfSectors($sectors): array
    {
        $reversedSectors = array_reverse($sectors);
        $sectorsWithParentId = [];

        foreach ($reversedSectors as $index => $sector) {
            $sector['parent_id'] = $this->findParentId($reversedSectors, $sector);
            $sectorsWithParentId[] = $sector;

            unset($reversedSectors[$index]);
        }

        return array_reverse($sectorsWithParentId);
    }

    private function findParentId($sectors, $sector)
    {
        $sectorLevel = $sector['sector_level'];

        $arrayWithoutCurrentSector = [];
        foreach (array_slice($sectors, 1) as $key => $value) {
            $arrayWithoutCurrentSector[] = $value;
        }

        if ($sectorLevel === 0) {
            return self::ROOT_PARENT_ID;
        }
        foreach ($arrayWithoutCurrentSector as $item) {
            if ($item['sector_level'] < $sectorLevel) {
                return $item['sector_id'];
            }
        }

        return null;
    }

    private function buildSectorTreePaths(array $sectors): array
    {
        $sectorsWithTreePath = [];
        foreach ($sectors as $sector) {
            $sector['tree_path'] = $this->getSectorTreePath($sectors, $sector);
            $sectorsWithTreePath[] = $sector;
        }
        return $sectorsWithTreePath;
    }

    private function getSectorTreePath($sectors, $sector): string
    {
        $treePathItems = $this->findTreePathItems($sectors, $sector['sector_id']);

        $treePathItems = array_reverse($treePathItems);

        $treePathItems = array_map(function ($item) {
            return $item['sector_id'];
        }, $treePathItems);

        return '.' . self::ROOT_PARENT_ID . '.' . implode('.', $treePathItems) . '.';
    }

    private function findTreePathItems($sectors, $sectorId, $treePathItems = [])
    {

        $sector = current(array_filter($sectors, function ($sector) use ($sectorId) {
            return $sector['sector_id'] === $sectorId;
        }));

        $treePathItems[] = $sector;
        $sectorParentId = $sector['parent_id'];

        if ($sectorParentId > self::ROOT_PARENT_ID) {
            return self::findTreePathItems($sectors, $sectorParentId, $treePathItems);
        }

        return $treePathItems;
    }

    private function saveSectors(array $sectors): void
    {
        foreach ($sectors as $sector) {
            $saveData = $this->buildSaveData($sector);
            try {
                Sector::query()->create($saveData);
            } catch (\Throwable $th) {
                dd($th);
            }
        }
    }

    private function buildSaveData(array $sector): array
    {
        return [
            'sector_id' => $sector['sector_id'],
            'name' => $sector['sector_name'],
            'parent_id' => $sector['parent_id'],
            'tree_path' => $sector['tree_path'],
        ];
    }
}
