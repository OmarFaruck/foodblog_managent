<?php

namespace App\Http\Controllers\Admin;

use Exception;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\User;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;

class UserController
{
    function UserPage(Request $request)
    {
        $list = User::orderBy('id','desc')->get();
        return Inertia::render('Admin/User/UserPage',['list'=>$list]);
    }

    function UserSavePage(Request $request)
    {
        $user_id = $request->query('id');
        $list = User::where('id', $user_id)->first();
        return Inertia::render('Admin/User/UserSavePage',['list'=>$list]);
    }

    function create(Request $request){
        // Validating the request
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|string|min:8|confirmed',
            'bio' => 'nullable|string|max:500',
            'role' => 'required|in:user,admin',
            'avatar' => 'nullable|image|mimes:jpeg,png,jpg,gif,png|max:2048',
        ]);

        try {
            if ($request->hasFile('avatar')) {
                $file = $request->file('avatar');
                $fileName = now()->format('YmdHis') . '_' . $file->getClientOriginalName();
                $imagePath = $file->storeAs('user-avatars', $fileName, 'public');
            } else {
                $imagePath = null;
            }

            User::create([
                'name' => $validatedData['name'],
                'email' => $validatedData['email'],
                'password' => Hash::make($validatedData['password']),
                'bio' => $validatedData['bio'],
                'role' => $validatedData['role'],
                'avatar' => $imagePath,
            ]);

            return redirect()->route('UserSavePage')->with([
                'message' => 'User Created Successfully',
                'status' => true,
                'error' => ''
            ]);
        } catch (Exception $e) {
            return redirect()->route('UserSavePage')->with([
                'message' => 'User Creation Failed',
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    function update(Request $request){
        //dd('inside user update');
        $user_id = $request->input('id');

        // Remove empty avatar field if it exists
        if ($request->has('avatar') && empty($request->file('avatar'))) {
            $request->request->remove('avatar');
        }

        // Validating the request
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => ['required', 'email', Rule::unique('users')->ignore($user_id)],
            'password' => 'nullable|string|min:8|confirmed',
            'bio' => 'nullable|string|max:500',
            'role' => 'required|in:user,admin',
            'avatar' => 'nullable|image|mimes:jpeg,png,jpg,gif,png|max:2048',
        ]);
        //dd( $request->all() );
        try {
            $user = User::where('id', $user_id)->first();

            if ($request->hasFile('avatar')) {
                // Delete old avatar if it exists
                if ($user->avatar) {
                    Storage::disk('public')->delete($user->avatar);
                }
                $file = $request->file('avatar');
                $fileName = now()->format('YmdHis') . '_' . $file->getClientOriginalName();
                $imagePath = $file->storeAs('user-avatars', $fileName, 'public');
            } else {
                $imagePath = $user->avatar; // Keep the existing avatar
            }

            $updateData = [
                'name' => $validatedData['name'],
                'email' => $validatedData['email'],
                'bio' => $validatedData['bio'],
                'role' => $validatedData['role'],
                'avatar' => $imagePath,
            ];

            // Only update password if provided
            if (!empty($validatedData['password'])) {
                $updateData['password'] = Hash::make($validatedData['password']);
            }

            $user->update($updateData);

            $data = ['message' => 'User Updated Successfully', 'status' => true, 'error' => ''];
        } catch (Exception $e) {
            $data = ['message' => 'User Update Failed', 'status' => false, 'error' => $e->getMessage()];
        }

        return redirect()->route('UserSavePage')->with($data);
    }

    function delete(Request $request){
        try {
            $user_id = $request->id;
            $user = User::where('id', $user_id)->first();

            if ($user->avatar && Storage::disk('public')->exists($user->avatar)) {
                Storage::disk('public')->delete($user->avatar);
            }
            
            $user->delete();

            $data = ['message' => 'User Deleted Successfully', 'status' => true, 'error' => ''];
            return redirect()->route('UserPage')->with($data);

        } catch (Exception $e) {
            $data = ['message' => 'User Deletion Failed', 'status' => false, 'error' => ''];
            return redirect()->route('UserPage')->with($data);
        }
    }
}
