@extends('admin.includes.Template')

@section('content')

    <div class="content container-fluid">



        <!-- Page Header -->

        <div class="page-header">

            <div class="row">

                <div class="col-sm-12">

                    <h3 class="page-title">Edit System</h3>

                    <ul class="breadcrumb">

                        <li class="breadcrumb-item"><a href="{{ url('/admin') }}">Dashboard</a></li>

                        {{-- <li class="breadcrumb-item"><a href="{{ route('state.index') }}">System</a></li> --}}

                        <li class="breadcrumb-item active">Edit System</li>

                    </ul>

                </div>

            </div>

        </div>

        <!-- /Page Header -->



        @if ($message = Session::get('success'))
            <div class="alert alert-success alert-dismissible fade show">
                <strong>Success!</strong> {{ $message }}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif
        <div class="alert alert-success alert-dismissible fade show success_show" style="display: none;">
            <strong>Success! </strong><span id="success_message"></span>
            <!-- <button type="button" class="btn-close" data-bs-dismiss="alert"></button> -->
        </div>



        <div class="row">

            <div class="col-md-12">

                <div class="card">

                    <div class="card-body">

                        <!-- <h4 class="card-title">Basic Info</h4> -->

                        <form id="System__form" action="{{ route('system.update', $systems->id) }}" method="POST"
                            enctype="multipart/form-data">

                            @csrf

                            @method('PUT')

                            <div class="row">

                                <div class="form-group">

                                    <label for="name">System Percentage</label>

                                    <input id="percentage" name="percentage" type="text" class="form-control"
                                        placeholder="Enter System Percentage" value="{{ $systems->percentage }}" />

                                    <p class="form-error-text" id="percentage_error" style="color: red; margin-top: 10px;">
                                    </p>

                                </div>



                            </div>



                            <div class="text-end mt-4">

                                <a class="btn btn-primary" href="{{ url('/admin') }}"> Cancel</a>



                                <button class="btn btn-primary mb-1" type="button" disabled id="spinner_button"
                                    style="display: none;">

                                    <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>

                                    Loading...

                                </button>



                                <button type="button" class="btn btn-primary" id="submit_button"
                                    onclick="javascript:category_validation()">Submit</button>

                                <!-- <input type="submit" name="submit" value="Submit" class="btn btn-primary"> -->

                            </div>

                        </form>



                    </div>

                </div>

            </div>

        </div>

    </div>

@stop

@section('footer_js')

    <script>
        function category_validation() {

            var percentage = jQuery("#percentage").val();

            if (percentage == '') {
                jQuery('#percentage_error').html("Please Enter Percentage");
                jQuery('#percentage_error').show().delay(0).fadeIn('show');
                jQuery('#percentage_error').show().delay(2000).fadeOut('show');
                $('html, body').animate({
                    scrollTop: $('#percentage').offset().top - 150
                }, 1000);
                return false;
            }

            $('#spinner_button').show();
            $('#submit_button').hide();
            $('#System__form').submit();

        }
    </script>


@stop
