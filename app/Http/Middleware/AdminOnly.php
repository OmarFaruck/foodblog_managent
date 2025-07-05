<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class AdminOnly
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $role = $request->session()->get('role', 'default');
        
        if ($role !== 'admin') {
            return redirect('/admin/dashboard')->with([
                'message' => 'Access denied. Admin privileges required.',
                'status' => false,
                'error' => 'You do not have permission to access this page.'
            ]);
        }
        
        return $next($request);
    }
}
