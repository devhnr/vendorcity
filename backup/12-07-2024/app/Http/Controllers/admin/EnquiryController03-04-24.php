<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;

class EnquiryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['packages_data']= DB::table('packages_enquiry')->orderBy('id','DESC')->get();
        
        return view('admin.list_packagesenquiry',$data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function enquiry_details($enquiry_id)
    {
        // echo $enquiry_id;exit;

        $data['packages_enquiry']=DB::table('more_formfields_details')->where('package_inquiry_id',$enquiry_id)->get();

        // echo"<pre>";
        //     print_r($data['packages_enquiry']);
        // echo"</pre>";exit;

       

        return view('admin.list_enquiry_acc_rej',$data);
    }
    public function download($filepath)
    {        
        $Downloads = public_path("upload/enquiry_images/{$filepath}");
        return response()->download($Downloads);
    }
    
}