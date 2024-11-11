<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Mail;

use DB;

class Vendorinquirycontroller extends Controller
{
    //
    public function index()

    {

       $data['all_data'] = DB::table('leads')
                            ->where('accept_reject','1')
                            ->orderBy('id', 'desc') // Order by the 'id' column in descending order
                            ->get();

  
                            // $vendor_data = Auth::user();  

        // echo"<pre>";print_r( $data['all_data']);echo"</pre>";exit;       

       return view('admin.list_vendor_inquiry',$data);

    }

    function accept_vendor_inquiry(Request $request){
        //echo "here";exit;
        // echo"<pre>";
        // print_r($request->all());
        // echo"</pre>";exit;

        $inquiryId = $request->input('inquiry_id');
        $vendorId = $request->input('vendor_id');  
        
        $package_data = DB::table('packages_enquiry')->where('id', $inquiryId)->first();

        $package_count = $package_data->count + 1;
        
        DB::table('packages_enquiry')
        ->where('id', $inquiryId)
        ->update([
            'count' => $package_count, 
        ]);

        $data['packages_inquiry_id']=$inquiryId;
        $data['vendor_id'] = $vendorId;
        $data['accept_reject'] = 0;
        $data['added_date'] = date('Y-m-d');

        DB::table('package_inquiry_accepted')->insert($data);



        // $countIsAccept = DB::table('packages_enquiry')        
        //                     ->where('is_accept', 1)
        //                     ->count();
        //                     echo $countIsAccept;exit;

    // Redirect or do something else after the update
    return redirect()->route('vendorinquiry.index')->with('success', 'Inquiry Accept Successfully');
    }
    function accepted_vendor_inquiry($userId,$Inquiry_id){ 
            

        $vendors_id = Crypt::decrypt($userId);
        $enquiry_id = $Inquiry_id;

        $get_more_id = DB::table('package_inquiry_accepted')
        ->where('vendor_id', '=', $vendors_id)
        ->where('packages_inquiry_id', '=', $enquiry_id)
        ->first();

        

        if($get_more_id ==''){
            $package_data = DB::table('packages_enquiry')->where('id', $enquiry_id)->first();


        $package_count = $package_data->count + 1;
        
        DB::table('packages_enquiry')
        ->where('id', $enquiry_id)
        ->update([
            'count' => $package_count, 
        ]);

        $data['packages_inquiry_id']=$enquiry_id;
        $data['vendor_id'] = $vendors_id;
        $data['accept_reject'] = 0;
        $data['added_date'] = date('Y-m-d');

        DB::table('package_inquiry_accepted')->insert($data);



        // $countIsAccept = DB::table('packages_enquiry')        
        //                     ->where('is_accept', 1)
        //                     ->count();
        //                     echo $countIsAccept;exit;

    // Redirect or do something else after the update
   
        return redirect()->route('acceptleads.index')->with('success', 'Inquiry Accept Successfully');

        }else{
            return redirect()->route('acceptleads.index')->with('success', 'You Are Already Inquiry Accepted');
        }
      
       
        
    }

    public function enquiry_details($enquiry_id)
    {
        // echo $enquiry_id;exit;

        $data['packages_enquiry']=DB::table('more_formfields_details')->where('package_inquiry_id',$enquiry_id)->get();

        // echo"<pre>";
        //     print_r($data['packages_enquiry']);
        // echo"</pre>";exit;

       

        return view('admin.list_enquiry_accpet_reject',$data);
    }

    public function enquiry_detailss($enquiry_id)
    {
        // echo $enquiry_id;exit;

        $data['packages_enquiry']=DB::table('more_formfields_details')->where('package_inquiry_id',$enquiry_id)->get();

       
       

        return view('admin.list_enquiry_accpeted',$data);
    }

    public function add_reject_reason(Request $request) {
    

    if($request->reject_reason != "Other" && $request->reject_reason_text ==""){
        $data['reject_reason'] = $request->reject_reason;
    }
    
    if($request->reject_reason == "Other" && $request->reject_reason_text !=""){
        $data['reject_reason']=$request->reject_reason_text;
    }
    
    $data['packages_inquiry_id']=$request->inquiry_id;
    $data['vendor_id']=$request->vendor_id;
    $data['accept_reject'] = 1;
    $data['added_date'] = date('Y-m-d');
        
    DB::table('package_inquiry_accepted')->insert($data);
    return redirect()->route('vendorinquiry.index')->with('success', 'Form Submited Successfully');

    }
    public function accpet_form($package_inquiry_id, $user_id)
    {
                 
        $data['packages_enquiry_data'] = DB::table('packages_enquiry')->where('id',$package_inquiry_id)->first();

        // echo"<pre>";
        // print_r($data['packages_enquiry_data']);
        // echo"</pre>";exit;

        $data['service_data'] = DB::table('service_quote_includes')->where('service_id',$data['packages_enquiry_data']->service_id)->get();

   
        return view('admin.list_accpet_form',$data);

    }
    public function accept_lead_form(Request $request)
    {

        $qoute_includes_id = $request->qoute_includes_id;
        $qoute_include_value = $request->qoute_include_value;
        $qoute_includes_name = $request->qoute_includes_name;


        $userId = Auth::id();

        $inquiryId = $request->input('inquiry_id');
        $vendorId = $userId;  

        $vendor_data= DB::table('users')->where('id',$vendorId)->first();

        

       
        $package_data = DB::table('packages_enquiry')->where('id', $inquiryId)->first();

        //  echo"<pre>";
        // print_r($package_data);
        // echo"</pre>";exit;


        $package_count = $package_data->count + 1;
        
        DB::table('packages_enquiry')
        ->where('id', $inquiryId)
        ->update([
            'count' => $package_count, 
        ]);

        $data['packages_inquiry_id']=$inquiryId;
        $data['vendor_id'] = $vendorId;
        $data['accept_reject'] = 0;
        $data['added_date'] = date('Y-m-d');

       $id_package =  DB::table('package_inquiry_accepted')->insertGetId($data);

       $data_n['accept_lead']=$request->accept_lead;
       $data_n['qoute']=$request->qoute;

        if(!empty($qoute_includes_id)){

            foreach($qoute_includes_id as $key => $value){

                $data_n['package_inquiry_accepted_id']=$id_package;
                $data_n['packages_inquiry_id']=$inquiryId;
                $data_n['vendor_id'] = $vendorId;
                $data_n['qoute_includes_id'] = $value;
                $data_n['qoute_include_value'] = $qoute_include_value[$key];
                $data_n['qoute_includes_name'] = $qoute_includes_name[$key];
                $data_n['added_date'] = date('Y-m-d');

                DB::table('qoute_includes')->insert($data_n);
            }
        }

        $html = '<!doctype html> <html>
            <head>
                <meta charset="utf-8">
                <title>Forget Password Email</title>
                <style>
                    .logo {
                        border-bottom: 4px solid #FFD413;
                    }
                    .logo img{
                        width: 45%;
                    }
                    .wrapper {
                        width: 100%;
                        max-width:500px;
                        margin:auto;
                        font-size:14px;
                        line-height:24px;
                        font-family:Helvetica Neue, Helvetica, Helvetica, Arial, sans-serif;
                        color:#555;
                        padding:50px 0;
                    }   
                    .email_wrapper {
                        width:100%;
                        margin-top: 18px;
                        font-size: 16px;
                    }
                    h2 {
                        font-size: 26px;
                        font-weight: bolder;
                        margin: 0;
                    }
                    .btnlink {
                        background: #0040E6;
                        color: #fff !important;
                        text-decoration: none;
                        width: 100%;
                        display: block;
                        padding: 9px 0;
                        text-align: center;
                        font-size: 16px;
                        border-radius: 9px;
                    }
                    .email_footer {
                        width:100%;
                        margin-top: 20px;
                    }
                    h3 {
                        font-size: 20px;
                        font-weight: bolder;
                        margin: 0;
                        border-bottom: 3px solid #6B7177;
                        padding-bottom: 20px;
                        margin-bottom: 15px;
                    }
                    .email_footer_div {
                        width:100%;
                        display: flex; 
                    }
                    .footer_left {
                        width: 100px;
                        float: left;
                    }
                    .footer_right {
                        margin-left:10px;
                        float: left;
                    }
                    .footer_right p{
                        margin:0;
                    }
                    .footer_links {
                        margin:10px 0;
                    }
                    .footer_links a {
                        width: 100%;
                        color: #555;
                        display: inline-block;
                    }
                    #table_new,#table_new
                    th,
                    #table_new td {
                        border: 1px solid black;
                        border-collapse: collapse;
                    }

                    .custome_td{
                            background-color: #0040E6;
                            color: #fff;
                            padding: 10px 60px 10px 12px;
                            border-bottom-color: #fff !important;
                    }
                    .custome_td_new{
                            padding: 10px 12px;
                    }
                    .cutomer_td{
                        text-align:center;
                        background-color: #0040E6;
                        color: #fff;
                        border-bottom-color: #fff !important;
                    }
                </style>
            </head>
            <body>
                <div class="wrapper">
                    <div class="logo" style="float: inherit;">
                    <img src="'.asset("public/site/images/VC-FULL-COLOR.png").'"" >
                    </div>
                    <div class="email_wrapper">
                        
                    <p>Dear VendorCity Partner,</p>  
                    <p>Thank You for Accepting this request.</p>
                    <p>Below you will find the customer contact details. For your convenience we have also summarized the client requirements as well.</p>
                    <p>Your Quote:</p>
                    <table id="table_new">
                        <tr><td colspan="2" class="cutomer_td">Details</td></tr>
                        <tr>
                            <td class="custome_td">Customer Name:</td>
                            <td class="custome_td_new"> '.$package_data->name.'</td>
                        </tr>
                        <tr>
                            <td class="custome_td">Customer Email:</td>
                            <td class="custome_td_new"> '.$package_data->email.'</td>
                        </tr>
                        <tr>
                            <td class="custome_td">Customer Mobile:</td>
                            <td class="custome_td_new"> '.$package_data->mobile.'</td>
                        </tr>
                    
                    
                    </table>


                   
                    <div class="email_footer">
                        <h3>The VendorsCity Team</h3>
                        <div class="email_footer_div">
                            <div class="footer_left">
                                <img style="width:100%;" src="'.asset("public/site/images/vcfaviconwap.png").'"" >
                            </div>
                            <div class="footer_right">
                                <p>Questions? Email <a style="color: #555;" href="mailto:support@vendorscity.com">support@vendorscity.com</a></p>
                                <p>VendorsCity Portal LLC</p>
                                <div class="footer_links">
                                <a href="'.url("/terms-of-service").'">Terms of Use</a>
                                <a href="'.url("/privacy-policy").'">Privacy Policy</a>
                                <a href="'.url("/contact").'">Contact Us</a>
                                </div>
                                <p>This message was mailed to '.$vendor_data->email.' as part of you account registered with us on VendorsCity</p>
                            </div>
                        </div>
                    </div>
                </div>
            </body>
        </html>';

        // echo $html;exit;

            // new mail end---------------------------------------------------------------------------------------------

           // echo "<pre>";print_r($html);echo "</pre>";exit;
            
           //  echo $vendor_data->email; 
            // echo $html;
            $subject = "Here are your Customer's details ! Customer : $package_data->name";
            $to = $vendor_data->email;
            $ccRecipients = ['support@vendorscity.com'];
            // $to='mayudin.hnrtechnologies@gmail.com';
          

           //  $bccEmails = ["patelnikul321@gmail.com", "asmit@digitalsadhus.com"];
            Mail::send([], [], function($message) use($html, $to,  $subject,$ccRecipients) {
                $message->to($to,'VendorsCity');
               //  $message->bcc($bccEmails);
                $message->subject($subject);
                $message->from('devang.hnrtechnologies@gmail.com','VendorsCity');
                foreach ($ccRecipients as $ccRecipient) {
                    $message->cc($ccRecipient);
                }
                $message->html($html);
            });



    return redirect()->route('vendorinquiry.index')->with('success', 'Inquiry Accept Successfully');

    }
    
}