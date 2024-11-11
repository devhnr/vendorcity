<?php

namespace App\Http\Controllers\front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Symfony\Component\Mime\Email;
use DB;

class FrontvendorController extends Controller
{
    
    public function vendor_database(Request $request,){

        $data['meta_title'] = "";
        $data['meta_keyword'] = "";
        $data['meta_description'] = "";

        $currentDate = now(); 

        // $pagination =DB::table('users')->where('vendor',1)->where('is_active',0)->orderBy('id','DESC')->paginate(1);
        $query = DB::table('users')
        ->leftJoin('subscription', 'users.id', '=', 'subscription.vendor_id')
        ->where('users.vendor', 1)
        ->where('users.is_active', 0)
        ->select('users.id as user_id', 'users.city as user_city','users.*', 'subscription.*');

        // $sql = $query->toSql();
        // echo "SQL Query: $sql\n";

        // // Fetch and print the results
        // $results = $query->get();
        // foreach ($results as $item) {
        //     print_r($item);
        // }
       
        
    
    $services_ids = $request->get('service_id');

    if(isset($services_ids)&& is_array($services_ids) && count($services_ids) > 0){
        $services_ids = array_map('intval', $services_ids);
        $query = $query->whereIn('subscription.services', $services_ids);
        $data['services_ids'] = implode(',', $services_ids);
        //echo "here";
    }else{

        $data['services_ids'] = $services_ids = "";
       // echo "fail";
    }

    $city_ids = $request->get('city_id');

    if(isset($city_ids)&& is_array($city_ids) && count($city_ids) > 0){
        $city_ids = array_map('intval', $city_ids);
        $query = $query->whereIn('users.city', $city_ids);
        $data['city_ids'] = implode(',', $city_ids);
        //echo "here";
    }else{

        $data['city_ids'] = $city_ids = "";
       // echo "fail";
    }

        // $rawSql = $query->toSql();
        // echo "<pre>";print_r($rawSql);echo "</pre>";exit;

    // $bindings = $query->getBindings();

    // $interpolatedSql = vsprintf(str_replace('?', '%s', $rawSql), $bindings);

    // echo $interpolatedSql;
            // $query->toSql();
      

       
        $pagination_new = $query->orderBy('subscription.subscription_name', 'ASC')->groupBy('users.id')->get();

        $data['allvendor'] = $pagination_new;
        $data['services'] = DB::table('services')->where('is_active',0)->get();
        $data['cities'] = DB::table('cities')->get();

        $data['googleReview']=DB::table('googlereviews')->orderBy('id','DESC')->get()->toArray(); 

        //$data['package_cat_ids']  = "";
        // $data['allvendor'] = $pagination;
        // $data['allvendor_count'] = $pagination->total();

      //echo "<pre>";print_r($data);echo "</pre>";exit;

        return view('front.vendor_database',$data);
    }

    
}