@include('front.includes.header')
<style type="text/css">
    .myaccount-tab-list {
        display: block;
        margin-right: 30px;
        border: 1px solid #EEEEEE;
    }
    .nav {

        padding-left: 0;
        margin-bottom: 0;
        list-style: none;
    }
    .myaccount-tab-list a {
        font-weight: 500;
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -webkit-align-items: center;
        -ms-flex-align: center;
        align-items: center;
        -webkit-box-pack: justify;
        -webkit-justify-content: space-between;
        -ms-flex-pack: justify;
        justify-content: space-between;
        padding: 14px 20px;

        border-bottom: 1px solid #EEEEEE;
    }
    .my_purchases_box_section .my_purchases_box_inner {
        display: table;
        width: 100%;
    }

    .my_purchases_box_section .custom-back-g-white {
        background: #fafafa;
        padding: 40px 15px;
        margin-bottom: 30px;
    }

    .my_purchases_box_section .my_purchases_box_inner .purchases_top_part {
        display: table;
        width: 100%;
        padding-bottom: 30px;
        border-bottom: 1px solid #cecece;
    }

    .my_purchases_box_section .track_order {
        text-align: right;
    }

    .my_purchases_box_section .track_order a {
        text-decoration: none;
        display: inline-block;
        font-weight: 700;
        font-size: 14px;
        color: #282828;
        border: 1px solid #cecece;
        padding: 10px 20px;
        vertical-align: middle;
    }


    .purchases_item_box .puchases_item_inner ul.purchaseul li.purchaseli.purchaseli_mob_left {
        width: 30%;
        float: left;
    }

    .purchases_item_box .puchases_item_inner ul.purchaseul li.purchaseli {
        margin: 0;
        padding: 0;
        list-style: none;
        vertical-align: top;
        margin-right: 17px;
        margin-bottom: 40px;
    }

    .my_purchases_box_section .my_purchases_box_inner .purchases_bottom_part {
        display: table;
        width: 100%;
        padding-top: 30px;
    }
</style>
@php
    $userData = Session::get('user');

    $wallet_plus_amount = DB::table('front_user_wallet')
        ->where('refer_id', $userData['userid'])
        ->where('added_from',0)
        ->sum('wallet_amount');

    $wallet_minus_amount = DB::table('front_user_wallet')
        ->where('refer_id', $userData['userid'])
        ->where('added_from',1)
        ->sum('order_total');
        
    $plusAmountWallet = $wallet_plus_amount ?? 0;
    $minusAmountWallet = $wallet_minus_amount ?? 0;

    $totalAmountWallet = max($plusAmountWallet - $minusAmountWallet, 0);
@endphp


<div class="body_content">
    <!-- Our LogIn Area -->
    <section class="our-login mt120">

        <div class="container">
            <div class="row">
                <div class="col-lg-4">

                    @include('front.account_sidebar')
                </div>

                <div class="col-lg-8">

                    <div class="tab-content">

                        <div class="your_rewards">
                            <div class="">

                                <div class="col-md-12">
                                    <div class="xin_wallet_total">

                                        <div class="xin_wallet_box">


                                            <div class="fixed_amt_text">
                                                <h3 style="color: #e5097f;">AED.{{ $totalAmountWallet }}</h3>
                                                <p style="font-weight: bold; font-size:20px; line-height: 30px; ">
                                                    Current wallet Balance</p>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>

                            <!-- Single Tab Content End -->

                        </div>
                    </div> <!-- My Account Tab Content End -->
                </div>
            </div>

        </div>
    </section>
</div>


@include('front.includes.footer')
