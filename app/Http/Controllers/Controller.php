<?php

namespace App\Http\Controllers;

use App\Models\Sector;
use App\Models\UsersDetail;
use App\Models\UsersSector;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function showForm(): View|Application|Factory|\Illuminate\Contracts\Foundation\Application
    {
        $sectors = Sector::query()
            ->where('parent_id', '=', 0)
            ->with('children')
            ->orderBy('sector_id', 'asc')
            ->get();

        $this->renameAttributesInCollection($sectors);

        $usersDetails = $this->getUsersDetails();

        $is_edit_mode = false;
        $dataNames = ['sectors'];

        if ($usersDetails !== null){
            $checkedSectors = $this->getCheckedSectors($usersDetails['id']);
            $is_edit_mode = true;
            if ($checkedSectors){
                $dataNames[] = 'checkedSectors';
            }
        }

        return view('components.sector-form', compact($dataNames), ['usersDetails' => $usersDetails, 'is_edit_mode' => $is_edit_mode]);
    }

    function renameAttributesInCollection($collection) {
        return $collection->map(function ($item) {
            $item['label'] = $item['name'];
            unset($item['name']);
            $item['value'] = $item['sector_id'];
            unset($item['sector_id']);
            unset($item['id']);
            unset($item['parent_id']);
            unset($item['tree_path']);
            unset($item['created_at']);
            unset($item['updated_at']);

            if (isset($item['children'])) {
                $item['children'] = $this->renameAttributesInCollection($item['children']);
            }
            return $item;
        });
    }

    /**
     * @param $id
     * @return array
     */
    public function getCheckedSectors($id): array
    {
        return UsersSector::query()->where('user_id', '=', $id)->get()->pluck('sector_id')->toArray();
    }

    /**
     * @return object|null
     */
    public function getUsersDetails(): null|object
    {
        return UsersDetail::query()
            ->where('user_session_id', '=', session()->getId())
            ->first();
    }
}
