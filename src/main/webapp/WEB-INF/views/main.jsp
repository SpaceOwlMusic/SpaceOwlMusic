<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SpaceOwlMusic</title>
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/signupform.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mainpage.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/slider.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/audio.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/font-awesome.min.css">
    <!-- Bootstrap styles -->
</head>
<body>

<header>
    <div class="container">
        <div class="header_top">
            <a href="#"><img src="${contextPath}/resources/img/shared_for_all/Logo.png"></a>
            <!--<h1>SpaceOwlMusic</h1>-->
        </div>
    </div>
    <nav role="navigation" class="navbar navbar-default">
        <!-- Логотип и мобильное меню -->
        <div class="navbar-header">
            <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="#" class="navbar-brand">SpaceOwlMusic</a>

        </div>
        <!-- Навигационное меню -->
        <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#block-about-us">About us</a></li>
                <li><a href="#topmusic">Top Songs</a></li>
                <li><a href="#">People</a></li>
            </ul>
            <!-- Поиск по сайту -->
            <form role="search" class="navbar-form navbar-left">
                <div class="form-group col-md-12">
                    <input type="text" placeholder="Search" class="form-control">
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><button id="signlogin">
                    <span class="menu_link-text"> Sign in/Sign up</span>
                </button></li>
                <li><button id="profile">
                    <span class="menu_link-text" href="${contextPath}/${userForm.username}">Profile</span>
                </button></li>
            </ul>
        </div>
    </nav>
</header>
<!--================FORM REGISTRATION========================================================================================-->
<div class="modal fade" tabindex="-1" role="dialog" id="writeusmodal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <div class="modal-body">
                <div class="form">
                    <ul class="tab-group">
                        <li class="tab active"><a href="#login">Sign In</a></li>
                        <li class="tab "><a href="#signup">Sign Up</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="login">
                            <h1>Welcome Back!</h1>
                            <form method="POST" action="${contextPath}/login">
                                <div class="field-wrap">
                                    <input type="text" placeholder="username" name="username" required autocomplete="off">
                                </div>
                                <div class="field-wrap">
                                    <input type="password" placeholder="Password"  name="password"  required autocomplete="off">
                                </div>
                                <p class="forgot"><a href="#">Forgot Password?</a></p>
                                <button class="button button-block">Log In</button>
                            </form>
                        </div>
                        <input type="hidden" id="login_status" value="${loginStatus}">
                        <div id="signup">
                            <h1>Sign Up for Free</h1>

                            <%--<form id="signform" method="post" name='signupForm'  action="${contextPath}/registration">--%>
                                <%--<div class="top-row">--%>
                                    <%--<div class="field-wrap">--%>
                                        <%--<input name="firstname" placeholder="First name*" type="text" required autocomplete="off" />--%>
                                    <%--</div>--%>
                                    <%--<div class="field-wrap">--%>
                                        <%--<input type="text" name="lastName" placeholder="Last Name" required autocomplete="off"/>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="field-wrap">--%>
                                    <%--<input type="text" placeholder="username" required autocomplete="off"/>--%>
                                <%--</div>--%>
                                <%--<div class="field-wrap">--%>
                                    <%--<input id="password" name="enterpassword"  type="password" placeholder="Password repeat" required autocomplete="off"/>--%>
                                    <%--<input id="passwordconfirm" name="confirmpassword" type="password" placeholder="Set a password again" required autocomplete="off"/>--%>
                                <%--</div>--%>
                                <%--<button id="submitsignup" type="submit" class="button button-block">Get Started</button>--%>
                            <%--</form>--%>

                            <form:form method="POST" modelAttribute="userForm" action="${contextPath}/registration" class="form-signin">

                                <div class="top-row">
                                    <div class="field-wrap">
                                        <form:input name="firstname" type="text" path="firstName" class="form-control"
                                                    placeholder="Your first name"></form:input>
                                    </div>

                                    <div class="field-wrap">
                                        <form:input name="lastName" type="text" path="lastName" class="form-control"
                                                    placeholder="Your last name "></form:input>
                                    </div>
                                </div>

                                <div class="field-wrap">
                                    <form:input name="email" type="text" path="email" class="form-control"
                                                placeholder="Your email "></form:input></div>
                                <div class="field-wrap">
                                    <form:input name="username" type="text" path="username" class="form-control"
                                                placeholder="Your username"></form:input>
                                </div>
                                <div class="field-wrap">
                                    <form:input name="password" type="text" path="password" class="form-control"
                                                placeholder="Your password"></form:input>
                                </div>
                                <div class="field-wrap">

                                    <form:input name="password" type="text" path="confirmPassword" class="form-control"
                                                placeholder="Repeat Password"></form:input></div>

                                <button id="submitsignup" type="submit" class="button button-block"/>
                                Get Started</button>

                            </form:form>

                        </div>
                    </div><!-- tab-content -->
                </div> <!-- /form -->
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!--============================================END FORM REGISTRATION===============================================-->
<!--ЕСЛИ ПАРОЛИ НЕ СОВПАДАЮТ ТО ПОЯВЛЯЕТСЯ ЭТО ОКНО-->
<div id="password-notmatch" class="modal fade">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header header-mismatch">
                <h5 class="modal-title">Mismatch</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body mismatch">
                <p>Passwords don't match! Please try again</p>

            </div>

        </div>
    </div>
</div>

<!--============================================SLIDER==============================================================-->
<div class="mainslider">
    <div id="jssor_1"
         style="position:relative;margin:0 auto;top:0;left:0;width:1300px;height:500px;overflow:hidden;visibility:hidden;">
        <!-- Loading Screen -->
        <div data-u="loading" style="position:absolute;top:0;left:0;background-color:rgba(0,0,0,0.7);">
            <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0; left: 0; width: 100%; height: 100%;"></div>
            <div style="position:absolute;display:block;background:url('${contextPath}/resources/img/slider/loading.gif') no-repeat center center;top:0;left:0;width:100%;height:100%;"></div>
        </div>
        <div data-u="slides" style="cursor:default;position:relative;top:0;left:0;width:1300px;height:500px;overflow:hidden;">
            <div>
                <img data-u="image" src="${contextPath}/resources/img/slider/blue.jpg"/>
                <div style="position:absolute;top:30px;left:30px;width:480px;height:120px;z-index:0; color:#ffffff;line-height:60px; font: 60px 'Russo One', sans-serif; text-shadow: -2px 0 #991be2, 0 2px #991be2, 2px 0 #991be2, 0 -2px #991be2;">GET IN TOUCH WITH OTHER MUSIC LOVERS </div>
                <div style="position:absolute;top:300px;left:30px;width:480px;height:120px;z-index:0;font-size:30px;color:#ffffff;line-height:38px;"> We make it easy to connect people that share music views.Others are waiting for you, join now!</div>
                <div style=" position:absolute;top:30px;left:30px;width:480px;height:120px;z-index:0;font-size:20px;color:#ffffff;line-height:60px;">
                    <div style="text-align:start; position:absolute;top:300px;left:30px;width:480px;height:120px;z-index:0;font-size:25px;color:black;line-height:1.45; "></div>
                </div>
            </div>
            <div>
                <img data-u="image" src="${contextPath}/resources/img/slider/purple.jpg"/>
                <div style="position:absolute;top:30px;left:30px;width:480px;height:120px;z-index:0;color:#ffffff;line-height:60px;font: 60px 'Russo One', sans-serif;text-shadow: -2px 0 #991be2, 0 2px #991be2, 2px 0 #991be2, 0 -2px #991be2;">EXPRESS YOURSELF</div>

                <div style="position:absolute;top:300px;left:30px;width:480px;height:120px;z-index:0;font-size:30px;color:#ffffff;line-height:38px;">Enjoy every moment and share it through music. Easely add photos, tracks, create playlists, albums to express your feelings!  </div>

            </div>
            <div>
                <img data-u="image" src="${contextPath}/resources/img/slider/red.jpg"/>
                <div style="position:absolute;top:30px;left:30px;width:480px;height:120px;z-index:0; color:#ffffff;line-height:60px;font: 60px 'Russo One', sans-serif;text-shadow: -2px 0 #991be2, 0 2px #991be2, 2px 0 #991be2, 0 -2px #991be2;">NEW TALENTS </div>

                <div style="position:absolute;top:300px;left:30px;width:480px;height:120px;z-index:0;font-size:30px;color:#ffffff;line-height:38px;">We support new artists and talents. That is why if you are one,we are giving you an oportunity to get recognized and famous </div>
            </div>
        </div>
        <!-- Bullet Navigator -->
        <div data-u="navigator" class="jssorb05" style="bottom:16px;right:16px;" data-autocenter="1">
            <!-- bullet navigator item prototype -->
            <div data-u="prototype" style="width:16px;height:16px;"> </div>
        </div>
        <!-- Arrow Navigator -->
        <span data-u="arrowleft" class="jssora22l" style="top:0;left:8px;width:40px;height:58px;"
              data-autocenter="2"></span>
        <span data-u="arrowright" class="jssora22r" style="top:0;right:8px;width:40px;height:58px;"
              data-autocenter="2"></span>
    </div>
</div>
<!--========================================END SLIDER===============================================================-->

<!--========================================TOP SONGS================================================================-->
<div id="topmusic" class="conteiner-for-music row">
    <div class="col-lg-7 col-md-12 col-sm-12">
        <h3>Top Songs</h3>
        <article class="player">
            <div class="snipper-wrap">
                <div class="play-sprite">
                    <div class="imgtracks">
                        <a href="#">Track 1</a>
                        <img class="tracks" src="${contextPath}/resources/img/topsongs/audiotrack1.png">
                        <div class="imgplay">
                        </div>
                    </div>
                    <audio  data-bpm="86">
                        <source src="${contextPath}/resources/audio/elka.mp3">
                    </audio>
                </div>
                <a class="likes" href="#"><img src="${contextPath}/resources/img/shared_for_all/heart.png"> Like</a>
            </div>
        </article>
        <article class="player">
            <div class="snipper-wrap">
                <div class="play-sprite">
                    <div class="imgtracks">
                        <a href="#">Track 2</a>
                        <img class="tracks" src="${contextPath}/resources/img/topsongs/audiotrack2.png">
                        <div class="imgplay">

                        </div>
                    </div>
                    <a class="likes" href="#"><img src="${contextPath}/resources/img/shared_for_all/heart.png"> Like</a>
                    <audio  data-bpm="86">
                        <source src="${contextPath}/resources/audio/monatik.mp3">
                    </audio>
                </div>
            </div>

        </article>
        <article class="player">
            <div class="snipper-wrap">
                <div class="play-sprite">
                    <div class="imgtracks">
                        <a href="#">Track 3</a>
                        <img class="tracks" src="${contextPath}/resources/img/topsongs/topsong1.png">
                        <div class="imgplay">

                        </div>
                    </div>
                    <a class="likes" href="#"><img src="${contextPath}/resources/img/shared_for_all/heart.png"> Like</a>
                    <audio  data-bpm="86">
                        <source src="${contextPath}/resources/audio/track2.mp3">
                    </audio>
                </div>
            </div>

        </article>
        <article class="player">
            <div class="snipper-wrap">
                <div class="play-sprite">
                    <div class="imgtracks">
                        <a href="#">Track 4</a>
                        <img class="tracks" src="${contextPath}/resources/img/topsongs/topsong2.png">
                        <div class="imgplay">

                        </div>
                    </div>
                    <a class="likes" href="#"><img src="${contextPath}/resources/img/shared_for_all/heart.png"> Like</a>
                    <audio  data-bpm="86">
                        <source src="${contextPath}/resources/audio/track3.mp3">
                    </audio>
                </div>
            </div>

        </article>
        <article class="player">
            <div class="snipper-wrap">
                <div class="play-sprite">
                    <div class="imgtracks">
                        <a href="#">Track 5</a>
                        <img class="tracks" src="${contextPath}/resources/img/topsongs/topsong3.png">
                        <div class="imgplay">

                        </div>
                    </div>
                    <a class="likes" href="#"><img src="${contextPath}/resources/img/shared_for_all/heart.png"> Like</a>
                    <audio  data-bpm="86">
                        <source src="${contextPath}/resources/audio/track4.mp3">
                    </audio>
                </div>
            </div>

        </article>
        <article class="player">
            <div class="snipper-wrap">
                <div class="play-sprite">
                    <div class="imgtracks">
                        <a href="#">Track 6</a>
                        <img class="tracks" src="${contextPath}/resources/img/topsongs/audiotrack4.png">
                        <div class="imgplay">

                        </div>
                    </div>
                    <a class="likes" href="#"><img src="${contextPath}/resources/img/shared_for_all/heart.png"> Like</a>
                    <audio  data-bpm="86">
                        <source src="${contextPath}/resources/audio/track5.mp3">
                    </audio>
                </div>
            </div>

        </article>
        <article class="player">
            <div class="snipper-wrap">
                <div class="play-sprite">
                    <div class="imgtracks">
                        <a href="#">Track 7</a>
                        <img class="tracks" src="${contextPath}/resources/img/topsongs/audiotrack7.png">
                        <div class="imgplay">

                        </div>
                    </div>
                    <a class="likes" href="#"><img src="${contextPath}/resources/img/shared_for_all/heart.png"> Like</a>
                    <audio  data-bpm="86">
                        <source src="${contextPath}/resources/audio/track6.mp3">
                    </audio>
                </div>
            </div>

        </article>
        <article class="player">
            <div class="snipper-wrap">
                <div class="play-sprite">
                    <div class="imgtracks">
                        <a href="#">Track 8</a>
                        <img class="tracks" src="${contextPath}/resources/img/topsongs/audiotrack3.png">
                        <div class="imgplay">

                        </div>
                    </div>
                    <a class="likes" href="#"><img src="${contextPath}/resources/img/shared_for_all/heart.png"> Like</a>
                    <audio  data-bpm="86">
                        <source src="${contextPath}/resources/audio/track7.mp3">
                    </audio>
                </div>
            </div>
        </article>
    </div>
    <div class="col-lg-5 col-md-12 col-sm-12 list-top-playlist ">
        <h3>Top Playlists</h3>

        <div class="row top-playlists">
            <div class="col-sm-6 col-md-6">
                <div class="thumbnail">
                    <img src="${contextPath}/resources/img/Topplaylist/playlist6.png" alt="track">
                    <div class="caption">
                        <p>Playlist 1
                        </p>
                        <p><a href="#" class="btn btn-primary" role="button">Listen now</a> </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-6">
                <div class="thumbnail">
                    <img src="${contextPath}/resources/img/Topplaylist/playlist5.png" alt="track">
                    <div class="caption">

                        <p>Playlist 2
                        </p>
                        <p><a href="#" class="btn btn-primary" role="button">Listen now</a> </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-6">
                <div class="thumbnail">
                    <img src="${contextPath}/resources/img/Topplaylist/playlist4.png" alt="track">
                    <div class="caption">
                        <p>Playlist 3
                        </p>
                        <p><a href="#" class="btn btn-primary" role="button">Listen now</a> </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-6">
                <div class="thumbnail">
                    <img src="${contextPath}/resources/img/Topplaylist/playlist1.png" alt="track">
                    <div class="caption">
                        <p>Playlist 4
                        </p>
                        <p><a href="#" class="btn btn-primary" role="button">Listen now</a> </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-6">
                <div class="thumbnail">
                    <img src="${contextPath}/resources/img/Topplaylist/playlist2.png" alt="track">
                    <div class="caption">
                        <p>Playlist 5
                        </p>
                        <p><a href="#" class="btn btn-primary" role="button">Listen now</a></p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-6">
                <div class="thumbnail">
                    <img src="${contextPath}/resources/img/Topplaylist/playlist3.png" alt="track">
                    <div class="caption">
                        <p>Playlist 6
                        </p>
                        <p><a href="#" class="btn btn-primary" role="button">Listen now</a></p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!--==============================================END TOP SONGS====================================================-->

<!--==============================================ABOUT US=========================================================-->

<!--<div class="wrapper">-->
<h2 id="block-about-us" class="headeraboutus">About our service</h2>
<section class="aboutus">
    <div class="row-col">
        <div class="col-md-4">
            <div class="p-a-lg text-center">
                <h4 class="m-y-lg">Easily upload and share music </h4>
                <p class="text-muted text-md m-b-lg">Share your playlist and tracks with friends </p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="p-a-lg text-center">
                <h4 class="m-y-lg">Your music. Share your music privately.</h4>
                <p class="text-muted text-md m-b-lg">Control who can access and listen to your music and playlist.  </p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="p-a-lg text-center">
                <h4 class="m-y-lg">Our team is here to help</h4>
                <p class="text-muted text-md m-b-lg">We love our users and we are happy to provide support on any topics</p>
            </div>
        </div>
    </div>
</section>


<!--===========================================FOOTER======================================================-->
<footer id="myFooter">
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <h2 class="logo"><a href="#"> SpaceOwlMusic </a></h2>
                <img class="logofooter" src="${contextPath}/resources/img/shared_for_all/Logo.png">

            </div>
            <div class="col-sm-2">
                <h5>Get started</h5>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Sign up</a></li>
                    <li><a href="#">Downloads</a></li>
                </ul>
            </div>
            <div class="col-sm-2">
                <h5>About us</h5>
                <ul>
                    <li><a href="#">Company Information</a></li>
                    <li><a href="#">Contact us</a></li>
                    <li><a href="#">Reviews</a></li>
                </ul>
            </div>
            <div class="col-sm-2">
                <h5>Support</h5>
                <ul>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">Help desk</a></li>
                    <li><a href="#">Forums</a></li>
                </ul>
            </div>
            <div class="col-sm-3">
                <div class="social-networks">
                    <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                    <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                    <a href="#" class="google"><i class="fa fa-google-plus"></i></a>
                </div>
                <button id="writeus" type="button" class="btn btn-default">Contact us</button>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <p>© 2017 SpaceOwlMusic </p>
    </div>
</footer>
<div class="modal fade" tabindex="-1" role="dialog" id="ContactUs">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="jumbotron jumbotron-sm">
                    <div class="container">
                        <div class="row">
                            <div class="well well-sm">
                                <form>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="name">
                                                    Name</label>
                                                <input type="text" class="form-control" id="name" placeholder="Enter name" required="required" />
                                            </div>
                                            <div class="form-group">
                                                <label for="email">
                                                    Email Address</label>
                                                <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span>
                                </span>
                                                    <input type="email" class="form-control" id="email" placeholder="Enter email" required="required" /></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="subject">
                                                    Subject</label>
                                                <select id="subject" name="subject" class="form-control" required="required">
                                                    <option value="na" selected="">Choose One:</option>
                                                    <option value="service">General Customer Service</option>
                                                    <option value="suggestions">Suggestions</option>
                                                    <option value="product">Product Support</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="name">
                                                    Message</label>
                                                <textarea name="message" id="message" class="form-control" rows="9" cols="25" required="required"
                                                          placeholder="Message"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-primary pull-right" id="btnContactUs">
                                                Send Message</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<button onclick="topFunction()" id="myBtn" title="Go to top"><img src="${contextPath}/resources/img/arrow-up.png"></button>
<script src="${contextPath}/resources/js/jssor.slider-23.1.6.mini.js" type="text/javascript"></script>
<script src="${contextPath}/resources/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${contextPath}/resources/js/MainSlider.js"></script>
<script src="${contextPath}/resources/js/jquery-3.2.1.min%20.js"></script>
<script src="${contextPath}/resources/js/TopSongs(player).js"></script>
<script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/Signform(main).js"></script>

</body>
</html>