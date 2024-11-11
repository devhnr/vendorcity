<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


use DB;

class AdminacceptLeadscontroller extends Controller
{
    //
    public function index()

    {

        $data['package_inquiry_accepted'] = DB::table('package_inquiry_accepted')
                                       ->select('*')
                                       //->where('vendor_id', '=', $userId)
                                       ->where('accept_reject', 0)
                                       ->orderBy('id', 'desc')
                                       ->get();

        // echo"<pre>";print_r($data);echo"</pre>";exit;       

       return view('admin.list_adminaccept_leads',$data);

    }

    
}
