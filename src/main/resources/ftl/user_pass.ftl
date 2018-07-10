<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->



<head>

<#include "static/top.ftl" >



</head>





<body id="minovate" class="appWrapper">






<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->












<!-- ====================================================
================= Application Content ===================
===================================================== -->
<div id="wrap" class="animsition">






    <!-- ===============================================
    ================= HEADER Content ===================
    ================================================ -->


<#include "static/header.ftl" >

    <!--/ HEADER Content  -->





    <!-- =================================================
    ================= CONTROLS Content ===================
    ================================================== -->
    <div id="controls">





        <!-- ================================================
        ================= SIDEBAR Content ===================
        ================================================= -->

        <!--/ SIDEBAR Content -->


    <#include "static/menu.ftl" >


    </div>
    <!--/ CONTROLS Content -->




    <!-- ====================================================
    ================= CONTENT ===============================
    ===================================================== -->
    <section id="content">

        <div class="page page-dashboard">

            <div class="pageheader">

                <h2>User Center Update Password <span></span></h2>

                <div class="page-bar">

                    <ul class="page-breadcrumb">
                        <li>
                            <a href="/"><i class="fa fa-home"></i> Minovate</a>
                        </li>
                        <li>
                            <a href="">Update Password</a>
                        </li>
                    </ul>



                </div>

            </div>

            <!-- cards row -->
            <div class="row">

                <div class="col-md-12">
                    <section class="tile">

                        <!-- tile header -->
                        <div class="tile-header dvd dvd-btm">
                            <h1 class="custom-font"><strong>Submit</strong></h1>
                            <ul class="controls">
                                <li class="dropdown">

                                    <a role="button" tabindex="0" class="dropdown-toggle settings" data-toggle="dropdown">
                                        <i class="fa fa-cog"></i>
                                        <i class="fa fa-spinner fa-spin"></i>
                                    </a>

                                    <ul class="dropdown-menu pull-right with-arrow animated littleFadeInUp">
                                        <li>
                                            <a role="button" tabindex="0" class="tile-toggle">
                                                <span class="minimize"><i class="fa fa-angle-down"></i>&nbsp;&nbsp;&nbsp;Minimize</span>
                                                <span class="expand"><i class="fa fa-angle-up"></i>&nbsp;&nbsp;&nbsp;Expand</span>
                                            </a>
                                        </li>
                                        <#--<li>-->
                                            <#--<a role="button" tabindex="0" class="tile-refresh">-->
                                                <#--<i class="fa fa-refresh"></i> Refresh-->
                                            <#--</a>-->
                                        <#--</li>-->
                                        <li>
                                            <a role="button" tabindex="0" class="tile-fullscreen">
                                                <i class="fa fa-expand"></i> Fullscreen
                                            </a>
                                        </li>
                                    </ul>

                                </li>
                                <li class="remove"><a role="button" tabindex="0" class="tile-close"><i class="fa fa-times"></i></a></li>
                            </ul>
                        </div>
                        <!-- /tile header -->

                        <!-- tile body -->
                        <div class="tile-body">

                        <#--<p class="text-muted">Submit button will be enabled after completing form.</p>-->

                            <form name="form1" role="form" id="form1" novalidate="">

                                <div class="form-group">
                                    <label for="username">Username: </label>
                                    <input value="${username}" type="text" name="username" id="username" class="form-control" data-parsley-trigger="change" data-parsley-range="[4, 20]" required="" data-parsley-id="1996" disabled><ul class="parsley-errors-list" id="parsley-id-1996"></ul>
                                </div>


                                <div class="form-group">
                                    <label for="password">History Password: </label>
                                    <input type="password" name="historyPassword" id="historyPassword" class="form-control" data-parsley-trigger="change" data-parsley-range="[4, 20]" required="" data-parsley-id="1522"><ul class="parsley-errors-list" id="parsley-id-1522"></ul>
                                </div>

                            <div class="form-group">
                            <label for="password">Password: </label>
                            <input type="password" name="password" id="pass1" class="form-control" data-parsley-trigger="change" data-parsley-range="[4, 20]" required="" data-parsley-id="1522"><ul class="parsley-errors-list" id="parsley-id-1522"></ul>
                            </div>

                            <div class="form-group">
                            <label for="passwordConfirm">Password confirmation: </label>
                            <input type="password" name="passwordConfirm" id="pass2" class="form-control" data-parsley-trigger="change" data-parsley-range="[4, 20]" data-parsley-equalto="#password" required="" data-parsley-id="8737"><ul class="parsley-errors-list" id="parsley-id-8737"></ul>
                            </div>


                                <#--<div class="form-group">-->
                                    <#--<label for="phone">Phone: </label>-->
                                    <#--<input value="${phone_number}" type="text" name="phone" id="phone" class="form-control" placeholder="(XXX) XXXX XXX" data-parsley-trigger="change" pattern="^[\d\+\-\.\(\)\/\s]*$" required="" data-parsley-id="7654"><ul class="parsley-errors-list" id="parsley-id-7654"></ul>-->
                                <#--</div>-->

                            </form>

                        </div>
                        <!-- /tile body -->

                        <!-- tile footer -->
                        <div class="tile-footer text-right bg-tr-black lter dvd dvd-top">
                            <!-- SUBMIT BUTTON -->
                            <button type="submit" class="btn btn-success" id="btn_update">Submit</button>
                        </div>
                        <!-- /tile footer -->

                    </section>
                </div>
            </div>
            <!-- /row -->
        </div>


    </section>

    <!--/ CONTENT -->






</div>
<!--/ Application Content -->


<#include "static/footer.ftl" >







<!-- ===============================================
============== Page Specific Scripts ===============
================================================ -->
<script>
    $(window).load(function(){
      $("#navigation li").each(function () {
		        $(this).removeClass('active');
	    });
	    //添加菜单选中
	    $('#menu5').addClass('active');
	    $('#menu5-2').addClass('active');
        $('#btn_update').click(function (event) {
            var e_user = $("#username").text();
//            var temp = document.getElementById("username");
//            var $username = $(temp).val();
            var e_pass1 = $("#pass1").val();
            var e_pass2 = $("#pass2").val();
            var historyPassword = $("#historyPassword").val();
            if (e_pass1 != e_pass2) {
                layer.msg("The password input is inconsistent");
            } else {
                $.post('/service/user/update', {
                    username: e_user,
                    password: e_pass2,
                    historyPassword:historyPassword,
                }, function(data, textStatus, xhr) {
                    if(data.code=="suc"){
                        layer.msg("success");
                    }else {
                        layer.msg("fail")
                    }
                });
            }
        });
    });
</script>
<!--/ Page Specific Scripts -->




<script src="/assets/js/layer/layer.js"></script>

</body>
</html>
