<?php

namespace App\Http\Controllers\Admin;

use Exception;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Subscriber;

class SubscriberController
{
    function SubscriberPage(Request $request)
    {
        $list = Subscriber::orderBy('id','desc')->get();
        return Inertia::render('Admin/Subscriber/SubscriberPage',['list'=>$list]);
    }

    function SubscriberSavePage(Request $request)
    {
        $subscriber_id = $request->query('id');
        $list = Subscriber::where('id', $subscriber_id)->first();
        return Inertia::render('Admin/Subscriber/SubscriberSavePage',['list'=>$list]);
    }

    function create(Request $request){
        // Validating the request
        $validatedData = $request->validate([
            'email' => 'required|email|unique:subscribers,email',
        ]);

        try {
            Subscriber::create([
                'email' => $validatedData['email'],
            ]);

            return redirect()->route('SubscriberSavePage')->with([
                'message' => 'Subscriber Created Successfully',
                'status' => true,
                'error' => ''
            ]);
        } catch (Exception $e) {
            return redirect()->route('SubscriberSavePage')->with([
                'message' => 'Subscriber Creation Failed',
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    function update(Request $request){
        $subscriber_id = $request->input('id');
        
        // Validating the request
        $validatedData = $request->validate([
            'email' => 'required|email|unique:subscribers,email,' . $subscriber_id,
        ]);

        try {
            $subscriber = Subscriber::where('id', $subscriber_id)->first();

            $subscriber->update([
                'email' => $validatedData['email'],
            ]);

            $data = ['message' => 'Subscriber Updated Successfully', 'status' => true, 'error' => ''];
        } catch (Exception $e) {
            $data = ['message' => 'Subscriber Update Failed', 'status' => false, 'error' => $e->getMessage()];
        }

        return redirect()->route('SubscriberSavePage')->with($data);
    }

    function delete(Request $request){
        try {
            $subscriber_id = $request->id;
            $subscriber = Subscriber::where('id', $subscriber_id)->first();
            $subscriber->delete();

            $data = ['message' => 'Subscriber Deleted Successfully', 'status' => true, 'error' => ''];
            return redirect()->route('SubscriberPage')->with($data);

        } catch (Exception $e) {
            $data = ['message' => 'Subscriber Deletion Failed', 'status' => false, 'error' => ''];
            return redirect()->route('SubscriberPage')->with($data);
        }
    }
}
