<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\View;
use File;

class HomePageController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
//   ----------------------------------- home page start --------------------

  public function home_page(){
     // echo 'hi this is echo';
      return View::make('homepage.home.homepanel');
  }
//   ----------------------------------- home page start end --------------------


    public function PrincipalMsgFunc(){
        return View::make('homepage.home.PrincipalMsg');
    }




   public function transaction(){
        return View::make('homepage.Consignment_section');
    }

    public function AdmissionsMainSectionFunc(){
        return View::make('homepage.AdmissionsMainSection');
    }

    public function AcademicsMainSectionFunc(){
        return View::make('homepage.AcademicsMainSection');
    }

    public function DepartmentMainSectionFunc(){
        return View::make('homepage.DepartmentMainSection');
    }

    public function FacilitiesMainSectionFunc(){
        return View::make('homepage.FacilitiesMainSection');
    }

    public function TenderMainSectionFunc(){
        return View::make('homepage.TenderMainSection');
    }

    public function GalleryMainSectionFunc(){
        return View::make('homepage.GalleryMainSection');
    }

    public function ContactUsMainSectionFunc(){
        return View::make('homepage.ContactUsMainSection');
    }
}
