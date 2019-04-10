<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Intervention\Image\Facades\Image;

class UserController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:api');
    }
    
    public function index()
    {
        return User::latest()->paginate(1);
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
            'password' => 'sometimes|min:8',
            'type' => 'required|string',
            'bio' => 'string|max:255',
        ]);

        if (!empty($request->password)) {
            $request->merge(['password' => Hash::make($request->password)]);
        }

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

    public function UpdateProfile(Request $request)
    {
        $user = auth('api')->user();
        $currentPhoto = $user->photo;

        $this->validate($request,[
            'name' => 'required|string|max:191',
            'email' => 'required|string|max:191|email|unique:users,email,'.$user->id,
            'password' => 'sometimes|required|min:8',
            'type' => 'required|string',
            'bio' => 'required|string|max:255',
        ]);

        if($request->photo != $user->photo){
            $name = time().'.' . explode('/', explode(':', substr($request->photo, 0, strpos($request->photo, ';')))[1])[1];

            Image::make($request->photo)->save(public_path('img/profile/').$name);

            $photo = public_path('img/profile/').$currentPhoto;
            if (file_exists($photo)) {
                unlink($photo);
            }
            
            $user->photo = $name;
        }

        if (!empty($request->password)) {
            $user->password = Hash::make($request->password);
        }


        $user->name = $request->name;
        $user->email = $request->email;
        $user->bio = $request->bio;
        $user->save();
        return ['message' => 'Successfully'];
    }
}
