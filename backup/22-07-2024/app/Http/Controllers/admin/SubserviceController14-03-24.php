<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Admin\Subservice;
use App\Models\Admin\Service;
use Image;
use DB;

class SubserviceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {   $data['subservice_data']=Subservice::orderBy('id','DESC')->get();
        return view('admin.list_subservice',$data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data['service_data']=service::orderBy('id','DESC')->get();
       
        return view('admin.add_subservice',$data);

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // echo"<pre>";
        // print_r($request->post());
        // echo"</pre>";exit;
       
        // $subservice= New Subservice;
        $data['serviceid']=$request->serviceid;
        $data['subservicename']=$request->subservicename;        
        $data['page_url']=$request->page_url;        
        $data['description']=$request->description;
        $data['top_description']=$request->top_description;
        $data['charge']=$request->charge;
        $data['no_of_inquiry']=$request->no_of_inquiry;        
        $data['servicepercentage']=$request->servicepercentage;       
       
        $data['is_bookable'] = implode(',', $request->is_bookable);
        $data['set_order']= 0;


        
        
        if($request->hasfile('image') != ''){

            $image = $request->file('image');
            $remove_space = str_replace(' ', '-', $image->getClientOriginalName());
            $data['image'] = time() . $remove_space;
            $destinationPath = public_path('upload/subservice/large/');
            $img = Image::make($image->path());
            $width=320;
            $height=230;
            $img->resize($width,$height,function($constraint){
            })->save($destinationPath.'/'.$data['image']);
              
            $destinationPath = public_path('upload/subservice');
            $image->move($destinationPath,$data['image']);
            $image = $data['image'];
        }else{
            $image = "";
        }
         $data['image']  = $image;

        if($request->hasfile('banner_image') != ''){

            $image = $request->file('banner_image');
            $remove_space = str_replace(' ', '-', $image->getClientOriginalName());
            $data['banner_image'] = time() . $remove_space;
            $destinationPath = public_path('upload/subservice/banner/large/');
            $img = Image::make($image->path());
            $width=1380;
            $height=690;
            $img->resize($width,$height,function($constraint){
            })->save($destinationPath.'/'.$data['banner_image']);
              
            $destinationPath = public_path('upload/subservice/banner/');
            $image->move($destinationPath,$data['banner_image']);
            $image = $data['banner_image'];
        }else{
            $image = "";
        }
        $data['banner_image']  = $image;

        // echo"<pre>";
        // print_r($subservice);
        // echo"</pre>";exit;
       
        // $subservice->save();
        $package_id = DB::table('subservices')->insertGetId($data);

        if (count($_POST['title_addmore']) > 0 && $_POST['title_addmore'] != '') {
            for ($i = 0; $i < count($_POST['title_addmore']); $i++) {    
                if($_FILES['image_'.$i]['name'] != '') {                                 
                    $image = $_FILES['image_'.$i]['tmp_name'];    
                    $originalName = $_FILES['image_'.$i]['name']; // Get the original file name    
                    $filename = time() . '-' . str_replace(' ', '-', $originalName);   

                    Image::make($image)    
                    ->resize(510,340)    
                    ->save(public_path('upload/subservice/subservice_attr/large/' . $filename));    

                    Image::make($image)              
                    ->save(public_path('upload/subservice/subservice_attr/' . $filename)); 

                    $content['image']   = $filename;                       
                }
                if($_POST['title_addmore'][$i] != ''){
                    $content['p_id'] = $package_id;
                    $content['title_addmore'] = $_POST['title_addmore'][$i];  
                    $content['description_addmore'] = $_POST['description_addmore'][$i];    
                    $this->insert_package_attribute($content);    
                }    
            }    
        }
        return redirect()->route('subservice.index')->with('success', 'Sub Service Added Successfully');
    }
    function insert_package_attribute($content){

        $data['pid'] = $content['p_id'];      
       
        $data['title_addmore'] = $content['title_addmore'];

        $data['image'] = $content['image'];

        $data['description_addmore'] = $content['description_addmore'];



        DB::table('subservice_attr')->insertGetId($data);

    }
    public function removed_addmore_att(Request $request){



        $service = $request->pid;

        $id = $request->id;

        $result = DB::table('subservice_attr')->where('pid', '=',$service)->where('id', '=',$id)->delete();

        return redirect()->route('subservice.edit',$service)->with('success','deleted successfully');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Subservice $subservice)
    {
       
        
        $data['all_service'] = Service::orderBy('id','DESC')->get();   
        $data['package_attribute_data'] = DB::table('subservice_attr')
                                    ->select('*')                            
                                    ->where('pid', '=',$subservice->id)                            
                                    ->get()                            
                                    ->toArray();    
    
        return view('admin.edit_subservice',compact('subservice'),$data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
       
        // echo"<pre>";print_r($request->all());echo"</pre>";
        
        // $subservice=Subservice::find($id);
        $data['serviceid']=$request->serviceid;
        $data['subservicename']=$request->subservicename; 
        $data['page_url']=$request->page_url;        
        $data['description']=$request->description;
        $data['top_description']=$request->top_description;
        $data['charge']=$request->charge;
        $data['no_of_inquiry']=$request->no_of_inquiry;
        $data['servicepercentage']=$request->servicepercentage;
        
        $data['is_bookable'] = implode(',', $request->is_bookable);       


        if($request->hasfile('image') != ''){

            $image = $request->file('image');
            $remove_space = str_replace(' ', '-', $image->getClientOriginalName());
            $data['image'] = time() . $remove_space;
            $destinationPath = public_path('upload/subservice/large/');
            $img = Image::make($image->path());
            $width=320;
            $height=230;
            $img->resize($width,$height,function($constraint){
            })->save($destinationPath.'/'.$data['image']);
              
            $destinationPath = public_path('upload/subservice');
            $image->move($destinationPath,$data['image']);
            $image = $data['image'];
            // $data['subservice']  = $image;
        }
        if($request->hasfile('banner_image') != ''){

            $image = $request->file('banner_image');
            $remove_space = str_replace(' ', '-', $image->getClientOriginalName());
            $data['banner_image'] = time() . $remove_space;
            $destinationPath = public_path('upload/subservice/banner/large/');
            $img = Image::make($image->path());
            $width=1380;
            $height=690;
            $img->resize($width,$height,function($constraint){
            })->save($destinationPath.'/'.$data['banner_image']);
              
            $destinationPath = public_path('upload/subservice/banner/');
            $image->move($destinationPath,$data['banner_image']);
            $image = $data['banner_image'];
            $data['banner_image']  = $image;
        }
       
        // echo"<pre>";print_r($_POST);echo"</pre>";

        // echo"<pre>";print_r($data);echo"</pre>";exit;
       
        DB::table('subservices')->where('id', $id)->update($data);

       if (count($_POST['title_addmore1']) > 0 && $_POST['title_addmore1'] != '') {
              
                  for ($i = 0; $i < count($_POST['title_addmore1']); $i++) {
                          
                      if(isset($_FILES['e_image1_'.$i]['name']) && $_FILES['e_image1_'.$i]['name'] != '') { 
                         
                          $image = $_FILES['e_image1_'.$i]['tmp_name'];
                         
                          $originalName = $_FILES['e_image1_'.$i]['name']; // Get the original file name
                            
                          $filename = time() . '-' . str_replace(' ', '-', $originalName);
      
      
                          Image::make($image)
      
                          ->resize(510,340)
      
                          ->save(public_path('upload/subservice/subservice_attr/large/' . $filename));
      
      
                          Image::make($image)                   
      
                          ->save(public_path('upload/subservice/subservice_attr/' . $filename));
      
      
                          $content['image']   = $filename;                         
                      }else{
                            $content['image']  = '';
                      }
      
                      if($_POST['title_addmore1'][$i] != ''){
      
      
      
                          $content['p_id'] = $id;
      
                          $content['title_addmore'] = $_POST['title_addmore1'][$i];                          
      
                          $content['description_addmore'] = $_POST['description_addmore1'][$i];
      
                          $this->insert_package_attribute($content);
      
                      }
      
                  }
      
              }
      
      
      
              if ($request->title_addmoreu != '' && count($request->title_addmoreu) > 0 ) {      
      
                  for ($i = 0; $i < count($_POST['title_addmoreu']); $i++) {      
                             
                     //echo"<pre>";print_r($_FILES['imageu_'.$i]);echo"</pre>";exit;
                      if($_POST['title_addmoreu'][$i] != ''){
                          //
                          
                          if($_FILES['imageu_'.$i]['name'] != '') { 
                          $image = $_FILES['imageu_'.$i]['tmp_name'];              

      
                          $originalName = $_FILES['imageu_'.$i]['name']; // Get the original file name
      
                          $filename = time() . '-' . str_replace(' ', '-', $originalName);
      
      
                          Image::make($image)
      
                          ->resize(510,340)
      
                          ->save(public_path('upload/subservice/subservice_attr/large/' . $filename));
      
      
                          Image::make($image)                   
      
                          ->save(public_path('upload/subservice/subservice_attr/' . $filename));
      
      
                          $contentu['image']   = $filename;                         
                      }else{

                          $contentu['image']   = '';                         
                      }
      
                          $contentu['p_id'] = $id;
      
                          $contentu['title_addmore'] = $_POST['title_addmoreu'][$i];
      
                          $contentu['description_addmore'] = $_POST['description_addmoreu'][$i];
      
                          $contentu['updateid1xxx1'] = $_POST['updateid1xxx1'][$i];
      
      
                         // echo"<pre>";print_r($contentu);echo"</pre>";exit;
                          $this->update_Package_attribute($contentu);
      
                      }
      
                  }
      
              }


        return redirect()->route('subservice.index')->with('success', 'Sub Service Updated Successfully');
    }
    
    function update_Package_attribute($content){

        // echo"<pre>";print_r($content);echo"</pre>";exit;
        
                $data['pid'] = $content['p_id'];
        
                $data['title_addmore'] = $content['title_addmore'];    

                if($content['image'] != ''){
                    $data['image'] =  $content['image'];
                } 
                $data['description_addmore'] = $content['description_addmore'];    

                DB::table('subservice_attr')->where('id', $content['updateid1xxx1'])->update($data);
            }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $delete_id = $request->selected;      

        Subservice::whereIn('id',$delete_id)->delete();

        return redirect()->route('subservice.index')->with('success','Sub Service Deleted Successfully');
    }
    public function set_order_subservice()

    {

        $id = $_POST['id'];

        $val = $_POST['val'];

        // echo $id."-".$val;exit;

        DB::table('subservices')->where('id', $id)->update(array('set_order' => $val));

        echo "1";

        // return redirect()->route('product.index')->with('success','Set Order has been Updated successfully');

    }
}