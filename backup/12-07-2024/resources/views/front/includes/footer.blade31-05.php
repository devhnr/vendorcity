<!-- Our Footer -->
<section class="footer-style1 at-home5 pt25 pb-0" style="background-color: #0040E6;">
    <div class="container">
        <div class="row bdrb1 pb10 mb60">
            <div class="col-md-7">
                <div
                    class="d-block text-center text-md-start justify-content-center justify-content-md-start d-md-flex align-items-center mb-3 mb-md-0">
                    <a class="fz17 fw500 mr15-md mr30" href="{{ route('term_condition') }}" style="color: #fff;">Terms of Service</a>
                    <a class="fz17 fw500 mr15-md mr30" href="{{ route('privacy_policy') }}" style="color: #fff;">Privacy Policy</a>
                    <a class="fz17 fw500" href="" style="color: #fff;">Site Map</a>
                </div>
            </div>
            <div class="col-md-5">
                <div class="social-widget text-center text-md-end">
                    <div class="social-style1 light-style2">
                        <a class="me-2 fw500 fz17" href="" style="color: #fff;">Follow us</a>
                        
						<a href="https://www.facebook.com/myvendorscity" target="_blank">
						<i class="fab fa-facebook-f list-inline-item" style="color: #fff;"></i>
						</a>
						
                        <a href="https://x.com/myvendorsCity" target="_blank" style="padding: 0 10px 0px 10px;">
						<img src="{{ asset('/public/site/images/twitter.png') }}"
                                style="height: 15px;width: 16px;margin-top: -4px;">
                        </a>
						
                        {{-- <a href=""><i class="fa-brands fa-square-x-twitter list-inline-item"></i></a> --}}
                        
						<a href="https://www.instagram.com/myvendorscity/" target="_blank">
						<i class="fab fa-instagram list-inline-item" style="color: #fff;"></i>
						</a>
						
                        <a href="https://www.linkedin.com/company/vendorscity/" target="_blank">
						<i class="fab fa-linkedin-in list-inline-item" style="color: #fff;"></i>
						</a>
						
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6 col-lg-3">
                <div class="link-style1 light-style at-home8 mb-4 mb-sm-5">
                    <h4 class="mb15" style="color: #fff;">About VendorCity</h4>
                    <div class="link-list">
                        <a href="{{ route('careers') }}" style="color: #eee;">Careers</a>
                        <!-- <a href="">Press & News</a>
                        <a href="">Partnerships</a> -->
                        <a href="{{ route('privacy_policy') }}" style="color: #eee;">Privacy Policy</a>
                        <a href="{{ route('term_condition') }}" style="color: #eee;">Terms of Service</a>
                    </div>
                </div>
            </div>
            @php
                $service_data = DB::table('services')->where('is_active', 0)->orderBy('set_order')->get();
            @endphp
            <div class="col-sm-6 col-lg-3">
                <div class="link-style1 light-style at-home8 mb-4 mb-sm-5">
                    <h4 class="mb15" style="color: #fff;">Categories</h4>
                    <ul class="ps-0">
                        @foreach ($service_data as $service)
                            <li><a href="{{ url('service/' . $service->page_url) }}"
                                    style="text-decoration: none;color: #eee;">{{ $service->servicename }}</a>
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>
            <div class="col-sm-6 col-lg-3">
                <div class="link-style1 light-style at-home8 mb-4 mb-sm-5">
                    <h4 class="mb15" style="color: #fff;">Support</h4>
                    <ul class="ps-0">
                        <li><a href="" style="color: #eee;">Help & Support</a></li>
                        <li><a href="" style="color: #eee;">Trust & Safety</a></li>
                        <li><a href="" style="color: #eee;">Selling on Vendorscity</a></li>
                        <li><a href="" style="color: #eee;">Buying on Vendorscity</a></li>
                        <li><a href="{{ route('contact') }}" style="color: #eee;">Contact</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-6 col-lg-3">
                <div class="link-style1 light-style at-home8 mb-4 mb-sm-5">
                    <h4 class="mb15" style="color: #fff;">Contact Us</h4>
                    <ul class="ps-0">
                        <li style="color: #eee;">056 836 3677</li>
                        <li><a href="mailto:support@vendorscity.com" style="color: #eee;">support@vendorscity.com</a></li>
                    </ul>
                </div>
            </div>
           
        </div>
    </div>
    <div class="container bdrt1 py-4">
        <div class="row">
            <div class="col-md-12">
                <div class="text-center">
                <p class="copyright-text mb-2 mb-md0 text-dark-light ff-heading" style="color: #eee;">© VendorsCity {{ date('Y') }}. All rights reserved.</p>
                </div>
            </div>
            <!-- <div class="col-md-6">
            <div class="footer_bottom_right_btns at-home8 text-center text-lg-end">
              <ul class="p-0 m-0">
                <li class="list-inline-item bg-white">
                  <select class="selectpicker show-tick">
                    <option>US$ USD</option>
                    <option>Euro</option>
                    <option>Pound</option>
                  </select>
                </li>
                <li class="list-inline-item bg-white">
                  <select class="selectpicker show-tick">
                    <option>English</option>
                    <option>Frenc</option>
                    <option>Italian</option>
                    <option>Spanish</option>
                    <option>Turkey</option>
                  </select>
                </li>
              </ul>
            </div>
          </div> -->
        </div>
    </div>
</section>
<a class="scrollToHome" href="#" style="background: #fff;"><i class="fas fa-angle-up" style="color: #000;"></i></a>

</div>
</div>
<!-- Wrapper End -->
<script src="{{ asset('public/site/js/jquery-3.6.4.min.js') }}"></script>
@if (Session::get('L_strsucessMessage') != '')
    <script>
        (function($) {
            $(document).on('ready', function() {
                document.getElementById('message_succsess').innerHTML =
                    "{{ Session::get('L_strsucessMessage') }}";
                setTimeout(function() {
                    $("#message_succsess").show('blind', {}, 500)
                }, 5000);
                setTimeout(function() {
                    $("#message_succsess").hide('blind', {}, 900)
                }, 9000);
            });
        })(window.jQuery);
    </script>
@endif


<script src="{{ asset('public/site/js/jquery-migrate-3.0.0.min.js') }}"></script>
<script src="{{ asset('public/site/js/popper.min.js') }}"></script>
<script src="{{ asset('public/site/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('public/site/js/bootstrap-select.min.js') }}"></script>
<script src="{{ asset('public/site/js/jquery.mmenu.all.js') }}"></script>
<script src="{{ asset('public/site/js/ace-responsive-menu.js') }}"></script>
<script src="{{ asset('public/site/js/jquery-scrolltofixed-min.js') }}"></script>
<script src="{{ asset('public/site/js/wow.min.js') }}"></script>
<script src="{{ asset('public/site/js/owl.js') }}"></script>
<script src="{{ asset('public/site/js/jquery.counterup.js') }}"></script>
<script src="{{ asset('public/site/js/isotop.js') }}"></script>
<script src="{{ asset('public/site/js/scrollbalance.js') }}"></script>
<!-- Custom script for all pages -->
<script src="{{ asset('public/site/js/script.js') }}"></script>

<!-- Select2 JS -->

<script src="{{ asset('public/site/js/select2.min.js') }}"></script>

<script type="text/javascript">
    function remove_to_cart(rowId) {

        var answer = window.confirm("Do you want to remove this Package from cart?");

        if (answer) {
            var url = '{{ url('cart_remove') }}';
            $.ajax({
                url: url,
                type: 'post',
                data: {
                    "_token": "{{ csrf_token() }}",
                    "rowId": rowId
                },
                success: function(msg) {

                    if (msg != '') {
                        $("#message_error").html("Package Removed From Cart");
                        $('#message_error').show().delay(0).fadeIn('show');
                        $('#message_error').show().delay(2000).fadeOut('show');
                        $("#mydiv_pc").load(location.href + " #mydiv_pc");
                        //  $("#header_cart").load(location.href + " #header_cart");
                        // $("#header_cart_count").load(location.href + " #header_cart_count");
                        return false;
                    }

                }

            });
        }
    }

    function add_to_cart(package_id) {

        var qty = 1;

        $.ajax({

            type: 'POST',
            url: '{{ url('add_to_cart ') }}',
            data: {

                "_token": "{{ csrf_token() }}",
                'qty': qty,
                'package_id': package_id,

            },

            success: function(msg) {
                if (msg != 0) {
                    // $("#header_cart").load(location.href + " #header_cart");
                    // $("#header_cart_count").load(location.href + " #header_cart_count");
                    // $("#message_succsess").html("Package Added To Cart");
                    // $('#message_succsess').show().delay(0).fadeIn('show');
                    // $('#message_succsess').show().delay(2000).fadeOut('show');
                    $(".addtocart-btn_" + package_id).hide();
                    $(".loader-test_" + package_id).show();
                    setTimeout(function() {
                        window.location.href = "{{ route('cart') }}";
                        $(".addtocart-btn_" + package_id).show();
                        $(".loader-test_" + package_id).hide();
                    }, 2000);
                    return false;
                }
            }
        });

    }

    function validation_subs() {

        var email = $("#subs_email").val();
        if (email == '') {
            $("#validation_error").html("Please Enter Email Address");
            $('#validation_error').show().delay(0).fadeIn('show');
            $('#validation_error').show().delay(2000).fadeOut('show');
            return false;
        }

        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (!filter.test(email)) {
            jQuery('#validation_error').html("Please Enter Valid E-mail.");
            jQuery('#validation_error').show().delay(0).fadeIn('show');
            jQuery('#validation_error').show().delay(2000).fadeOut('show');
            return false;
        }

        var url = "{{ url('check_email') }}";

        $.ajax({
            url: url,
            type: 'post',
            data: {
                '_token': '{{ csrf_token() }}',
                'email': email
            },
            success: function(returndata) {
                //alert(returndata);
                if (returndata == 0) {
                    $("#validation_error").html("Email Address Already Exists");
                    $('#validation_error').show().delay(0).fadeIn('show');
                    $('#validation_error').show().delay(2000).fadeOut('show');
                    return false;
                } else {

                    $('#news_letter').submit();
                }
            }
        });
    }
</script>



</body>

</html>
