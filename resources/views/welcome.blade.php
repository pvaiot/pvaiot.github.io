
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dirang College</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="{{asset('style/img/logo.ico" type="image/x-icon')}}">
    <link rel="stylesheet" href="{{asset('style/bootstrap/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{asset('style/css/font-awesome.css')}}">
    <link rel="stylesheet" href="{{asset('style/css/animate.min.css')}}">
    <link rel="stylesheet" href="style/css/prettyPhoto.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway|Roboto" rel="stylesheet">
    <script src="{{asset('style/js/jquery.min.js')}}"></script>
    <script src="{{asset('style/js/gistfile1.js')}}"></script>

    <link rel="stylesheet" href="{{asset('style/css/style.css')}}">
    <script src="{{asset('style/bootstrap/js/bootstrap.min.js')}}"></script>

</head>
<body>

<header class="container">
    <div class="row">
        <h2 class="headerlogo col-md-6 col-sm-12">
            <div class="row">
                <div class="col-md-2 col-sm-2 text-right">
                    <img src="style/img/logo.png" width="50">
                </div>
                <div class="col-md-10 col-sm-10" style="padding-top:10px">

                    <a class="custom_color" href="#" style="font-weight:600!important;">GOVT. POLYTECHNIC DIRANG</a>
                    <p style="padding-top:2px; color: #1B989C!important">GOVT. OF ARUNACHAL PRADESH,DIRANG:WEST KAMENG<br>

                        <span style="font-size:12px"> (Approved by AICTE, New Delhi and affiliated to APSCTE, Itanagar)</span>
                    </p>
                </div>
            </div>


        </h2>
        <div class="col-md-5 col-sm-6 col-md-offset-1">
            <br><br>
            <div class="contact pull-right">
                <p class="email">
                    <span class="fa fa-envelope custom_color"></span>  anilsa2009@yahoo.in &nbsp;
                    <span class="fa fa-phone-square custom_color"></span>  +91 9774560282

                    @if(isset(\Illuminate\Support\Facades\Auth::user()->name))
<a href="{{url('dashboard')}}" class="custom_color">
                       <span class="fa fa-user custom_color" style="border:solid 1px; border-radius:30px; padding:2px"></span>  {{\Illuminate\Support\Facades\Auth::user()->name}}
</a>
                        @endif


                    <br>
                </p>

            </div>
        </div>
    </div>

</header> <!-- logo bar container end here -->
<nav  class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="custome-active"><a href="#">HOME</a></li>
                <li class="dropdown">
                    <a href="#">TRANSACTION</a>
                </li>
                <li><a href="#">ADMISSIONS</a></li>
                <li><a href="#">ACADEMICS</a></li>
                <li><a href="#">DEPARTMENT</a></li>
                <li><a href="#">FACILITIES</a></li>
                <li><a href="#">TENDER</a></li>
                <li><a href="gallery.php">GALLERY</a></li>
                <li><a href="#">CONTACT US</a></li>
            </ul>
        </div>
    </div>
</nav>
<!--    ----------------------- carasoul--------------------------->
<div class="container-fluid">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
            <li data-target="#myCarousel" data-slide-to="4"></li>
            <li data-target="#myCarousel" data-slide-to="5"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">

            <?php $data = \App\Home_slider::orderby('id','asc')->first(); ?>

            <div class="item active">
                <img src="{{asset('style/img/slider')}}/{{$data->image_path}}" style="width: 100%" alt="College Pic">
                <div class="carousel-caption">
                    <h3>Front View</h3>
                </div>
            </div>
                <?php $data1 = \App\Home_slider::where('id','!=',1)->get(); ?>
            @foreach($data1 as $d)
                    <div class="item">
                        <img src="{{asset('style/img/slider')}}/{{$d->image_path}}" style="width: 100%" alt="College Pic">
                        <div class="carousel-caption">
                            <h3>Front View</h3>
                        </div>
                    </div>
             @endforeach
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div><!-- carasoul container ends here -->
<!--    ----------------------- carasoul--------------------------->


<!--    ----------------------- marquee--------------------------->
<section id="fastInfo">
    <div class="container-fluid">
        <div class="row" style="background-color: #1b98e0!important;padding: 5px;margin-left: 0px;margin-right: 0;box-shadow: 4px 6px 5px #888888;">
            <div class="col-md-12">

                <div id="marquee1" class="container-marquee" onmouseover="zxcMarquee.scroll('marquee1',0);" onmouseout="zxcMarquee.scroll('marquee1',-1);">
                    <div style="position: absolute; width: 98%;">
                        &nbsp;|&nbsp;<a href="#"> Diploma Results <img src="style/img/new.gif"> </a>&nbsp;|&nbsp;
                        <a href="#"> Arriving Campus <img src="style/img/new.gif"></a>&nbsp;|&nbsp;
                        <a href="#"> Admission through JEE conducted by DHTE, Govt. of Arunachal Pradesh Apply online through Website: apdhte.nic.in, on notification by APSCTE in the month of March every year <img src="style/img/new.gif"></a>&nbsp;|&nbsp;
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!--    ----------------------- marquee ends --------------------------->
<section id="aboutus">
    <div class="container-fluid">
        <div class="poster wow fadeInDown">

            <h2 class="text-center" style="padding: 5px;">GOVT. POLYTECHNIC DIRANG</h2>
            <hr class="custom_hr">
            <div class="miniText">
                <p class="text-center">Government Polytechnic Dirang (GPD) is a newly established institute at beautiful Dirang town in the West Kameng District in year 2014 by the Government of Arunachal Pradesh.
                    The GPD is conceived with a vision to produce competent and qualifying engineers with sound theoretical knowledge, practical skills, leadership qualities and aptitude for entrepreneurship.
                    The institute has set a mission of creating disciplined and responsible engineers those can be proudly and capably play their role of responsible Citizen.

                    GPD is an institution that makes learning a focused, fruitful, and enjoyable experience for all its students. We are sure that our present and future students place themselves as the most employable technical professionals, molded in the educational offerings of the institute.</p>
            </div>


        </div><!-- poster div end here -->
    </div> <!-- container end here -->
</section>
<!-- mission section -->
<section id="mission">
    <div class="container-fluid">
        <div class="poster wow fadeInDown">

            <h2 class="text-center" style="padding: 5px;">Mission</h2>
            <hr class="custom_hr">
            <div class="miniText">
                <p class="text-center">"To prepare students to succeed in information-directed and technology-driven global economy to become responsible citizens through effective teaching and learning process developed at National Institute of Technical Teachers Training and Research (NITTTR), Kolkota and approved by APSCTE, Itanagar." </p>
            </div>


        </div><!-- poster div end here -->
    </div> <!-- container end here -->
</section>

<section id="facility">
    <div class="container">
        <div class="poster wow fadeInDown">

            <h2 class="text-center" style="padding: 5px;">Facilities & Features</h2>
            <hr class="custom_hr">
            <div class="row wow fadeInDown" style="padding-top:30px">
                <div class="col-md-3 col-sm-6">

                    <h4 class="text-center"><img src="{{asset('style/img/icons/classroom.png')}}"><br> Well-furnished class rooms</h4>
                </div>
                <div class="col-md-3 col-sm-6">
                    <h4 class="text-center"><img src="{{asset('style/img/icons/library.png')}}"><br>  Newly setup Library and Language Laboratory</h4>
                </div>
                <div class="col-md-3 col-sm-6">
                    <h4 class="text-center"><img src="{{asset('style/img/icons/laborty.png')}}"><br> Well-equipped laboratories and workshop with modern equipments</h4>
                </div>

                <div class="col-md-3 col-sm-6">
                    <h4 class="text-center"><img src="{{asset('style/img/icons/computer.png')}}"><br>Computer center with backup facility</h4>
                </div>
            </div> <!-- end row here -->


            <div class="row wow fadeInDown" style="padding-top:30px">
                <div class="col-md-3 col-sm-6">

                    <h4 class="text-center"><img src="{{asset('style/img/icons/hostel.png')}}"><br>Well-furnished hostels for boys and girls</h4>
                </div>
                <div class="col-md-3 col-sm-6">
                    <h4 class="text-center"><img src="{{asset('style/img/icons/nss.png')}}"><br>National Services Scheme(NSS)</h4>
                </div>
                <div class="col-md-3 col-sm-6">
                    <h4 class="text-center"><img src="{{asset('style/img/icons/facultyroom.png')}}"><br>Furnished quarters for faculty and staff equipments</h4>
                </div>

                <div class="col-md-3 col-sm-6">
                    <h4 class="text-center"><img src="{{asset('style/img/icons/campus.png')}}"><br>Specious green campus suitable for technical education environment</h4>
                </div>
            </div> <!-- end row here -->

            <div class="row wow fadeInDown" style="padding-top:30px;padding-bottom:30px">
                <div class="col-md-3 col-sm-6">

                    <h4 class="text-center"><img src="{{asset('style/img/icons/teacher.png')}}"><br>Qualified, trained and experienced faculties and staffs</h4>
                </div>
                <div class="col-md-3 col-sm-6">
                    <h4 class="text-center"><img src="{{asset('style/img/icons/industries.png')}}"><br>Industry institute interaction </h4>
                </div>
                <div class="col-md-3 col-sm-6">
                    <h4 class="text-center"><img src="{{asset('style/img/icons/placement.png')}}"><br>Placement Assistance</h4>
                </div>

                <div class="col-md-3 col-sm-6">
                    <h4 class="text-center"><img src="{{asset('style/img/icons/mentor.png')}}"><br>Mentorship</h4>
                </div>
            </div> <!-- end row here -->


        </div><!-- poster div end here -->
    </div> <!-- container end here -->
</section>

<section id="principal-speech">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6  wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                <div class="principal_img text-center">
                    <?php $principle = \App\principal_message::all()->first(); ?>

                    <img class="img img-thumbnail" src="{{asset('homefolder/document')}}/{{$principle->image_path}}" style="width: 200px">
                    <br>
                    <p style="text-transform: capitalize!important;">{{$principle->principle_name}}<br>Principal</p>


                </div>
            </div>
            <div class="col-md-9 col-sm-6 wow fadeInDown"  data-wow-duration="1000ms" data-wow-delay="600ms">
                <div class="principal_speech">
                    <h2>From the Principal&acute;s Desk</h2>
                    <hr class="principal_hr pull-left">
                    {{--<p style="font-size:15px">The fast changing socioeconomic and technological environment is throwing new and diverse challenges to the technical education at a much rapid rate throughout the globe. Future industries now need more than just a technocrat or manager.--}}
                        {{--At GPD, we realize your place in future as worthy professionals, adept to work together in teams, solving problems in industries, and governments. In today’s fast growing world of science and technology the value of Technical knowledge and studies are most valuable. Now a day there are number of Government Polytechnics started in Arunachal with different Diploma courses, which helps the Arunachal’s students to improve their technical skills and knowledge. </p>--}}

                    {{--<p style="font-size:15px">Our dedicated, highly qualified and inspired faculty and staff and the total commitment of the Directorate of Higher and Technical Education, Itanagar, makes it much more realistic to achieve the dreams and ambitions of the aspiring professionals. </p>--}}
                    {{--<p>We welcome all the young minds to join our mission.</p>--}}
                    {{--<p>With best wishes,</p>--}}
                    {{--<h4>Dr. Anil Choudhary</h4>--}}
                   <p>{{$principle->notice_content}}</p>
                    <p>WITH BEST WISHES</p>
                    <p>{{$principle->principle_name}}</p>
                </div>
            </div>

        </div>
    </div>
</section>
<section id="noticeboard" class="container-fluid" style="padding:40px">
    <div class="row">
        <div class="col-md-3 col-sm-6 wow ">
            <h4><i class="fa fa-bullhorn" aria-hidden="true"></i> LATEST NEWS</h4>
            <hr>



            {{----------------------link with the main page start-------------------------}}

            <?php  $data = \App\Notice_general::where('expiry_date', '>', date('Y-m-d'))->orderBy('created_at', 'desc')->get(); ?>
            @if($data->isEmpty())
                <p>Coming Soon</p>
            @else

            @foreach($data as $d)

                <p><a data-toggle="modal" data-target="#general_notice{{$d->id}}"  style="color:#1f648b!important;text-transform: capitalize;text-decoration: underline;cursor:auto!important;">{{$d->notice_title}}</a><img src="{{ asset('style/new.gif')}}"style="width:12%;"> </p>

           {{------------------ start modal-----------------------}}
                <div class="modal fade clearfix" id="general_notice{{$d->id}}"  role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">{{$d->notice_title}}</h4>
                            </div>
                            <div class="modal-body">
                                <div class="offer offer-success">
                                    <div class="shape">
                                        <div class="shape-text">
                                            Notice
                                        </div>
                                    </div>
                                    <div class="offer-content">
                                        <p>
                                            {{$d->notice_description}}
                                        </p>
                                    </div>
                                    @if($d->pdf_path!='')
                                        <p>Download- <a href="{{asset('homefolder/document')}}/{{$d->pdf_path}}"><i class="fa fa-file-pdf-o" style="font-size:18px;color:red"></i></a> </p>
                                    @endif
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
           {{------------------ end modal-----------------------}}

             @endforeach
                @endif
            {{----------------------link with the main page end-------------------------}}



        </div>

        <div class="col-md-3 col-sm-6 wow ">
            <h4><i class="fa fa-users" aria-hidden="true"></i> STUDENT'S CORNER</h4>
            <hr>


            {{----------------------link with the main page start-------------------------}}

            <?php  $data = \App\student_corner::where('expiry_date', '>', date('Y-m-d'))->orderBy('created_at', 'desc')->get(); ?>
            @if($data->isEmpty())
                <p>Coming Soon</p>
            @else

                @foreach($data as $d)

                    <p><a data-toggle="modal" data-target="#general_notice{{$d->id}}"  style="color:#1f648b!important;text-transform: capitalize;text-decoration: underline;cursor:auto!important;">{{$d->notice_title}}</a><img src="{{ asset('style/new.gif')}}"style="width:12%;"> </p>

                    {{------------------ start modal-----------------------}}
                    <div class="modal fade clearfix" id="general_notice{{$d->id}}"  role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">{{$d->notice_title}}</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="offer offer-success">
                                        <div class="shape">
                                            <div class="shape-text">
                                                Notice
                                            </div>
                                        </div>
                                        <div class="offer-content">
                                            <p>
                                                {{$d->notice_description}}
                                            </p>
                                        </div>
                                        @if($d->pdf_path!='')
                                            <p>Download- <a href="{{asset('homefolder/document')}}/{{$d->pdf_path}}"><i class="fa fa-file-pdf-o" style="font-size:18px;color:red"></i></a> </p>
                                        @endif
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    {{------------------ end modal-----------------------}}

                @endforeach
            @endif
            {{----------------------link with the main page end-------------------------}}




        </div>
        <div class="col-md-3 col-sm-6 wow ">
            <h4><i class="fa fa-calendar" aria-hidden="true"></i> LATEST EVENTS</h4>
            <hr>

            {{----------------------link with the main page start-------------------------}}

            <?php  $data = \App\latest_events::where('expiry_date', '>', date('Y-m-d'))->orderBy('created_at', 'desc')->get(); ?>
            @if($data->isEmpty())
                <p>Coming Soon</p>
            @else

                @foreach($data as $d)

                    <p><a data-toggle="modal" data-target="#general_notice{{$d->id}}"  style="color:#1f648b!important;text-transform: capitalize;text-decoration: underline;cursor:auto!important;">{{$d->notice_title}}</a><img src="{{ asset('style/new.gif')}}"style="width:12%;"> </p>

                    {{------------------ start modal-----------------------}}
                    <div class="modal fade clearfix" id="general_notice{{$d->id}}"  role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">{{$d->notice_title}}</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="offer offer-success">
                                        <div class="shape">
                                            <div class="shape-text">
                                                Notice
                                            </div>
                                        </div>
                                        <div class="offer-content">
                                            <p>
                                                {{$d->notice_description}}
                                            </p>
                                        </div>
                                        @if($d->pdf_path!='')
                                            <p>Download- <a href="{{asset('homefolder/document')}}/{{$d->pdf_path}}"><i class="fa fa-file-pdf-o" style="font-size:18px;color:red"></i></a> </p>
                                        @endif
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    {{------------------ end modal-----------------------}}

                @endforeach
            @endif
            {{----------------------link with the main page end-------------------------}}
        </div>
        <div class="col-md-3 col-sm-6 wow">
            <h4><i class="fa fa-file-pdf-o" aria-hidden="true"></i> TENDER NEWS</h4>
            <hr>

            {{----------------------link with the main page start-------------------------}}

            <?php  $data = \App\tender_news::where('expiry_date', '>', date('Y-m-d'))->orderBy('created_at', 'desc')->get(); ?>
            @if($data->isEmpty())
                <p>Coming Soon</p>
            @else

                @foreach($data as $d)

                    <p><a data-toggle="modal" data-target="#general_notice{{$d->id}}"  style="color:#1f648b!important;text-transform: capitalize;text-decoration: underline;cursor:auto!important;">{{$d->notice_title}}</a><img src="{{ asset('style/new.gif')}}"style="width:12%;"> </p>

                    {{------------------ start modal-----------------------}}
                    <div class="modal fade clearfix" id="general_notice{{$d->id}}"  role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">{{$d->notice_title}}</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="offer offer-success">
                                        <div class="shape">
                                            <div class="shape-text">
                                                Notice
                                            </div>
                                        </div>
                                        <div class="offer-content">
                                            <p>
                                                {{$d->notice_description}}
                                            </p>
                                        </div>
                                        @if($d->pdf_path!='')
                                            <p>Download- <a href="{{asset('homefolder/document')}}/{{$d->pdf_path}}"><i class="fa fa-file-pdf-o" style="font-size:18px;color:red"></i></a> </p>
                                        @endif
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    {{------------------ end modal-----------------------}}

                @endforeach
            @endif
            {{----------------------link with the main page end-------------------------}}

        </div>
    </div>
</section>

<section id="courses" class="container-fluid text-center" style="padding:40px">
    <h2 class="text-center">We Offer three year Engineering Diploma in</h2>
    <br>
    <div class="row" style="margin-top:20px">
        <!--
                <div class="col-md-3 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="200ms">
                    <div class="box">
                        <img src="style/img/computer1.png">

                    </div>
                    <h4 class="text-center">Computer Engineering</h4>
                </div>
        -->

        <div class="col-md-3 col-md-offset-1 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="200ms">
            <div class="box">
                <img src="{{asset('style/img/mech.png')}}">
            </div>
            <h4 class="text-center">Mechanical Engineering</h4>

        </div>
        <div class="col-md-3 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="200ms">
            <div class="box">
                <img src="{{asset('style/img/electrical1.png')}}">
            </div>
            <h4 class="text-center">Electrical Engineering</h4>
        </div>
        <div class="col-md-3 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="200ms">
            <div class="box">
                <img src="{{asset('style/img/civil1.png')}}">
            </div>
            <h4 class="text-center">Civil Engineering</h4>
        </div>
    </div>
</section>
<footer>
    <div class="row" style="padding: 20px;">
        <div class="col-md-7 col-sm-12">
            <h4>College Address</h4>
            <address>
                <p>Government Polytechnic Dirang</p>
                <p>Dirang, West Kameng , Arunachal Pradesh</p>
                <p><i class="fa fa-phone"></i> &nbsp;+91 9774560282</p>
            </address>
        </div>
        <div class="col-md-2 col-sm-6">
            <h4>Quick Links</h4>
            <p>Home</p>
            <p>About Us</p>
            <p>Enqury</p>
            <p>Contact</p>
        </div>
        <div class="col-md-3 col-sm-6">
            <h4>Connect With Us</h4>
            <p ><a href="#"><span class="fa fa-facebook"></span>  &nbsp;Facebook</a></p>
            <p ><a href="#"><span class="fa fa-twitter"></span>  &nbsp;Twitter</a></p>
            <p ><a href="#"><span class="fa fa-google-plus"></span>  &nbsp;Google Plus</a></p>
            <p ><a href="#"><span class="fa fa-youtube"></span>  &nbsp;Youtube</a></p>
        </div>
    </div>
</footer>
<div class="container-fluid">
    <div class="row" style="background-color: #000000;padding: 20px;">
        <div class="col-sm-6" style="text-align: left">
            All rights reserved Govt.Polytechnic College Dirang
        </div>
        <div class="col-sm-6" style="text-align: right">
            Designed & Developed by <a href="http://www.mustechnologies.com/" style="color: #daa520;opacity: 0.8">MUS Technology Services Pvt. Ltd.</a>
        </div>
    </div>
</div>
<script src="{{asset('style/js/wow.min.js')}}"></script>
<script src="{{asset('style/js/jquery.prettyPhoto.js')}}"></script>
<script src="{{asset('style/js/jquery.isotope.min.js')}}"></script>
<script src="{{asset('style/js/main.js')}}"></script>
<script src="{{asset('style/js/custom.js')}}"></script>

</body>
</html>