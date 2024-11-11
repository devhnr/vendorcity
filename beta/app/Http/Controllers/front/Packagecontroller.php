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
        // print_r($request->search_city);
        // echo"</pre>";
        // exit;

        $data['banner_subservices'] = DB::table('subservices')->where('page_url', $page_url)->first();

        $search_city_id = session('search_city_id');

        $query = DB::table('packages')
                ->select('packages.*', 'services.id as ser_id', 'services.servicename as ser_name', 'services.title as ser_title', 'services.sub_title as ser_sub_title')
                ->leftJoin('services', 'packages.service_id', '=', 'services.id')
                ->where(function ($query) use ($search_city_id) {
                    $query->whereRaw('FIND_IN_SET(?, services.city)', [$search_city_id])
                        ->orWhereNull('services.city');
                });
       
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


            $pagination = $query->orderBy('packages.set_order')->get();     

            $search_city_id = session('search_city_id');

            $data['package_data'] = $pagination;
            $data['package_count'] = $pagination->count();

            // if(!empty($search_city_id)){
            //     if($search_city_id == 17){
            //         $data['package_data'] = $pagination;
            //         $data['package_count'] = $pagination->count();
            //     }else{
            //         $data['package_data'] = "";
            //         $data['package_count'] = 0;
            //     }
            // }else{
            //     $data['package_data'] = "";
            //     $data['package_count'] = 0;
            // }
            
            // if(isset($request->search_city)){
                
            //     if($request->search_city == 17){
            //        $data['package_data'] = $pagination;
            //     }else{
            //          $data['package_data'] = "";
                    
            //     }
            // }else{
            //     $data['package_data'] = $pagination;
            // }   
            
            $data['package_pagination'] = $pagination;
            // $data['package_count'] = $pagination->count();
            $data['subservice_data'] = DB::table('subservices')->where('serviceid',$service_data)->get();
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


        $sub_id = $data['subservices_new']->id;

        $data['faq'] = DB::table('faqs')
                        ->whereRaw('FIND_IN_SET(?, packages)', [$sub_id])
                         ->orderBy('id', 'desc')
                        ->get()->toArray();

        $data['googleReview']=DB::table('googlereviews')->orderBy('id','DESC')->get()->toArray(); 
		
		// echo"<pre>";print_r($data);echo"</pre>";exit;
       
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

        $sub_id = $data['package_detail']->subservice_id;
        $data['faq'] = DB::table('faqs')
                        ->whereRaw('FIND_IN_SET(?, packages)', [$sub_id])
                         ->orderBy('id', 'desc')
                        ->get()->toArray();

        $data['googleReview']=DB::table('googlereviews')->orderBy('id','DESC')->get()->toArray();

       //echo "<pre>";print_r($data);echo "</pre>";exit;     

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

    public function booknow(Request $request,$service_id,$subservice_id){
        // echo $service_id;
        // echo $subservice_id;
        // echo "<pre>";print_r($request->all());echo "</pre>";exit; 

        $userData = Session::get('user');

         if ($userData == ''){
            return redirect()->to('Sign-in');
         }

        $data['error'] = "";
        $data['price_data'] = DB::table('cleanin_subserviceprice')->where('subservice_id',$subservice_id)->first();

        $data['service_id'] = $service_id;
        $data['subservice_id'] = $subservice_id;
        $data['subservice_name'] = \Helper::subservicename(strval($subservice_id));
        //echo "<pre>";print_r($data);echo "</pre>";exit; 
        return view('front.booknow',$data);
    }

    function get_price_cleaning(){

        $price_data = DB::table('cleanin_subserviceprice')
                            ->where('subservice_id',$_POST['service_id'])
                            ->where('hour_value',$_POST['how_many_hours_should_they_stay_value'])
                            ->first();

        
        $service_data = DB::table('subservices')
                            ->where('id',$_POST['service_id'])
                            ->first();

        $data = [
            'status' => 'success',
            'hour_price' => $price_data->hourly_price,
            'cleaning_material_price_per_hour' => $price_data->cleaning_material_price_per_hour,
            'promo_discount' => $service_data->promo_discount,
            'promo_discount_type' => $service_data->discount_type,
        ];

        echo json_encode($data);
        //echo "<pre>";print_r($_POST);echo"</pre>";exit;
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

           // echo "here";exit;

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
        $data['form_type'] = $request->form_type;     



        $package_inquiry = DB::table('packages_enquiry',)->insertGetId($data);

        $package_data_n = DB::table('packages_enquiry',)->where('id',$package_inquiry)->first();

        $service_name = \Helper::servicename($package_data_n->service_id);

        $processed_text = strtoupper(str_replace(' ', '', $service_name));
		
        $year =date('y');
        $data_u['inquiry_id'] = "IQ-".$processed_text."-" . $year ."-". sprintf("%06d", $package_inquiry);
        DB::table('packages_enquiry')->where('id', $package_inquiry)->update($data_u);
		
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

        $packageEnquiryFormId = session('packages_enquiry_form_id');
       
       
	   $package_inquiry_data = DB::table('more_formfields_details')
                                ->where('package_inquiry_id',$packageEnquiryFormId)
                                ->where('form_field_id',17)
                                ->first();
        if(!empty($package_inquiry_data)){

        $form_attributes_data = DB::table('form_attributes')
                                ->where('id',$package_inquiry_data->formfield_value)
                                ->first();


        $city_data = DB::table('cities')
                ->where('name', $form_attributes_data->form_option)
                ->first();

        }

        $package_inquiry_data_new = DB::table('packages_enquiry')
                                ->where('id',$packageEnquiryFormId)
                                ->first();

        if($package_inquiry_data_new->form_type == 'Local Move'){
            $type = 0;
        }else{
            $type = 1;
        }

        // echo "<pre>";print_r($city_data);echo "</pre>";exit;
	   
       $currentDate = now();
      // echo $request->subservice_id;
       if($request->subservice_id != 0){
        //   echo "fff";exit;
           $subscription_vendor_data= $query = DB::table('subscription')
        //    ->where('services',$request->service_id)
            ->where('type_of_package',$type)
           ->whereRaw('FIND_IN_SET(?, services)', [$request->service_id])
           ->whereRaw('FIND_IN_SET(?, sub_service)', [$request->subservice_id]);
           if(!empty($package_inquiry_data)){
            $subscription_vendor_data = $subscription_vendor_data->whereRaw('FIND_IN_SET(?, city)', [$city_data->id]);
           }

           
           
           //->where('enddate', '>=', $currentDate);
           $subscription_vendor_data = $subscription_vendor_data->get();

        //    $rawSql = $query->toSql();
        //    $bindings = $query->getBindings();
        //    $interpolatedSql = vsprintf(str_replace('?', '%s', $rawSql), $bindings);
        //    echo $interpolatedSql;
       }else{

        //    echo "fff77777777";exit;
           $subscription_vendor_data= DB::table('subscription')->where('services',$request->service_id)                
           ->where('enddate', '>=', $currentDate)
           ->get();
       }
       
       $packageEnquiryFormId = session('packages_enquiry_form_id');

        //Session::put('get_quote_session_subservicename', $subservice_name);
      Session::put('get_quote_session_orderid', $packageEnquiryFormId);

    //    echo "<pre>";print_r($subscription_vendor_data);echo "</pre>";exit;

       // echo $request->service_id;

    //    echo "<pre>";print_r($subscription_vendor_data);echo "</pre>";exit;

        $vendor_id_array = array();
        
        if($subscription_vendor_data != '' && !empty($subscription_vendor_data)){
            
            foreach($subscription_vendor_data as $subscription_vendor_val){
                $vendor_id_array[] = $subscription_vendor_val->vendor_id;
                
            }

        }
        

        //echo "<pre>";print_r($vendor_id_array);echo "</pre>";exit;

        

        foreach($vendor_id_array as $vendor_id_array_data){

        //    echo"test-ok";exit;

           
            $vendor_data= DB::table('users')->where('id',$vendor_id_array_data)->where('is_active',0)->first();

            //    echo"<pre>";
            // print_r($vendor_data);
            // echo"</pre>";
            // exit;

            if(!empty($vendor_data)){

          
        
            $vendor_att_email=array();
            $vendor_data_attr= DB::table('vendors_attribute')->where('pid',$vendor_data->id)->get()->toArray();

            // echo"<pre>";
            // print_r($vendor_data_attr);
            // echo"</pre>";
            // exit;
    
        foreach($vendor_data_attr as $attr_data){
            if(!empty($attr_data->c_email)){
                $vendor_att_email[] = $attr_data->c_email;
            }
        }
        //  echo"<pre>";
        //     print_r($vendor_att_email);
        //     echo"</pre>";
        //     exit;
        


        if(!empty($vendor_att_email)){
            $cc = implode(',',$vendor_att_email);
        }else{
            $cc = array();
        }

         
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
            $userdata = Session::get('user');
            $user_name = $userdata['name'];
            $Date = date('d-m-Y');
            // exit;
            //$field_array = array_values($field_array);

                    // echo "<pre>";print_r($field_array);echo "</pre>";exit;     


                // new mail start---------------------------------------------------------------------------------------------

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
                <div class="wrapper" style="width: 100%;max-width:500px;margin:auto;
                            font-size:14px;line-height:24px;
                            font-family:Helvetica Neue, Helvetica, Helvetica, Arial, sans-serif;color:#555;padding:50px 0;">
                    <div class="logo" style="float: inherit;border-bottom: 4px solid #FFD413;">
                    <img src="'.asset("public/site/images/VC-FULL-COLOR.png").'"" style="width: 40%;">
                    </div>
                    <div class="email_wrapper" style="width:100%;margin-top: 18px;font-size: 16px;">
                        
                    <p>Dear '.ucfirst($vendor_data->name).',</p>                 
                    <p>We are excited to inform you that a new customer has requested a quote for '.\Helper::servicename($request->service_id).' on VendorsCity!</p>
                    <p><strong>Request Details:</strong></p>
                    <ul><li style= "list-style-type: disc;margin-bottom: -15px;"> Service Requested : '.\Helper::servicename($request->service_id).'</li>                       
                    <li style= "list-style-type: disc;margin-bottom: -15px;"> Customer Name : '.$user_name.'</li>
                    <li style= "list-style-type: disc";> Request Date : '.$Date.'</li></ul>                        
                    <p><a class="btnlink" href="'.route("vendorinquiry.index").'" style=" background: #0040E6;color: #fff !important;text-decoration: none;width: 100%;display: block;padding: 9px 0;text-align: center;
                        font-size: 16px;border-radius: 9px;">View Request</a></p>

                    <p><strong>What You Need to Do:</strong></p>
                    <ul><li style= "list-style-type: disc;margin-bottom: -15px;"> Log in to your : <a href="'.route("vendorinquiry.index").'">Vendor Portal</a></li>
                    <li style= "list-style-type: disc";> View the full request details and customer information.</li></ul>

                    <p>Submit your quote <strong>within 24 hours</strong>. Please ensure your quote is competitive and detailed to increase your chances of securing the job. If you have any questions or need assistance, feel free to reach out to us at hello@vendorscity.com.</p>
                    <p>Thank you for your prompt attention to this request.</p>
                    </div>
                     <div class="email_footer" style="width:100%;margin-top: 20px;">
                            <h3 style=" font-size: 20px;font-weight: bolder;margin: 0;
                            border-bottom: 3px solid #6B7177;padding-bottom: 20px;
                            margin-bottom: 15px;">The VendorsCity Team</h3>
                            <div class="email_footer_div" style=" width:100%;
                            display: flex; ">
                                <div class="footer_left" style="width: 100px;
                            float: left;">
                                    <img style="width:70%;" src="'.asset("public/site/images/vcfaviconwap.png").'"" >
                                </div>
                                <div class="footer_right" style="margin-left:10px;
                                float: left;">
                                    <p style="margin:0;">Questions? Email <a style="color: #555;" href="mailto:vendors@vendorscity.com">vendors@vendorscity.com</a></p>
                                    <p  style="margin:0;">VendorsCity Portal LLC</p>
                                    <div class="footer_links" style=" margin:10px 0;">
                                <a href="'.url("/terms-of-service").'"  style="width: 100%;color: #555;display: inline-block;">Terms of Use</a>
                                <a href="'.url("/privacy-policy").'"  style="width: 100%;color: #555;display: inline-block;">Privacy Policy</a>
                                <a href="'.url("/contact").'"  style="width: 100%;color: #555;display: inline-block;">Contact Us</a>
                                </div>
                                    <p style="margin:0;">This message was mailed to '.$vendor_data->email.' as part of you account registered with us on VendorsCity</p>
                                </div>
                            </div>
                      </div>
                </div>
            </body>
        </html>';

            // new mail end---------------------------------------------------------------------------------------------

            /* notification sectio start */
            $data_notification['vendor_id'] = $vendor_data->id;
            $data_notification['subject'] = 'New Lead Generated for '.\Helper::servicename($request->service_id).'';
            $data_notification['added_datetime'] = date('Y-m-d h:i:s');

            DB::table('notification')->insert($data_notification);
            /* notification sectio end */
           
            
            $userdata = Session::get('user');
            $user_email = $userdata['email'];
            $user_name = $userdata['name'];

           //  echo $vendor_data->email; 
            // echo $html;
            $subject = " New Quote Request for  " . \Helper::servicename($request->service_id) . " on VendorsCity! Customer Name : ".$user_name."";
                // echo "<pre>";print_r($vendor_att_email);echo "</pre>";exit;

            $to = $vendor_data->email;
            // $ccRecipients = ['support@vendorscity.com'];
            $ccRecipients = explode(',', $cc);
            // $to='mayudin.hnrtechnologies@gmail.com';
          

           //  $bccEmails = ["patelnikul321@gmail.com", "asmit@digitalsadhus.com"];
            Mail::send([], [], function($message) use($html, $to,  $subject, $ccRecipients) {
                $message->to($to,'VendorsCity');
               //  $message->bcc($bccEmails);
                $message->subject($subject);
                $message->from('devang.hnrtechnologies@gmail.com','VendorsCity');
                foreach ($ccRecipients as $ccRecipient) {
                    $message->cc($ccRecipient);
                }
                $message->html($html);
            });
        }

    }
        
} 

    // user email Start

    $userdata = Session::get('user');
    $user_email = $userdata['email'];
    $user_name = $userdata['name'];

    $message_bodyy ='';
 
    $message_bodyy .='<!doctype html>

  
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
    <div class="wrapper" style="width: 100%;max-width:500px;margin:auto;
                    font-size:14px;line-height:24px;font-family:Helvetica Neue, Helvetica, Helvetica, Arial, sans-serif;color:#555;padding:50px 0;">
        <div class="logo"style="float: inherit;border-bottom: 4px solid #FFD413;">
        <img src="'.asset("public/site/images/VC-FULL-COLOR.png").'"" style="width: 40%;"  >
        </div>
        <div class="email_wrapper" style="width:100%;margin-top: 18px;font-size: 16px;" >
            <p>Dear '.$user_name.',</p>
            <p>Thank you for reaching out to VendorsCity! We have received your request for up to 5 free quotes for '. \Helper::servicename($request->service_id) . '.
            </p>
            <p><strong>What Happens Next?</strong></p>

            <p>Our trusted vendors will review your request and will contact you within 2 business days.
            You will receive up to 5 quotes tailored to your specific  ' . \Helper::servicename($request->service_id) . ' needs.
            </p>
            <p><strong>How to Choose the Best Vendor:</strong></p>
            <ul><li style= "list-style-type: disc;margin-bottom: -15px;">Review the quotes you receive.</li>
            <li style= "list-style-type: disc;margin-bottom: -15px;">Check out the vendor ratings and reviews to make an informed decision.</li>
            <li style= "list-style-type: disc";>Select the vendor that best suits your requirements.</li></ul>  
            <p>We are committed to helping you find the best services quickly and easily. If you have any questions or need further assistance, please don&#39;t thesitate to contact us at support@vendorscity.com.
            </p> 
            
            <p>Thank you for choosing VendorsCity!</p>
           
        </div>
          <div class="email_footer" style="width:100%;margin-top: 20px;">
                            <h3 style=" font-size: 20px;font-weight: bolder;margin: 0;
                            border-bottom: 3px solid #6B7177;padding-bottom: 20px;
                            margin-bottom: 15px;">The VendorsCity Team</h3>
                            <div class="email_footer_div" style=" width:100%;
                            display: flex; ">
                                <div class="footer_left" style="width: 100px;
                            float: left;">
                                    <img style="width:70%;" src="'.asset("public/site/images/vcfaviconwap.png").'"" >
                                </div>
                                <div class="footer_right" style="margin-left:10px;
                                float: left;">
                                    <p style="margin:0;">Questions? Email <a style="color: #555;" href="mailto:support@vendorscity.com">support@vendorscity.com</a></p>
                                    <p  style="margin:0;">VendorsCity Portal LLC</p>
                                    <div class="footer_links" style=" margin:10px 0;">
                                <a href="'.url("/terms-of-service").'"  style="width: 100%;color: #555;display: inline-block;">Terms of Use</a>
                                <a href="'.url("/privacy-policy").'"  style="width: 100%;color: #555;display: inline-block;">Privacy Policy</a>
                                <a href="'.url("/contact").'"  style="width: 100%;color: #555;display: inline-block;">Contact Us</a>
                                </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </body>
                </html>';

           
   $subject = " Your Request for Free Quotes on " . \Helper::servicename($request->service_id) . " is Being Processed!";
  
   
//    echo $message_bodyy;exit;

   $to = $user_email;
//    $ccRecipients = ['support@vendorscity.com'];

$ccRecipients = array();
   // $to = "mayudin.hnrtechnologies@gmail.com";
   Mail::send([], [], function($message) use($message_bodyy, $to, $subject,$ccRecipients) {
       $message->to($to);
       $message->subject($subject);
       foreach ($ccRecipients as $ccRecipient) {
        $message->cc($ccRecipient);
    }
       $message->html($message_bodyy);
   });



    // user email End

			
		if(isset($packageEnquiryFormId) && $packageEnquiryFormId != ''){
				
				$data_en_form['name'] = $request->name_new;
				$data_en_form['email'] = $request->email_new;
				$data_en_form['mobile'] = $request->mobile_new;
				
				DB::table('packages_enquiry')->where('id', '=', $packageEnquiryFormId)->update($data_en_form);
				
				session()->forget('packages_enquiry_form_id');
				
				//return redirect()->to('/')->with('L_strsucessMessage', 'Enquiry Form Submitted Successfully');
				
				
		}

        //Session::put('get_quote_session_subservicename', $subservice_name);
    //    Session::put('get_quote_session_orderid', $packageEnquiryFormId);

        $packageEnquiryFormId = session('get_quote_session_orderid');


       $package_data= DB::table('packages_enquiry')->where('id',$packageEnquiryFormId)->first();


       $subservice_name = \Helper::subservicename($package_data->subservice_id);

    $response = array(
        "status" => "success", // or "fail"
        "order_id" => $packageEnquiryFormId, // example ID
        "subservicename" => $subservice_name, // example ID
        "username" => $package_data->name, // example ID
    );
    echo json_encode($response);
		//echo "1";
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