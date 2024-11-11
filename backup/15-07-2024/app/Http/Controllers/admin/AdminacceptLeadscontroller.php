<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


use DB;

class AdminacceptLeadscontroller extends Controller
{
    //
    public function enquiry_accept(Request $request)

    {
         $query = DB::table('package_inquiry_accepted')
                                       ->select('*')
                                       //->where('vendor_id', '=', $userId)
                                       ->where('accept_reject', 0);
                                       
        $data['filter_vendor_id'] = "";
        if($request->action == 'filter'){
            $query->where('vendor_id',$request->vendor_id);
            $data['filter_vendor_id'] =$request->vendor_id;
        }

        $data['package_inquiry_accepted'] = $query->orderBy('id', 'desc')->get();
        $data['all_vendor'] = DB::table('users')->where('vendor',1)->where('is_active',0)->get()->toArray();

             

       return view('admin.list_adminaccept_leads',$data);

    }

    public function enquiry_reject(Request $request)

    {
         $query = DB::table('package_inquiry_accepted')
                                       ->select('*')
                                       //->where('vendor_id', '=', $userId)
                                       ->where('accept_reject', 1);
                                       
        $data['filter_vendor_id'] = "";
        if($request->action == 'filter'){
            $query->where('vendor_id',$request->vendor_id);
            $data['filter_vendor_id'] =$request->vendor_id;
        }

        $data['package_inquiry_accepted'] = $query->orderBy('id', 'desc')->get();
        $data['all_vendor'] = DB::table('users')->where('vendor',1)->where('is_active',0)->get()->toArray();

             

       return view('admin.list_adminreject_leads',$data);

    }

    
}
