<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserSectorRequest;
use App\Models\UsersDetail;
use App\Models\UsersSector;
use Exception;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class UserSectorController extends Controller
{
    /**
     * @param UserSectorRequest $request
     * @return RedirectResponse
     */
    public function store(UserSectorRequest $request): RedirectResponse
    {
        $savedUsersDetails = $this->saveUsersDetails($request);
        $userId = $savedUsersDetails['id'];

        $sectors = $request['sector'];
        foreach ($sectors as $sector) {
            $this->saveUsersSectors($userId, $sector);
        }
        return redirect()->back()->with('success', 'Form data saved successfully!');

    }

    /**
     * @throws Exception
     */
    public function update(UserSectorRequest $request): RedirectResponse
    {
        //get user by session id
        $usersDetails = UsersDetail::query()
            ->where('user_session_id', '=', session()->getId())
            ->first();

        if (empty($usersDetails)) {
            throw new Exception('User not found');
        }

        $usersDetails->update(
            [
                'name' => $request['name'],
                'agree_to_terms' => $request['agree-to-terms'] ?? 0
            ]
        );

        $userId = $usersDetails['id'];

        UsersSector::query()->where('user_id', '=', $userId)->delete();

        $sectors = $request['sector'];
        foreach ($sectors as $sector) {
            $this->saveUsersSectors($userId, $sector);
        }

        return redirect()->back()->with('success', 'Form data updated successfully!');
    }

    /**
     * @param Request $request
     * @return Builder|Model
     */
    public function saveUsersDetails(Request $request): Builder|Model
    {
        $usersDetailData = $this->buildUsersDetailsSaveData($request);

        return UsersDetail::query()->create($usersDetailData);
    }

    /**
     * @param $userId
     * @param mixed $sector
     * @return void
     */
    public function saveUsersSectors($userId, mixed $sector): void
    {
        $userSectorsData = $this->buildUsersSectorsSaveData($userId, $sector);
        UsersSector::query()->create($userSectorsData);
    }

    /**
     * @param Request $request
     * @return array
     */
    public function buildUsersDetailsSaveData(Request $request): array
    {
        return [
            'name' => $request['name'],
            'agree_to_terms' => $request['agree-to-terms'] ?? 0,
            'user_session_id' => session()->getId()
        ];
    }

    /**
     * @param $userId
     * @param mixed $sector
     * @return array
     */
    public function buildUsersSectorsSaveData($userId, mixed $sector): array
    {
        return [
            'user_id' => $userId,
            'sector_id' => $sector
        ];
    }
}
