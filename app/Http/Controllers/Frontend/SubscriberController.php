<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Mail\SubscriberMail;
use App\Models\Subscriber;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class SubscriberController extends Controller
{
    public function subscribe(Request $request)
    {
        // Validate the email
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|unique:subscribers,email'
        ], [
            'email.required' => 'Email address is required.',
            'email.email' => 'Please enter a valid email address.',
            'email.unique' => 'This email is already subscribed to our newsletter.'
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator->errors());
        }

        try {
            // Save subscriber to database
            $subscriber = Subscriber::create([
                'email' => $request->email
            ]);

            // Send welcome email
            Mail::to($request->email)->send(new SubscriberMail());

            return back()->with('success', 'Thank you for subscribing! Check your email for a welcome message.');

        } catch (\Exception $e) {
            return back()->with('error', 'Something went wrong. Please try again later.');
        }
    }
}
