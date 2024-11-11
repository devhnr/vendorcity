<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class CheckVendor
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
       if (auth()->check()) {
            if (auth()->user()->vendor == 1) {
                return $next($request);
            } else {
                dd('User does not have the "vendor" role.');
            }
        } else {
            dd('User is not authenticated.');
        }

        return abort(403, 'Unauthorized');
    }
}