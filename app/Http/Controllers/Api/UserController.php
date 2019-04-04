<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:api');
    }
    
    public function index()
    {
        return User::latest()->paginate(10);
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'name' => 'required|string|max:191',
            'email' => 'required|string|max:191|email|unique:users',
            'password' => 'required|min:6',
            'type' => 'required|string',
            'bio' => 'string|max:255',
        ]);

        return User::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'password' => Hash::make($request['password']),
            'type' => $request['type'],
            'bio' => $request['bio'],
            'photo' => 'default.png'
        ]);
    }

   
    public function show($id)
    {
       
    }

   
    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id);

        $this->validate($request,[
            'name' => 'required|string|max:191',
            'email' => 'required|string|max:191|email|unique:users,email,'.$user->id,
            'password' => 'sometimes|min:6',
            'type' => 'required|string',
            'bio' => 'string|max:255',
        ]);

        $user->update($request->all());

        return ['message' => 'User Info Updated Successfully.'];
    }

    
    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $user->delete();

    }

    public function profile()
    {
        return auth('api')->user();
    }
}
