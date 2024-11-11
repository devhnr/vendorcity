<?php

namespace App\Http\Controllers\front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Symfony\Component\Mime\Email;
use App\Models\Admin\City;
use App\Models\Admin\Service;
use App\Models\Admin\Subservice;
use App\Models\Admin\UserPermission;
use Illuminate\Support\Facades\Hash;
use DB;
use Illuminate\Support\Facades\Response;
use Helper;
use Auth;  
use Illuminate\Support\Facades\URL; 


class Homecontroller extends Controller
{
    public function index(){

        $data['service']=DB::table('services')->where('is_active', 0)->orderBy('set_order','ASC')->get();
     // $data['service']=DB::table('services')->orderBy('set_order')->get();
        $data['faq']=DB::table('faqs')->orderBy('id','DESC')->get();   
        $data['googleReview']=DB::table('googlereviews')->orderBy('id','DESC')->get()->toArray();   
        $data['sub_service']=DB::table('subservices')->orderBy('set_order','ASC')->get();
        $data['city']=DB::table('cities')->get();
        $data['meta_title'] = "";
        $data['meta_keyword'] = "";
        $data['meta_description'] = "";    

        // echo "<pre>";print_r($data);echo "</pre>";exit;
    	return view('front.index',$data);
    }
    public function privacy_policy(){

        $data['cms_data']=DB::table('cms')->where('id',2)->first();  

        // $data['meta_title'] = "";
        // $data['meta_keyword'] = "";
        // $data['meta_description'] = "";    

        // echo "<pre>";print_r($data);echo "</pre>";exit;
    	return view('front.privacy_policy',$data);
    }
    public function term_condition(){

        $data['cms_data']=DB::table('cms')->where('id',1)->first();  

        // $data['meta_title'] = "";
        // $data['meta_keyword'] = "";
        // $data['meta_description'] = "";    

        // echo "<pre>";print_r($data);echo "</pre>";exit;
    	return view('front.privacy_policy',$data);
    }

    public function contact(){       
        return view('front.contact');
    }
    public function careers(){       
        return view('front.careers');
    }

    public function blog(){

        $query= DB::table('blogs')->orderBy('id','ASC');
        // echo "<pre>";print_r($data);echo "</pre>";exit;

        
        $pagination =  $query->paginate(10)->withQueryString();

        $data['blog'] = $pagination;
        $data['meta_title'] = "";
        $data['meta_keyword'] = "";
        $data['meta_description'] = "";

        $data['recent_blog'] = DB::table('blogs')->orderBy('id', 'DESC')->limit(3)->get()->toArray();
//echo "<pre>";print_r($data);echo "</pre>";exit;
        return view('front.blog_list',$data);
    }
    public function blog_detail($blog_url){

        // echo $blog_page_url;exit;
        $data['blog_detail'] = DB::table('blogs')->where('blog_url',$blog_url)->first();

       
      
        $data['meta_title'] = "";
        $data['meta_keyword'] = "";
        $data['meta_description'] = "";
        return view('front.blog_detail',$data);
    }

    

    public function book_services(){

        
        $data['meta_title'] = "";
        $data['meta_keyword'] = "";
        $data['meta_description'] = "";

        $data['service_data'] = DB::table('services')
                                        ->where('is_active', 0)
                                        ->orderBy('set_order')
                                        ->get();

        $data['service_count'] = $data['service_data']->count();

        return view('front.book_services',$data);
    }

    public function subservices($service_url=''){

        // echo $page_url;exit;
        $data['meta_title'] = "";
        $data['meta_keyword'] = "";
        $data['meta_description'] = "";

        $service_data = Service::where('page_url',$service_url)->first();
        $data['subservice_data'] = Subservice::where('serviceid',$service_data->id)->orderBy('set_order')->get();
       

        // echo "<pre>";print_r($data['subservice_data']);echo "</pre>";exit;

        $data['subservice_count'] = $data['subservice_data']->count();

        return view('front.book_subservices',$data);
    }

    public function become_vendor(){

        $data['permission_data'] = UserPermission::orderBy('id','DESC')->get();       
        $data['city_data'] = City::orderBy('id','DESC')->get();
        
        $data['meta_title'] = "";
        $data['meta_keyword'] = "";
        $data['meta_description'] = "";

        // echo "<pre>";print_r($data);echo "</pre>";exit;
        return view('front.become_vendor',$data);
    } 

    public function vendors_data(Request $request)
    {
    //    echo"<pre>";
    //    print_r($request->post());
    //    echo"</pre>";
       
        $data['role_id']=$_POST['hidden_role_id'];
        $data['name']=$_POST['name'];
        $data['user_name']=$_POST['user_name'];     
        $data['short_description']=$_POST['short_description'];  
        $data['companywebsite']=$_POST['companywebsite'];
        $data['city']=$_POST['city'];
        
        // $data['crole']=$_POST['crole'];
        // $data['parentcname']=$_POST['parentcname'];
        // $data['establishment_date']=$_POST['establishment_date'];
        // $data['tlexpiry']=$_POST['tlexpiry'];
        $data['staff']=$_POST['staff'];
        // $data['remarks']=$_POST['remarks'];
        // $data['socialmedai']=$_POST['socialmedai'];
        $data['password']=Hash::make ($_POST['password']);        
        $data['email']=$_POST['email'];
        if($_POST['mobile'] !='')
        {
            $data['mobile']=$_POST['mobile'];
        }
        else
        {
            $data['mobile']=null;
        }
        if (request()->has('serviceList') && !empty(request()->input('serviceList'))) {
            $serviceList = request()->input('serviceList');
            
            if (is_array($serviceList)) {
                $data['serviceList'] = implode(',', $serviceList);
            } else {               
                $data['serviceList'] = '';
            }
        }
        
        
              
        $data['vendor'] = 1;
        $data['is_active'] = 1;

    //     if ($request->hasFile('vatcertificate')) 
    // {
             
    //     $file = $request->file('vatcertificate');
             
    //     $path = public_path('upload/vendors/');
            
    //     $fileName = uniqid().'.'.$file->getClientOriginalExtension();
       
    //     $file->move($path, $fileName);
        
       
    //     $data['vatcertificate']= $fileName;
           
    // }
    // if ($request->hasFile('trncertificate')) 
    // {
             
    //     $file = $request->file('trncertificate');
             
    //     $path = public_path('upload/vendors/');
            
    //     $fileName = uniqid().'.'.$file->getClientOriginalExtension();
       
    //     $file->move($path, $fileName);
        
       
    //     $data['trncertificate']= $fileName;
        
           
    // }
    // if ($request->hasFile('tradelicense')) 
    // {
             
    //     $file = $request->file('tradelicense');
             
    //     $path = public_path('upload/vendors/');
            
    //     $fileName = uniqid().'.'.$file->getClientOriginalExtension();
       
    //     $file->move($path, $fileName);
        
       
    //     $data['tradelicense']= $fileName;
           
    // }


    // echo"<pre>";
    // print_r($data);
    // echo"</pre>";exit;

   $vendors_id = DB::table('users')->insertGetId($data);

       

    if (count($_POST['poc']) > 0 && $_POST['poc'] != '') {

        for ($i = 0; $i < count($_POST['poc']); $i++) {

            if($_POST['poc'][$i] != '')
            {

                $content['p_id'] = $vendors_id;

                $content['poc'] = $_POST['poc'][$i];

                $content['poctitle'] = $_POST['poctitle'][$i];

                $content['c_email'] = $_POST['c_email'][$i];

                $content['telephone'] = $_POST['telephone'][$i];

                $this->insert_attribute($content);

            }

        }

    }

// Mail Start 
                if(isset($data["vatcertificate"])){
                    $base_url_vat = url('public/upload/vendors/'.$data["vatcertificate"]);
                }
                if(isset($data["trncertificate"])){
                    $base_url_vat = url('public/upload/vendors/'.$data["trncertificate"]);
                }
                if(isset($data["tradelicense"])){
                    $base_url_vat = url('public/upload/vendors/'.$data["tradelicense"]);
                }
                               
               
               

                // $file = public_path("upload/vendors/{$data['vatcertificate']}");

               
                $html = '<!doctype html> <html>        
                <head>
                    <meta charset="utf-8">
                    <title>Registration Email</title>
                    <style>
                        .logo {
                            text-align: center;
                            width: 100%;
                            }

                        .wrapper {
                            width: 100%;
                            max-width:500px;
                            margin:auto;               
                            font-size:14px;
                            line-height:24px;
                            font-family:Helvetica Neue, Helvetica, Helvetica, Arial, sans-serif;
                            color:#555;
                        }

                        .wrapper div {                
                            height: auto;
                            float: left;
                            margin-bottom: 15px;
                            width:100%;
                        }
                        .text-center {
                            text-align: center;                
                        }

                        .email-wrapper {
                            padding:5px;
                            border:1px solid #ccc;
                            width:100%;
                        }

                        .big {

                            text-align: center;

                            font-size: 26px;

                            color: #e31e24;

                            font-weight: bold;

                            margin-bottom: 0 !important;

                            text-transform: uppercase;

                            line-height: 34px;
                        }

                        .welcome {                

                            font-size: 17px;                

                            font-weight: bold;
                        }

                        .footer {

                            text-align: center;

                            color: #999;

                            font-size: 13px;
                        }

                    </style>
                </head>     
                <body>
                    <div class="wrapper" >
                    
                        <div class="logo">
                        <img src="'.asset("public/site/images/VC-FULL-COLOR.png").'" style="max-width: 150px;" >
                        </div>
                        <div class="email-wrapper" >
                            <table style="border-collapse:collapse;" width="100%" border="0" cellspacing="0" cellpadding="10">          
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="5">   
                                            <tr>
                                                <td style="font-size:18px;">Hello ,</td>
                                            </tr>
                                            <tr>
                                                <td style="line-height:20px;">
                                                Please find the below Registration details
                                                </td> 
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="border-top:3px solid #333;" bgcolor="#f7f7f7" width="100%" border="0" cellspacing="0" cellpadding="5">   
                                            <tr>
                                                <td width="50%">        
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="5"> '; 
                                                        if(isset($data['name']) && $data['name']>0 && $data['name']!=""){
                                                            
                                                            $html .= ' <tr><td>Name: </td><td>'.$data['name'].'</td></tr>';
                                                        }
                                                        if(isset($data["user_name"]) && $data["user_name"]>0 && $data["user_name"] !=""){
                                                            
                                                            $html .= ' <tr><td>User Name: </td><td>'.$data['user_name'].'</td></tr>';
                                                        }
                                                        if(isset($data["email"]) && $data["email"]>0 && $data["email"]!=""){
                                                            
                                                            $html .= ' <tr><td>Email For Login: </td><td>'.$data['email'].'</td></tr>';
                                                        }
                                                        if(isset($data["mobile"]) && $data["mobile"]>0 && $data["mobile"]!=""){
                                                            
                                                            $html .= '<tr><td>Company Mobile No: </td><td>'.$data['mobile'].'</td></tr>';
                                                        }
                                                    if (isset($data['serviceList']) && !empty($data['serviceList'])) {                                                   
                                                        $services = explode(',', $data['serviceList']);                                                      
                                                   
                                                        if (isset($services) && $services != "") {
                                                            $html .= '<tr><td>Services: </td><td>';
                                                            
                                                            foreach ($services as $service) {
                                                                $html .= Helper::servicename($service) . ' ';
                                                            }
                                                            
                                                            $html .= '</td></tr>';
                                                        }
                                                        }
                                                        
                                                        
                                                        if(isset($data["companywebsite"]) && $data["companywebsite"]>0 && $data["companywebsite"]!=""){
                                                            
                                                            $html .= '<tr><td>Company Website: </td><td>'.$data['companywebsite'].'</td></tr>';
                                                        }
                                                        if(isset($data["city"]) && $data["city"]>0 && $data["city"]!=""){
                                                            
                                                            $html .= '<tr><td>Company City: </td><td>'. Helper::cityname($data['city']).'</td></tr>';
                                                        }
                                                        if(isset($data["crole"]) && $data["crole"]>0 && $data["crole"]!=""){
                                                            
                                                            $html .= '<tr><td>Company Role: </td><td>'.$data['crole'].'</td></tr>';
                                                        }
                                                        if(isset($data["parentcname"]) && $data["parentcname"]>0 && $data["parentcname"]!=""){
                                                            
                                                            $html .= '<tr><td>Parent Company Name: </td><td>'.$data['parentcname'].'</td></tr>';
                                                        }
                                                        if(isset($data["establishment_date"]) && $data["establishment_date"] >0 && $data["establishment_date"]!=""){
                                                            
                                                            $html .= '<tr><td>Establishment Date: </td><td>'.$data['establishment_date'].'</td></tr>';
                                                        }                               
                                    
                                                        if(isset($data['vatcertificate'])){
                                                            $html .= ' <tr><td>VAT Certificate: </td><td><a href="' .  route('downloads', ['filename' => $data['vatcertificate']]). '" download>Download VAT Certificate</a></td></tr>';

                                                        }
                                                        if(isset($data['trncertificate'])){
                                                            $html .= ' <tr><td>VAT Certificate: </td><td><a href="' .  route('downloads', ['filename' => $data['trncertificate']]). '" download>Download VAT Certificate</a></td></tr>';

                                                        }
                                                        if(isset($data['tradelicense'])){
                                                            $html .= ' <tr><td>VAT Certificate: </td><td><a href="' .  route('downloads', ['filename' => $data['tradelicense']]). '" download>Download VAT Certificate</a></td></tr>';

                                                        }
                                                        if(isset($data["tlexpiry"]) && $data["tlexpiry"]>0 && $data["tlexpiry"]!=""){
                                                            
                                                            $html .= '<tr><td>TL expiry date: </td><td>'.$data['tlexpiry'].'</td></tr>';
                                                        }
                                                        if(isset($data["staff"]) && $data["staff"]>0 && $data['staff']!=""){
                                                            
                                                            $html .= '<tr><td>No Of Staff: </td><td>'.$data['staff'].'</td></tr>';
                                                        }
                                                        if(isset($data["remarks"]) && $data["remarks"]>0 && $data["remarks"]!=""){
                                                            
                                                            $html .= '<tr><td>Remarks: </td><td>'.$data['remarks'].'</td></tr>';
                                                        }
                                                        if(isset($data["socialmedai"]) && $data["socialmedai"]>0 && $data["socialmedai"]!=""){
                                                            
                                                            $html .= '<tr><td>Social Media: </td><td>'.$data['socialmedai'].'</td></tr>';
                                                        }
                                                        
                                                        if(isset($_POST["poc"]) && !empty($_POST["poc"]) && count($_POST["poc"]) > 0 && $_POST["poc"] != ""){
                                                            $k=1;
                                                            for ($j = 0; $j < count($_POST['poc']); $j++) {
                                                                $html .= 'More Detais '.$k;
                                                                $html .= '<tr><td width="100px">Poc: </td><td>'.$_POST["poc"][$j].'</td></tr>';
                                                                $html .= '<tr><td width="100px">Poc Title: </td><td>'.$_POST["poctitle"][$j].'</td></tr>';
                                                                $html .= '<tr><td width="100px">Company Email </td><td>'.$_POST["c_email"][$j].'</td></tr>';
                                                                $html .= '<tr><td width="100px">Company telephone </td><td>'.$_POST["telephone"][$j].'</td></tr>';
                                                                $k++;
                                                            }
                                                           
                                                        }
                                                        $html .= '                                                       
                                                    </table>
                                                </td>   
                                            </tr>   
                                        </table>
                                    </td>   
                                </tr>
                            </table>
                        </div>
                    </div>
                </body>
                </html>';
                
                $subject = "Vendor Registration - VendorsCity";
                $admin = "devang.hnrtechnologies@gmail.com";

                // echo $html;exit;
                // $to =$data['email'];
                // $to = $request->email;
                Mail::send([], [], function($message) use($html, $admin, $subject) {
                $message->to($admin);
                $message->subject($subject);
                $message->from('devang.hnrtechnologies@gmail.com', 'VendorsCity');
                $message->html($html);
                });
                // $user_name= Auth::user()->name;

                $htmll = '<!doctype html> <html>
                <head>
                <meta charset="utf-8">
                <title>Account Registration:</title>
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
                </style>
            </head>
            <body>
                <div class="wrapper">
                    <div class="logo" style="float: inherit;">
                    <img src="'.asset("public/site/images/VC-FULL-COLOR.png").'"" >
                    </div>
                    <div class="email_wrapper">
                        <h2>Hi</h2>
                        <p>Welcome to VendorsCity</p>
                        <p>We"re thrilled to have you on board. Your account has been successfully created, and you"re now ready to explore our wide range of services designed to make your life easier.
                        </p>
                        <p>Here"s what you can do next:</p>
                        <p><span style="font-weight: bolder;">Explore Services:</span> Browse our extensive list of home services to find exactly what you need.</p>
                        <p><span style="font-weight: bolder;">Book Appointments or Request Quotes:</span> Schedule services or Get up to 5 Free Quotes at your convenience with just a few clicks.
                        </p>
                        <p><span style="font-weight: bolder;">Manage Your Account:</span> Update your profile, track your bookings, and manage your preferences easily.</p>
                        <p>If you have any questions or need assistance, our support team is here to help. Visit our Help Center or contact us directly at <a>support@vendorscity.com</a>.</p>

                        <p>Thank you for choosing VendorsCity. We"re excited to help you simplify your life!
                        </p>
                       
                    </div>
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
                                    <a href="">Terms of Use</a>
                                    <a href="">Privacy Policy</a>
                                    <a href="">Contact Us</a>
                                </div>
                                <p>This message was mailed to <a>[suhaanmukadam007@gmail.com] </a>as part of you account registered with us on VendorsCity</p>
                            </div>
                        </div>
                    </div>
                </div>
            </body>
            </html>';
            $subject = "Welcome to " . $data["name"] . "! Your Journey to Hassle-Free Living Starts Here";

    
        // $to =$_POST['email'];
        // $to ='abhishek.hnrtechnologies@gmail.com';
        $to = $request->email;
        Mail::send([], [], function($message) use($htmll, $to, $subject) {
            $message->to($to);
            $message->subject($subject);
            $message->from('devang.hnrtechnologies@gmail.com', 'VendorsCity');
            $message->html($htmll);
        });





// End Mail





   
return redirect()->to('become_vendors')->with('L_strsucessMessage','Vendor Data Added Successfully.');
        
}
public function become_vendors()
{
   return view('front.Wel_become_vendors');
}

    public function downloads($filename)
    {        
        // Build the full path to the file
        $file = public_path("upload/vendors/{$filename}");
        
        // Check if the file exists
        if (!file_exists($file)) {
            return abort(404);
        }
        
        // Generate a response to download the file
        return response()->download($file);
    }
    function insert_attribute($content)
    {

        $data['pid'] = $content['p_id'];
        $data['poc'] = $content['poc'];
        $data['poctitle'] = $content['poctitle'];
        $data['c_email'] = $content['c_email'];
        $data['telephone'] = $content['telephone'];
        DB::table('vendors_attribute')->insertGetId($data);

    }

    function vendors_check_mail(){

        // echo "test";exit;

        $email = $_POST['email']; 

        $result = DB::table('users')
            ->select('*')
            ->where('email', $email)
            ->first();

        if ($result) {
            return 1;
        } else {
            return 0;
        }

            echo $result;
    }

    public function contact_us_data(Request $request)
    {
       $data['fname']=$_POST['fname'];
       $data['lname']=$_POST['lname'];
       $data['email']=$_POST['email'];
       $data['mobile']=$_POST['mobile'];
       $data['message']=$_POST['message'];     
       
       DB::table('contact_us')->insert($data);

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
                </style>
            </head>
            <body>
                <div class="wrapper">
                    <div class="logo" style="float: inherit;">
                    <img src="'.asset("public/site/images/VC-FULL-COLOR.png").'"" >
                    </div>
                    <div class="email_wrapper">
                        <h2>Contact Us</h2>
                        <p>Dear '.$data['fname'].',</p>                 
                        <p>Thank you for contacting us.</p>
                        <p>Our team will get back to you shortly.</p>
                        <p>Thanks & Regards.</p>
                        <p>Team Vendorscity.</p>
                    </div>
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
                                    <a href="">Terms of Use</a>
                                    <a href="">Privacy Policy</a>
                                    <a href="">Contact Us</a>
                                </div>
                                <p>This message was mailed to [suhaanmukadam007@gmail.com] as part of you account registered with us on VendorsCity</p>
                            </div>
                        </div>
                    </div>
                </div>
            </body>
        </html>';
        $subject = "Contact Us";

    //   echo $html;exit;     
        $to = $data['email'];
        Mail::send([], [], function($message) use($html, $to, $subject) {
            $message->to($to,'VendorsCity');
            $message->subject($subject);
            $message->from('devang.hnrtechnologies@gmail.com','VendorsCity');
            $message->html($html);
        });

        $htmll = '<!doctype html> <html>        
        <head>
            <meta charset="utf-8">
            <title>Contact Us Email</title>
            <style>
                .logo {
                    text-align: center;
                    width: 100%;
                    }

                .wrapper {
                    width: 100%;
                    max-width:500px;
                    margin:auto;               
                    font-size:14px;
                    line-height:24px;
                    font-family:Helvetica Neue, Helvetica, Helvetica, Arial, sans-serif;
                    color:#555;
                }

                .wrapper div {                
                    height: auto;
                    float: left;
                    margin-bottom: 15px;
                    width:100%;
                }
                .text-center {
                    text-align: center;                
                }

                .email-wrapper {
                    padding:5px;
                    border:1px solid #ccc;
                    width:100%;
                }

                .big {

                    text-align: center;

                    font-size: 26px;

                    color: #e31e24;

                    font-weight: bold;

                    margin-bottom: 0 !important;

                    text-transform: uppercase;

                    line-height: 34px;
                }

                .welcome {                

                    font-size: 17px;                

                    font-weight: bold;
                }

                .footer {

                    text-align: center;

                    color: #999;

                    font-size: 13px;
                }

            </style>
        </head>     
        <body>
            <div class="wrapper" >
            
                <div class="logo">
                <img src="'.asset("public/site/images/VC-FULL-COLOR.png").'" style="max-width: 150px;" >
                </div>
                <div class="email-wrapper" >
                    <table style="border-collapse:collapse;" width="100%" border="0" cellspacing="0" cellpadding="10">          
                        <tr>
                            <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="5">   
                                    <tr>
                                        <td style="font-size:18px;">Hello ,</td>
                                    </tr>
                                    <tr>
                                        <td style="line-height:20px;">
                                        Please find the below Contact Us Details
                                        </td> 
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="border-top:3px solid #333;" bgcolor="#f7f7f7" width="100%" border="0" cellspacing="0" cellpadding="5">   
                                    <tr>
                                        <td width="50%">        
                                            <table width="100%" border="0" cellspacing="0" cellpadding="5"> '; 
                                                if(isset($data['fname']) && $data['fname']>0 && $data['fname']!=""){
                                                    
                                                    $htmll .= ' <tr><td>First Name: </td><td>'.$data['fname'].'</td></tr>';
                                                }
                                                if(isset($data["lname"]) && $data["lname"]>0 && $data["lname"] !=""){
                                                    
                                                    $htmll .= ' <tr><td>Last Name: </td><td>'.$data['lname'].'</td></tr>';
                                                }
                                                if(isset($data["email"]) && $data["email"]>0 && $data["email"]!=""){
                                                    
                                                    $htmll .= ' <tr><td>Email: </td><td>'.$data['email'].'</td></tr>';
                                                }
                                                if(isset($data["mobile"]) && $data["mobile"]>0 && $data["mobile"]!=""){
                                                    
                                                    $htmll .= '<tr><td>Mobile: </td><td>'.$data['mobile'].'</td></tr>';
                                                }
                                                if(isset($data["message"]) && $data["message"]>0 && $data["message"]!=""){
                                                    
                                                    $htmll .= '<tr><td>Message: </td><td>'.$data['message'].'</td></tr>';
                                                }
                                            
                                                $htmll .= '                                                       
                                            </table>
                                        </td>   
                                    </tr>   
                                </table>
                            </td>   
                        </tr>
                    </table>
                </div>
            </div>
        </body>
        </html>';
        
        $subject = "Contact Us - VendorsCity";
        $admin = "devang.hnrtechnologies@gmail.com";

        // echo $html;exit;
        // $to =$data['email'];
        // $to = $request->email;
        Mail::send([], [], function($message) use($htmll, $admin, $subject) {
        $message->to($admin);
        $message->subject($subject);
        $message->from('devang.hnrtechnologies@gmail.com', 'VendorsCity');
        $message->html($htmll);
        });

        
        return redirect()->to('contact')->with('L_strsucessMessage','Contact Us Added Successfully.');
    }

    
    
}