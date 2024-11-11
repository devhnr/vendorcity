@extends('admin.includes.Template')

@section('content')

    @php

        $userId = Auth::id();

        $get_user_data = Helper::get_user_data($userId);

        $get_permission_data = Helper::get_permission_data($get_user_data->role_id);

        $edit_perm = [];

        if ($get_permission_data->editperm != '') {
            $edit_perm = $get_permission_data->editperm;

            $edit_perm = explode(',', $edit_perm);
        }

    @endphp

    <style>
        #delete_model_1 .modal-dialog {
            max-width: 50% !important;
        }
    </style>

    <div class="content container-fluid">





        <!-- Page Header -->

        <div class="page-header">

            <div class="row align-items-center">

                <div class="col">

                    <h3 class="page-title">Leads Enquiry</h3>

                    <ul class="breadcrumb">

                        <li class="breadcrumb-item"><a href="{{ url('/admin') }}">Dashboard</a>

                        </li>

                        <li class="breadcrumb-item active">Leads Enquiry</li>

                    </ul>

                </div>

                <div class="col-auto">

                    <a class="btn btn-primary me-1" href="javascript:void('0');" onclick="excel_download();">Excel Download</a>
                    
                    <a class="btn btn-primary filter-btn" href="javascript:void(0);" id="filter_search">
                        <i class="fas fa-filter"></i>
                    </a>

                    
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

        <form method="GET" action="{{ url('filter_data_enquiry') }}" id="filter_data">

            <input type="hidden" name="startdate_fil" id="startdate_fil" value="{{ $startdate ?: '' }}">

            <input type="hidden" name="enddate_fil" id="enddate_fil" value="{{ $enddate ?: '' }}">

            <input type="hidden" name="filter_service_id_fil" id="filter_service_id_fil" value="{{ $filter_service_id ?: '' }}">

            <input type="hidden" name="filter_customer_name_fil" id="filter_customer_name_fil" value="{{ $filter_customer_name ?: '' }}">
            
        </form>

    @php

        if(!empty($startdate) || !empty($enddate) || !empty($filter_service_id) || !empty($filter_customer_name)){
            $css = "display:block;";
        }else{
            $css = "display:none;";
        }

    @endphp

   <!-- Search Filter -->

   <div id="filter_inputs" class="card filter-card" style="{{ $css }}">

       <div class="card-body pb-0">
        <form id="filter_form" action="{{ route('enquiry-filter') }}" method="POST">
            @csrf
            <input type="hidden" name="action" value="filter">

           <div class="row">

               <div class="col-sm-6 col-md-8">
                <div class="row">

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label>Start Date</label>
                            <input type="date" class="form-control" name="s_date" id="s_date" placeholder="Enter Start Date"
                                value="{{ $startdate ?: '' }}">
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label>End Date</label>
                            <input type="date" class="form-control" name="e_date" id="e_date" placeholder="Enter End Date"
                                value="{{ $enddate ?: '' }}">
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label>Select Services</label>
                            <select name="servicename" class="form-control form-select"  id="servicename">
                                <option value="">Select Service</option>
                                @foreach ($service_data as $service_data_new)
                                    <option value="{{ $service_data_new->id }}"
                                        @if ($service_data_new->id == $filter_service_id) {{ 'selected' }} @endif>
                                        {{ $service_data_new->servicename }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label>Customer Name</label>
                            <select name="customer_name" class="form-control form-select" id="customer_name">
                                <option value="">Select Customer Name</option>
                                @foreach ($customer_data as $customer_data_new)
                                    <option value="{{ $customer_data_new->name }}"
                                        @if ($customer_data_new->name == $filter_customer_name) {{ 'selected' }} @endif>{{ $customer_data_new->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
               </div>
               </div>
               <div class="col-sm-3 col-md-4">
                <div class="form-group">
                    <a class="btn btn-primary filter-btn" href="javascript:void(0);" style="margin-top: 22px;" onclick="filter_validation()">Submit</a>

                    <a class="btn btn-primary filter-btn" href="{{ route('enquiry.index') }}" style="margin-top: 22px;">Reset</a>
                    </div>
               </div>
           </div>
        </form>
       </div>

   </div>

        @php
           // echo "<pre>";print_r($packages_data);echo"</pre>";
        @endphp

        <div class="row">

            <div class="col-sm-12">

                <div class="card card-table">

                    <div class="card-body">

                        <form id="form" action="{{-- route('delete_price') --}}" enctype="multipart/form-data">

                            <INPUT TYPE="hidden" NAME="hidPgRefRan" VALUE="<?php echo rand(); ?>">

                            @csrf

                            <div class="table-responsive">

                                <table class="table table-center table-hover datatable" id="example">

                                    <thead class="thead-light">

                                        <tr>
                                            <th style="display: none">>Sr No</th>
                                            <th>Date</th>
                                            <th>Inquiry No</th>
                                            <th>Status</th>
                                            <th>Name</th>
                                            <th>Email</th>

                                            <th>Mobile</th>

                                            <th>Service</th>

                                            <th>Sub Service</th>

                                            {{-- <th>Package Category</th> --}}

                                            {{-- <th>Packages Enquiry</th> --}}
                                            <th>Lead Info</th>





                                        </tr>

                                    </thead>

                                    <tbody>

                                        @php

                                            $i = 1;
                                        @endphp

                                        @foreach ($packages_data as $data)
                                            <tr>

                                                <td style="display: none">

                                                    {{ $i }}

                                                </td>

                                                <td>{{ date('d-m-Y', strtotime($data->added_date)) }}</td>
                                                <td>{{ $data->inquiry_id }}</td>
                                                <td>{{ $data->count }}/5 Accepted</td>
                                                <td>

                                                    {{ $data->name }}

                                                </td>
                                                <td>
                                                    {{ $data->email }}
                                                </td>

                                                <td>
                                                    {{ $data->mobile }}

                                                </td>

                                                <td>
                                                    {!! Helper::servicename($data->service_id) !!}
                                                </td>

                                                <td>
                                                    {!! Helper::subservicename($data->subservice_id) !!}
                                                </td>

                                                {{-- <td>
                                                    {!! Helper::packagescategory($data->packagecategory_id) !!}
                                                </td> --}}

                                                {{-- <td>
                                                    {!! Helper::packages_enquiry($data->pakage_id) !!}
                                                </td> --}}

                                                <td>
                                                    {{-- <a class="btn btn-primary" href="javascript:void('0');"
                                                        onclick="delete_category('{{ $data->id }}');">View
                                                        Package Enquiry</a> --}}

                                                    <a class="btn btn-primary"
                                                        href="{{ url('enquiry_page', $data->id) }}">View Information</a>
                                                </td>
                                            </tr>

                                            @php

                                                $i++;
                                            @endphp
                                        @endforeach



                                    </tbody>

                                </table>

                            </div>

                        </form>

                    </div>

                </div>

            </div>

        </div>

    </div>
@stop
@section('footer_js')

    <!-- Delete  Modal -->
    @if ($packages_data != '')
        @foreach ($packages_data as $data)
            <div class="modal custom-modal fade" id="delete_model_{{ $data->id }}" role="dialog">

                <div class="modal-dialog modal-dialog-centered">

                    <div class="modal-content">

                        <div class="modal-body">


                            <div class="modal-text text-center">

                                <!-- <h3>Delete Expense Category</h3> -->

                                @php

                                    $result = DB::table('more_formfields_details')
                                        ->select('*')
                                        ->where('package_inquiry_id', '=', $data->id)
                                        ->get();

                                    //$servicename = Helper::servicename($result->service_id);

                                    // echo '<pre>';
                                    // print_r($result);
                                    // echo '</pre>';
                                    // exit();

                                @endphp
                                @if ($result != '')
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="invoice-table table table-bordered">
                                                    <thead>
                                                        @foreach ($result as $result_data)
                                                            <tr>
                                                                <th>{!! Helper::form_fields($result_data->form_field_id) !!}</th>
                                                            </tr>

                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            @if ($result_data->formfield_value != '')
                                                                <td>{{ $result_data->formfield_value }}</td>
                                                            @else
                                                                <td>{{ '-' }}</td>
                                                            @endif
                                                        </tr>
                                @endforeach
                                </tbody>
                                </table>


                            </div>
                        </div>

                    </div>
                @else
                    <p>No Data Found</p>
        @endif

        </div>
        </div>
        </div>

        </div>

        </div>
    @endforeach
    @endif




    <script>
         function excel_download() {
            $('#filter_data').submit();
        }
        function delete_category(id) {

            // alert(id);

            $('#delete_model_' + id).modal('show');


        }
        function filter_validation(){
                
                // var vendor_id = jQuery("#vendor_id").val();

                // if (vendor_id == '') {
                //     jQuery('#vendor_id_error').html("Please Select Vendor");
                //     jQuery('#vendor_id_error').show().delay(0).fadeIn('show');
                //     jQuery('#vendor_id_error').show().delay(2000).fadeOut('show');
                //     $('html, body').animate({
                //         scrollTop: $('#vendor_id').offset().top - 150
                //     }, 1000);
                //     return false;
                // }

                $('#filter_form').submit();
            }
    </script>
    <script>
        if ($.fn.DataTable.isDataTable('#example')) {
            $('#example').DataTable().destroy();
        }

        $(document).ready(function() {
            $('#example').dataTable({
                "searching": true
            });
        })
    </script>

@stop
