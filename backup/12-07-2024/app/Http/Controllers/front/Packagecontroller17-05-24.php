<?php

namespace App\Http\Controllers\front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Symfony\Component\Mime\Email;
use DB;
use Session;
use App\Models\admin\Form_filed;
use Illuminate\Support\Facades\Crypt;


class Packagecontroller extends Controller
{
    
    public function package_lists(Request $request, $page_url=''){

        $data['meta_title'] = "";
        $data['meta_keyword'] = "";
        $data['meta_description'] = "";

        $subservices_data = DB::table('subservices')->where('page_url', $page_url)->first();
        $service_data=$subservices_data->serviceid;
        //  echo"<pre>";
        // print_r($subservices_data);
        // echo"</pre>";
        // exit;

        $data['banner_subservices'] = DB::table('subservices')->where('page_url', $page_url)->first();
        

        $query = DB::table('packages');
       
        if($subservices_data != ''){

            if($subservices_data !=''){
                $query = $query->where('subservice_id', $subservices_data->id);
            }
            //  $pagination = DB::table('packages')->where('subservice_id', $subservices_data->id)->orderBy('id', 'desc')->paginate(2);

             if($request->get('filter_price_start') !== null && $request->get('filter_price_end') !== null)
             {
                 $filter_price_start = $request->get('filter_price_start');
                 $filter_price_end = $request->get('filter_price_end');         
      
                 if ($filter_price_start > 0 && $filter_price_end > 0) 
                 {
                  
                      $query = $query->whereBetween('price',[$filter_price_start,$filter_price_end]);
                     
                 }
             }
			 
			 $package_cat_ids  =  $request->get('package_cat');
			   if($package_cat_ids !== null && $request->get('package_cat') !== null){

					$query = $query->whereIn('packagecategory_id', $package_cat_ids);
					$data['package_cat_ids'] = implode(",",$package_cat_ids);
				   
			   }else {
					 $data['package_cat_ids'] = $package_cat_ids = "";
				}
		
            //   $pagination = $query->orderBy('id', 'DESC')->paginate(2)->withQueryString();
             
            // $data['package_data'] = $pagination;
            // $data['package_pagination'] = $pagination;
            // $data['package_count'] = $pagination->total();
            // $data['subservice_data'] = DB::table('subservices')->get();


            $pagination = $query->orderBy('set_order')->get();             
            $data['package_data'] = $pagination;
            $data['package_pagination'] = $pagination;
            $data['package_count'] = $pagination->count();
            $data['subservice_data'] = DB::table('subservices')->get();
			$data['package_category'] = DB::table('package_categories')->get();
            $data['subservices_new'] = $subservices_data;
            $data['services_id'] = $service_data;
 
            $data['max_price'] = DB::table('packages')->max('price'); 
            $data['filter_price_start'] = $request->get('filter_price_start');
            $data['filter_price_end'] = $request->get('filter_price_end');

           
            
        }else{
            $data['package_data'] = '';
            $data['package_count'] = 0;        
        } 

        $data['serach_var'] ="";
		
		// echo"<pre>";print_r($data['subservices_new']);echo"</pre>";exit;
       
        return view('front.package_lists',$data);
    }

    public function package_detail($page_url=''){

        $data['meta_title'] = "";
        $data['meta_keyword'] = "";
        $data['meta_description'] = "";

        $packages_data = DB::table('packages')->where('page_url', $page_url)->first();

        // echo "<pre>";print_r($packages_data);echo "</pre>";exit; 

        if($packages_data != ''){
            $data['package_detail'] =$packages_data;
        }else{
            $data['package_detail'] ="";
        }

        // echo "<pre>";print_r($data);echo "</pre>";exit;     

        return view('front.package_detail',$data);
    }

    public function enquiry(Request $request,$service_id){   
        
        $form_field_data= DB::table('services')->where('id',$service_id)->first();        
        

        $tags = explode(',', $form_field_data->form_fields);
        $data['result1'] = DB::table('form_fileds')->whereIn('id',$tags)->orderBy('set_order')->get()->toArray();
        $data['formFields'] = DB::table('form_fileds')->get()->toArray();

        $tags = explode(',', $form_field_data->form_fields_two);
       
        
        $data['result2'] = DB::table('form_fileds')
                                ->whereIn('id', $tags)
                                ->orderBy('set_order')
                                ->get()
                                ->toArray();

        
        $data['service_id'] = $service_id;
        
        return view('front.enquiry',$data);

    }
    public function enquiry_sub(Request $request,$service_id,$subservice_id){
        
            // if($subservice_id != '31') {
            //     $form_field_data_ser = DB::table('services')->where('id', $service_id)->first();
            // } else {
            //     $form_field_data_ser = array();
            // }
            // $form_field_data_sub = DB::table('subservices')->where('id', $subservice_id)->first();

            // //$form_fields_service = explode(',', $form_field_data_ser->form_fields);
            // $form_fields_service = array();
            // $form_fields_subservice = explode(',', $form_field_data_sub->form_fields);


            // new
            if ($subservice_id != '31') {
                $form_field_data_ser = DB::table('services')->where('id', $service_id)->first();
            } else {
                $form_field_data_ser = null; // Set it to null instead of an empty array
            }
            
            $form_field_data_sub = DB::table('subservices')->where('id', $subservice_id)->first();
            
            $form_fields_service = [];
            $form_fields_subservice = explode(',', $form_field_data_sub->form_fields);
            
            if ($form_field_data_ser) {
                $form_fields_service = explode(',', $form_field_data_ser->form_fields);
            }
            // new
            

            
            $form_fields_merged = array_unique(array_merge($form_fields_service, $form_fields_subservice));
            
            $form_fields_to_use_string = implode(',', $form_fields_merged);
           
            $tags = explode(',', $form_fields_to_use_string); 
        
            $data['result1'] = DB::table('form_fileds')->whereIn('id',$tags)->orderBy('set_order')->get()->toArray();
         

            $data['formFields'] = DB::table('form_fileds')->get()->toArray();
            
            $form_fields_service = array();
            $form_fields_service = explode(',', $form_field_data_ser->form_fields_two ?? '');
            
            $form_fields_subservice = explode(',', $form_field_data_sub->form_fields_two);           
            $form_fields_merged = array_unique(array_merge($form_fields_service, $form_fields_subservice));
            $form_fields_to_use_string = implode(',', $form_fields_merged);            
            $tags2 = explode(',', $form_fields_to_use_string);          
        
            $data['result2'] = DB::table('form_fileds')
                                ->whereIn('id', $tags2)
                                ->orderBy('set_order')
                                ->get()
                                ->toArray();
        // echo "<pre>";print_r($data['result2']);echo "</pre>";exit;           

        
            $data['service_id'] = $service_id;
            $data['subservice_id'] = $subservice_id;


       // echo "<pre>";print_r($data);echo "</pre>";exit;           
        
        return view('front.enquiry_sub',$data);
    }


    public function package_inquiry(Request $request){
        
    //   echo "<pre>";print_r($request->all());echo "</pre>";exit;
		
		$userdata = Session::get('user');

        // echo "<pre>";print_r($userdata);echo "</pre>";

	
		if(isset($userdata)){
			$data['name']=$userdata['name'];
			$data['email']=$userdata['email'];
			$data['mobile']=$userdata['mobile'];
		}

        //$data['name']=$request->name;
        if($request->pakage_id !=''){
            $data['pakage_id']=$request->pakage_id;
        }
        if($request->service_id !=''){
            $data['service_id']=$request->service_id;
        }
        if($request->subservice_id !=''){
            $data['subservice_id']=$request->subservice_id;
        }
        if($request->packagecategory_id !=''){
            $data['packagecategory_id']=$request->packagecategory_id;
        }       
       
        
        //$data['email']=$request->email;
        //$data['mobile']=$request->mobile;
        $data['added_date'] = date('Y-m-d');    



        $package_inquiry=DB::table('packages_enquiry',)->insertGetId($data);
		
		
		Session::put('packages_enquiry_form_id', $package_inquiry);
        
        if ($request->form_field_id != '' && count($request->form_field_id) > 0) {
            foreach ($request->form_field_id as $key => $value) {
                // Check if both form_field_id and formfield_value are not empty
                if (!empty($value) && isset($request->formfield_value[$key])) {
                    $data1['package_inquiry_id'] = $package_inquiry;
                    $data1['form_field_id'] = $value;
                    $data1['formfield_value'] = $request->formfield_value[$key];                

                    DB::table('more_formfields_details')->insert($data1);

                    

                    if ($request->has("formfield_value_more" . $value) && is_array($request->input("formfield_value_more" . $value)))
                     {
                        foreach ($request->input("formfield_value_more" . $value) as $option) 
                        {
                            if ($option != '') 
                            {                               
                               
                                $data_attr['form_id'] = $value;
                                $data_attr['more_form_attributes_id'] = $option; 
                                $data_attr['package_inquiry_id'] = $package_inquiry;               
                                DB::table('more_formfields_details_att')->insert($data_attr);
                            }
                        }
                        
                    }

                }
            }           
        }
        
        
            if ($request->form_field_radio_id_one != '' && count($request->form_field_radio_id_one) > 0) {
           
                foreach($request->form_field_radio_id_one as $key1 => $values1) {

                    $radioVal = $request->form_field_radio_id_one[$key1];

                    if ($request->form_field_radio_id_one[$key1] != '') {

                        $data2['package_inquiry_id'] = $package_inquiry;
                        
                         $data2['form_field_id'] = $request->form_field_radio_id_one[$key1];
                         $data2['formfield_value'] = $request['formfield_radio_'.$radioVal];
                        

                         DB::table('more_formfields_details')->insert($data2);
                    }
                }    
            }
            // if ($request->form_field_radio_id_two != '' && count($request->form_field_radio_id_two) > 0) {
           
            //     foreach($request->form_field_radio_id_two as $key1 => $values1) {

            //         $radioVal = $request->form_field_radio_id_two[$key1];

            //         if ($request->form_field_radio_id_two[$key1] != '') {

            //             $data2['package_inquiry_id'] = $package_inquiry;
                        
            //              $data2['form_field_id'] = $request->form_field_radio_id_two[$key1];
            //              $data2['formfield_value'] = $request['formfield_radio_'.$radioVal];
                        

            //              DB::table('more_formfields_details')->insert($data2);
            //         }
            //     }    
            // }
            
            if ($request->form_field_checkbox_id_one != '' && count($request->form_field_checkbox_id_one) > 0) {
           
                foreach($request->form_field_checkbox_id_one as $key1 => $values1) {                    
                   
                    $ckeckboxVal = $request->form_field_checkbox_id_one[$key1];                    
                    
                    if ($request->form_field_checkbox_id_one[$key1] != '') {

                        $data3['package_inquiry_id'] = $package_inquiry;
                        
                         $data3['form_field_id'] = $request->form_field_checkbox_id_one[$key1];
                         $data3['formfield_value'] = $request['formfield_checkbox_'.$ckeckboxVal];
                         
                         

                        // $data3['formfield_value'] = $request['formfield_checkbox_'.$key1];
                       if($data3['formfield_value'] !=''){

                        $data3['formfield_value'] = implode(",", $data3['formfield_value']);
                        
                       }else{
                        $data3['formfield_value'] = null;
                       }
                        


                        // echo "<pre>";print_r($data123);echo "</pre>";exit;

                         DB::table('more_formfields_details')->insert($data3);
                    }
                }    
            }
              
            // if ($request->form_field_checkbox_id_two != '' && count($request->form_field_checkbox_id_two) > 0) {
           
            //     foreach($request->form_field_checkbox_id_two as $key1 => $values1) {                    
                   
            //         $ckeckboxVal = $request->form_field_checkbox_id_two[$key1];                    
                    
            //         if ($request->form_field_checkbox_id_two[$key1] != '') {

            //             $data3['package_inquiry_id'] = $package_inquiry;
                        
            //              $data3['form_field_id'] = $request->form_field_checkbox_id_two[$key1];
            //              $data3['formfield_value'] = $request['formfield_checkbox_'.$ckeckboxVal];
                         
                         

            //             // $data3['formfield_value'] = $request['formfield_checkbox_'.$key1];
            //            if($data3['formfield_value'] !=''){

            //             $data3['formfield_value'] = implode(",", $data3['formfield_value']);
                        
            //            }else{
            //             $data3['formfield_value'] = null;
            //            }
                        


            //             // echo "<pre>";print_r($data123);echo "</pre>";exit;

            //              DB::table('more_formfields_details')->insert($data3);
            //         }
            //     }    
            // }

            if ($request->form_field_mul_dropdown_id != '' && count($request->form_field_mul_dropdown_id) > 0) {
           
                foreach($request->form_field_mul_dropdown_id as $key1 => $values1) {                    
                   
                    $Multiple_drop_down_Val = $request->form_field_mul_dropdown_id[$key1];                    
                    
                    if ($request->form_field_mul_dropdown_id[$key1] != '') {

                        $data4['package_inquiry_id'] = $package_inquiry;
                        
                         $data4['form_field_id'] = $request->form_field_mul_dropdown_id[$key1];
                         $data4['formfield_value'] = $request['formfield_mul_dropdown_'.$Multiple_drop_down_Val];
                         
                         

                        // $data3['formfield_value'] = $request['formfield_checkbox_'.$key1];
                       if($data4['formfield_value'] !=''){

                        $data4['formfield_value'] = implode(",", $data4['formfield_value']);
                        
                       }else{
                        $data4['formfield_value'] = null;
                       }
                         

                        // echo "<pre>";print_r($data123);echo "</pre>";exit;

                         DB::table('more_formfields_details')->insert($data4);
                    }
                }    
            }

            if(isset($request->form_field_id_image[0]) && $request->form_field_id_image[0] != ''){
            $formImage_id = $request->form_field_id_image[0];
            $formImageValue = $request->file('formfield_Image_value'.$formImage_id);
            //echo "<pre>";print_r($files);echo "</pre>";exit;
            if  ($formImageValue != '') {
               
                foreach($formImageValue as $key1 => $values1){
                    $imageVal = $formImageValue[$key1];

                   
                    if ($formImageValue[$key1] != ''){
                        $data1['package_inquiry_id'] = $package_inquiry;
                        
                        $data1['form_field_id'] = $formImage_id;
                        
                        $images = $formImageValue[$key1];
                       
                        $imageName = time() . '-' . $images->getClientOriginalName();
                        //echo "<pre>";print_r($imageName);echo "</pre>";exit;
                        $destinationPath = public_path('upload/enquiry_images');
                        $images->move($destinationPath, $imageName);
                        
                        $data1['formfield_value'] = $imageName;
                        
                        //echo "<pre>";print_r($data1);echo "</pre>";exit;
                        DB::table('more_formfields_details')->insert($data1);
                    }
                }
             }
            }
			 
			 
			 
			 
			 
            


	
	$userdata = Session::get('user');
	
	if(isset($userdata)){
		return redirect()
                ->route('enquiry', ['service_id' => $data['service_id'], 'subservice_id' => $data['subservice_id']])
		        ->with('L_strsucessMessage', '');
	}else{

        $param_ids = [
                'service_id' => $data['service_id'],
                'subservice_id'  => $data['subservice_id']
            ];

        Session::put('param_ids', $param_ids);
		return redirect()->route('Sign-in');
	}

    }
	
	 public function package_inquiry_new(Request $request){
        
    //    echo "<pre>";print_r($request->post());echo "</pre>";
	   
	   
       $currentDate = now();
       //echo $request->service_id;
       if($request->subservice_id != 0){
        //   echo "fff";exit;
           $subscription_vendor_data= DB::table('subscription')->where('services',$request->service_id)
           ->whereRaw('FIND_IN_SET(?, sub_service)', [$request->subservice_id])
           ->where('enddate', '>=', $currentDate)
           ->get();
       }else{

        //    echo "fff77777777";exit;
           $subscription_vendor_data= DB::table('subscription')->where('services',$request->service_id)                
           ->where('enddate', '>=', $currentDate)
           ->get();
       }
       
       $packageEnquiryFormId = session('packages_enquiry_form_id');


       // echo $request->service_id;

    //    echo "<pre>";print_r($subscription_vendor_data);echo "</pre>";exit;

        $vendor_id_array = array();
        
        if($subscription_vendor_data != '' && !empty($subscription_vendor_data)){
            
            foreach($subscription_vendor_data as $subscription_vendor_val){
                $vendor_id_array[] = $subscription_vendor_val->vendor_id;
                
            }

        }
        

    //    echo "<pre>";print_r($vendor_id_array);echo "</pre>";exit;

        

        foreach($vendor_id_array as $vendor_id_array_data){

        //    echo"test-ok";exit;

           
            $vendor_data= DB::table('users')->where('id',$vendor_id_array_data)->first();
            $vendors_id = Crypt::encrypt($vendor_data->id);

            $form_fields_data= DB::table('more_formfields_details')->where('package_inquiry_id',$packageEnquiryFormId)->get()->toArray();
            
           
             
            if($vendor_data && $vendor_data->is_active == 0){         
               
               $field_array = array();
               foreach ($form_fields_data as $key => $values) {

                //echo "<pre>inner";print_r($values);echo "</pre>";

                
                $form_fields = DB::table('form_fileds')
                    ->select('*')
                    ->where('id', $values->form_field_id)
                    ->first();
                    
                    
                    $packageEnquiryFormId = session('packages_enquiry_form_id');
                    
                    // echo "<pre>";print_r($form_fields);echo "</pre>";              

                    //$key = $form_fields->id . '_' . $form_fields->lable_name;
                // if (!array_key_exists($key, $field_array)) {
                    // Check if the key doesn't exist in the array
                    if ($values->formfield_value != '') {
                        //echo "inner<br>";
                        // If the key doesn't exist, add the entry to the array
                        $field_array[$key] = array('name' => $form_fields->lable_name, 'value' => $values->formfield_value,'id' => $form_fields->id,'mail_send' => $form_fields->mail_send);
                    }
                // }
            }
            // exit;
            //$field_array = array_values($field_array);

                    // echo "<pre>";print_r($field_array);echo "</pre>";exit;     


                $html = '<!doctype html> 
                <html>
                <head>
                    <meta charset="utf-8">
                    <title>Enquiry Details</title>
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
                        <div class="logo" style="float: inherit;">
                        <img src="'.asset("public/site/images/VC-LONG-COLOR.png").'" style="width: 30%;float: inherit;" >
                        </div>
                        <div class="email-wrapper" >
                            <table style="border-collapse:collapse;" width="100%" border="0" cellspacing="0" cellpadding="10">          
                                <tr>
                                    <td>
                                        <table width="100%" border="2" cellspacing="0" cellpadding="5">   
                                            
                                                <th colspan="2">Dear '.ucfirst($vendor_data->name).'</th>
                                                
                                               <tr>
                                                   <th>Name</th>
                                                   <td >'.$vendor_data->name.'</td>
                                               </tr>';
                                               if(isset($data['service_id']) && $data['service_id'] !=''){ 
                                                   $html .='<tr>
                                                   <th>Service</th>
                                                   <td>'.\Helper::servicename($data['service_id']).'</td>
                                               </tr>';
                                               }
                                               if(isset($data['subservice_id']) && $data['subservice_id'] !=''){ 
                                                   $html .='<tr>
                                                   <th>Sub Service</th>
                                                   <td>'.\Helper::subservicename($data['subservice_id']).'</td>
                                               </tr>';
                                               }
                                               if(isset($data['packagecategory_id']) && $data['packagecategory_id'] !=''){ 
                                                   $html .='<tr>
                                                   <th>Package Category</th>
                                                   <td>'.\Helper::packagescategory($data['packagecategory_id']).'</td>
                                               </tr>';
                                               }
                                               if(isset($data['pakage_id']) && $data['pakage_id'] !=''){ 
                                                   $html .='<tr>
                                                   <th>Package</th>
                                                   <td>'.\Helper::packages_enquiry($data['pakage_id']).'</td>
                                               </tr>';
                                               }                                        
                                               

                                            // echo "<pre>";print_r($field_array);echo "</pre>";exit;
                                               
                                               if (!empty($field_array)) {
                                                $i = 0;
                                                foreach ($field_array as $form_field_data) {
                                                if (!empty($form_field_data['mail_send']) && $form_field_data['mail_send'] == '1') {
                                                    
                                                $get_more_id = DB::table('more_formfields_details_att')
                                                ->where('form_id', '=', $form_field_data['id'])
                                                ->where('package_inquiry_id', '=', $packageEnquiryFormId)
                                                ->get()
                                                ->toArray();

                                            // echo "<pre>";print_r($form_field_data);echo "</pre>";




                                                    if ($form_field_data['value'] != '') {
                                                        $html .= '<tr>';
                                                                    if($form_field_data['id'] != $i){
                                                                        $html .= '<th>'. $form_field_data['name'] .'</th>  ';
                                                                    }                                                             

                                                                   if(is_numeric($form_field_data['value']) && $form_field_data['id'] != 30 && $form_field_data['id'] != 60){
                                                                        $html.='<td>'. \Helper::form_fields_attr($form_field_data['value']) .'</td>';
                                                                   }else{
                                                                   
                                                                    $imageExtensions = ['jpg', 'jpeg', 'png', 'gif','jfif'];
                                                                    $extension = pathinfo($form_field_data['value'],PATHINFO_EXTENSION);
                                                                   
                                                                    if (in_array(strtolower($extension), $imageExtensions)) { 
                                                                        // if($form_field_data['id'] == $i){                                                                                                                                              
                                                                        $html .= '<td colspan="2" class="text-center"><a href="' . url('download/' . $form_field_data['value']) . '">Download</a></td>';
                                                                    // }
                                                                    }else{
                                                                        $html.='<td>'.$form_field_data['value'] .'</td>';
                                                                    }                                                        
                                                                
                                                                        
                                                                   }                                                                                                      
                                                                                                                 
                                                                $html.=' </tr>';
                                                    }
                                            // echo "<pre>";print_r($get_more_id);echo "</pre>";
                                                    
                                                    if(isset($get_more_id) && count($get_more_id) > 0){
                                                        foreach ($get_more_id as $get_more_id_data) {    
                                                            $html .= '<tr>';
                                                            if($form_field_data['value'] == 111 && $form_field_data['id'] == 35){
                                                                $html .= '<th> What days of the week would you like the service</th>'; 
                                                            }else{
                                                                $html .= '<th> Type of Home</th>';
                                                            }
                                                             $html .= '                                          
                                                            <td>'. \Helper::form_fields_attr_more($get_more_id_data->more_form_attributes_id) .'</td>                                               
                                                          </tr>';
                                                        }
                                                    }
                                                    

                                                }

                                                $i = $form_field_data['id'];

                                                }
                                            }
                                        
                                $html .=' </table>
                                </td>
                                </tr>';
                                $html .='<tr>
                                <td style="
                                text-align: center;"> <button class="btn btn-primary" type="button"
                                style="background-color: #1F6EEC;
                                border-color: #1F6EEC;
                                color: #fff;
                                padding: 10px 18px;
                                border-radius: 11px;
                            "><a href="' . route("accept_vendor_inquiryy", ["vendors_id" => $vendors_id, "inquiry_id" => $packageEnquiryFormId]) . '" style="color:#fff !important;">Accept</a></button> </td>
                            </tr>';
                                $html .='<tr>
                                                <td><br><br>Regards,<br>VendorsCity Team </td>
                                            </tr>
                            </table>
                        </div>
                    </div>
                </body>
            </html>';

           // echo "<pre>";print_r($html);echo "</pre>";exit;
            
           //  echo $vendor_data->email;
            // echo $html;
            $subject = "Enquiry Details";
            $to = $vendor_data->email;
            // $to='mayudin.hnrtechnologies@gmail.com';
          

           //  $bccEmails = ["patelnikul321@gmail.com", "asmit@digitalsadhus.com"];
            Mail::send([], [], function($message) use($html, $to,  $subject) {
                $message->to($to,'VendorsCity');
               //  $message->bcc($bccEmails);
                $message->subject($subject);
                $message->from('devang.hnrtechnologies@gmail.com','VendorsCity');
                $message->html($html);
            });
        }
        
} 

			
		if(isset($packageEnquiryFormId) && $packageEnquiryFormId != ''){
				
				$data_en_form['name'] = $request->name_new;
				$data_en_form['email'] = $request->email_new;
				$data_en_form['mobile'] = $request->mobile_new;
				
				DB::table('packages_enquiry')->where('id', '=', $packageEnquiryFormId)->update($data_en_form);
				
				session()->forget('packages_enquiry_form_id');
				
				//return redirect()->to('/')->with('L_strsucessMessage', 'Enquiry Form Submitted Successfully');
				
				
		}
		echo "1";
	 }
     function change_drop_down(Request $request)
     {

        $form_id = $request->form_id;
        $form_inner_id = $request->form_inner_id;

        $get_data = DB::table('more_form_attributes')
        ->where('form_id', '=', $form_id)
        ->where('attr_id', '=', $form_inner_id)
        ->get();
        $html ="";
        if(isset($get_data) && count($get_data) > 0){
            $html.='<label class="form-label fw500 dark-color"
            for="country">What is the size of your home?</label>';
            if($form_id == 35 && $form_inner_id == 111){
                $html.='<select class="form-control multiple" id="formfield_value_test" name="formfield_value_more'.$form_id.'[]" multiple="multiple">';
            }else{
                $html.='<select class="form-control" id="formfield_value_test" name="formfield_value_more'.$form_id.'[]">';
            }
            
            $html.='<option value="">Select </option>';
            foreach($get_data as $get_data_new){

                $html .= '<option value="' . $get_data_new->id . '">' . $get_data_new->more_form_option . '</option>';
    // echo "<pre>";
    // print_r($get_data_new);
    // echo "</pre>";
            }
            $html.='</select>';

            
        }
        echo $html;
    // Output the retrieved data
    
        //exit;
     }
     function change_drop_down_two(Request $request)
     {

        $form_id = $request->form_id;
        $form_inner_id = $request->form_inner_id;

        $get_data = DB::table('more_form_attributes')
        ->where('form_id', '=', $form_id)
        ->where('attr_id', '=', $form_inner_id)
        ->get();
        $html ="";
        if(isset($get_data) && count($get_data) > 0){
            $html.='<select class="form-control" id="formfield_value_test" name="formfield_value_more'.$form_id.'[]">';
            $html.='<option value="">Select </option>';
            foreach($get_data as $get_data_new){
                $html .= '<option value="' . $get_data_new->id . '">' . $get_data_new->more_form_option . '</option>';
    // echo "<pre>";
    // print_r($get_data_new);
    // echo "</pre>";
            }
            $html.='</select>';

            
        }
        echo $html;
    // Output the retrieved data
    
        //exit;
     }
     public function download($filepath)
    {        
        $Downloads = public_path("upload/enquiry_images/{$filepath}");
        return response()->download($Downloads);
    }
    
}