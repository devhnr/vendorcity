<?php



namespace App\Http\Controllers\admin;



use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Models\admin\Order;

use DB;
use Illuminate\Support\Facades\Mail;

class Ordercontroller extends Controller

{

    /**

     * Display a listing of the resource.

     *

     * @return \Illuminate\Http\Response

     */

    public function index($order_id = '', $status = '')

    {
        $data['error'] = '';

        //$data['subscribe_data'] = Subscribe::orderBy('id','DESC')->get();    

        $query = DB::table('ci_orders')
        ->leftJoin('frontloginregisters', 'ci_orders.user_id', '=', 'frontloginregisters.id')
        //->leftJoin('ci_shipping_address', 'ci_orders.order_id', '=', 'ci_shipping_address.order_id')
        ->select('frontloginregisters.email as user_email', 'frontloginregisters.name as user_name', 'frontloginregisters.mobile as user_mobile',  'ci_orders.*');

    if (!empty($order_id)) {
        $query->where('ci_orders.order_id', $order_id);
    }

    if (!empty($status)) {
        if ($status == 'SUCCESS' || $status == 'FAILED') {
            $query->where('ci_orders.payment_status', $status);
        } else {
            $query->where('ci_orders.order_status', $status);
        }
    }

    $query->orderBy('ci_orders.order_id', 'DESC');

    $orderList = $query->get();

    foreach ($orderList as $order) {
        $itemList = DB::table('ci_order_item')
            ->where('order_id', $order->order_id)
            ->get();

        $total = 0;
        $additionalCost = 0;

        foreach ($itemList as $item) {
            $product = DB::table('packages')
                ->where('id', $item->package_id)
                ->first();

            if($item->product_discount_amount != 0 && $item->product_discount_amount != ''){
                $product_item_price = $item->product_discount_amount;
            }else{
                $product_item_price = $item->package_item_price;
            }

            $total += $product_item_price * $item->package_quantity;
        }

        $order->items = $itemList;
        $order->sub_total = $total;
    }

   $orderList;  

    $data['orders_list'] = $orderList;

    //echo "<pre>";print_r($data);echo"</pre>";exit;  

        return view('admin.list_order',$data);

    }

    function detail($order_id){
        //echo $id;exit;
        $data['error'] = '';

        $query = DB::table('ci_orders')
        ->leftJoin('frontloginregisters', 'ci_orders.user_id', '=', 'frontloginregisters.id')
       ->leftJoin('ci_shipping_address', 'ci_orders.order_id', '=', 'ci_shipping_address.order_id')
        ->select('frontloginregisters.email as user_email', 'frontloginregisters.name as user_name', 'frontloginregisters.mobile as user_mobile',  'ci_orders.*',  'ci_shipping_address.*');

    if (!empty($order_id)) {
        $query->where('ci_orders.order_id', $order_id);
    }

    if (!empty($status)) {
        if ($status == 'SUCCESS' || $status == 'FAILED') {
            $query->where('ci_orders.payment_status', $status);
        } else {
            $query->where('ci_orders.order_status', $status);
        }
    }

    $query->orderBy('ci_orders.order_id', 'DESC');

    $orderList = $query->get();

    foreach ($orderList as $order) {
        $itemList = DB::table('ci_order_item')
            ->where('order_id', $order->order_id)
            ->get();

        $total = 0;
        $additionalCost = 0;

        foreach ($itemList as $item) {
            $product = DB::table('packages')
                ->where('id', $item->package_id)
                ->first();

            if($item->product_discount_amount != 0 && $item->product_discount_amount != ''){
                $product_item_price = $item->product_discount_amount;
            }else{
                $product_item_price = $item->package_item_price;
            }

            $total += $product_item_price * $item->package_quantity;
        }

        $order->items = $itemList;
        $order->sub_total = $total;
    }

    $orderList;  

    $data['order'] = $orderList[0];

//     $sql = $query->toSql();
// echo $sql;

    //echo "<pre>";print_r($query);echo"</pre>";
       //echo "<pre>";print_r($data);echo"</pre>";exit;  

        return view('admin.view_order',$data);
    }

    public function destroy(Request $request)

    {

        $delete_id = $request->selected;

        // echo $delete_id;exit;

        Subscribe::whereIn('id',$delete_id)->delete();

        return redirect()->route('subscribe.index')->with('success','Subscribe has been deleted successfully');

        // $id=$request->id;

        // Subscribe::whereIn('id',$id)->delete();

        // return redirect()->route('subscribe.index');

    }

    function assign_vendor(){
        


        $order_id = $_POST['order_id'];
		
		$ci_order_data = DB::table('ci_orders')
            ->where('order_id', $order_id)
            ->first();

        $ci_order_item_data = DB::table('ci_order_item')
            ->where('order_id', $order_id)
            ->first();


        
        $currentDate = now();

        $vendor_subscription = DB::table('subscription')
                                       ->select('*')
                                       ->where('services', '=', $ci_order_item_data->service_id)
                                       ->whereRaw("FIND_IN_SET(?, sub_service)", [$ci_order_item_data->subservice_id])
                                       ->where('enddate', '>=', $currentDate)
                                        ->groupBy('vendor_id')
                                       ->orderBy('id', 'desc')
                                       ->get();

			//echo "<pre>";print_r($vendor_subscription);echo"</pre>";exit;

        $html = '<select id="vendor_id" name="vendor_id"  class="form-control">';
                
                $html .= "<option value=''>Select Vendor</option>";

                if ($vendor_subscription != '') {
                    for ($i = 0; $i < count($vendor_subscription); $i++) {

                        $vendor_data = DB::table('users')
                                        ->where('id', $vendor_subscription[$i]->vendor_id)
                                        ->where('vendor', 1)
                                        ->where('is_active', 0)
                                        ->first();

                                        //echo "<pre>";print_r($vendor_data);echo"</pre>";
                        if($vendor_data != ''){
							
							 if ($ci_order_data->vendor_id == $vendor_data->id) {
								$selected = "selected";
							} else {
								$selected = "";
							}
				
				
                            $html .= "<option value='" . $vendor_data->id . "'" . $selected . ">" . $vendor_data->name . "</option>";
                        }
                        

                        //echo "<pre>";print_r($vendor_subscription[$i]->vendor_id);echo"</pre>";
                    }
                }

                //exit;

        $html .= "</select>";
        $html .= "<input type='hidden' name='order_id' id='order_id' value='" . $order_id . "'/>";
        echo $html;
        
    }


    function order_vendor_form(){

        //echo "<pre>";print_r($_POST);echo"</pre>";exit;

        $vendor_id = $_POST['vendor_id'];
        $order_id = $_POST['order_id'];

        $vendor_detail = DB::table('users')->where('vendor', 1)->where('id',$vendor_id)->first();

        // echo"<pre>";print_r($vendor_detail);echo"</pre>";exit;

        DB::table('ci_orders')
            ->where('order_id', $order_id)
            ->update(['vendor_id' => $vendor_id]);

      

            $html = '<!doctype html> <html>
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
                    <p>Dear '.$vendor_detail->name.'</p>

                    <p>We are pleased to inform you that a new service booking has been made. Please find the details below:</p>

                    <button class="btn btn-primary" type="button"
                    style="background-color: #1F6EEC;
                    border-color: #1F6EEC;
                    color: #fff;
                    padding: 10px 18px;
                    border-radius: 11px;"><a href="' . route("vendorinquiry.index") . '" style="color:#fff !important; text-decoration:none !important;">View Request</a></button>


                    <p>Please contact the customer as soon as possible to confirm the booking and make any necessary arrangements. If you have any questions or require further assistance, feel free to reach out to us at hello@vendorscity.com. 
                    </p>
                    <pThank you for your prompt attention to this booking. We appreciate your continued partnership and commitment to delivering excellent service to our customers.</p>
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
        $subject = "New Service Booking Alert";
            $to = $vendor_detail->email;
            // $to = $request->email;
            Mail::send([], [], function($message) use($html, $to, $subject) {
                $message->to($to);
                $message->subject($subject);
                $message->from('devang.hnrtechnologies@gmail.com', 'VendorsCity');
                $message->html($html);
            });

        return redirect()->route('order.index')->with('success','Vendor Assign successfully');
    }
	
	public function set_booking_percentage()

    {

        $order_id = $_POST['order_id'];

        $percentage = $_POST['percentage'];

        // echo $id."-".$val;exit;

        DB::table('ci_order_item')->where('id', $order_id)->update(array('subservice_booking_percentage' => $percentage));

        echo "1";

        // return redirect()->route('product.index')->with('success','Set Order has been Updated successfully');

    }

}