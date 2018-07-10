<!DOCTYPE html>

<!--[if IE 8]>
<html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]>
<html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!-->
<html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

    <meta charset="utf-8"/>

    <title>BDS | Dashboard</title>

    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

    <meta content="" name="description"/>

    <meta content="" name="author"/>

    <!-- BEGIN GLOBAL MANDATORY STYLES -->

    <link href="/res/media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    <link href="/res/media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

    <link href="/res/media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

    <link href="/res/media/css/style-metro.css" rel="stylesheet" type="text/css"/>

    <link href="/res/media/css/style.css" rel="stylesheet" type="text/css"/>

    <link href="/res/media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

    <link href="/res/media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

    <link href="/res/media/css/uniform.default.css" rel="stylesheet" type="text/css"/>

    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL STYLES -->

    <link href="/res/media/css/lock.css" rel="stylesheet" type="text/css"/>

    <!-- END PAGE LEVEL STYLES -->

    <link rel="shortcut icon" href="/res/media/image/favicon.ico"/>

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body>

<div class="page-lock">

    <div class="page-logo">

        <a class="brand" href="/">

            <img src="/res/media/image/logo.png" alt="logo" style="height: 56px"/>

        </a>

    </div>

    <div class="page-body">

        <img class="page-lock-img" src="/res/media/image/logo.png" alt="">

        <div class="page-lock-info">

            <h1 id="username">${username}</h1>

            <span>${email}</span>

            <span><em>锁定</em></span>

            <form class="form-search">

                <div class="input-append">

                    <input id="password" type="password" class="m-wrap" placeholder="Password">

                    <a id="loginBtn" class="btn blue icn-only"><i class="m-icon-swapright m-icon-white"></i>
                    </a>

                </div>

                <div class="relogin">

                    <a href="/service/user/logout">不是 ${username} ?</a>

                </div>

            </form>

        </div>

    </div>

    <div class="page-footer">

        2018 &copy; BDS

    </div>

</div>

<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

<!-- BEGIN CORE PLUGINS -->

<script src="/res/media/js/jquery-1.10.1.min.js" type="text/javascript"></script>

<script src="/res/media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->

<script src="/res/media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>

<script src="/res/media/js/bootstrap.min.js" type="text/javascript"></script>

<!--[if lt IE 9]>

<script src="/res/media/js/excanvas.min.js"></script>

<script src="/res/media/js/respond.min.js"></script>

<![endif]-->

<script src="/res/media/js/jquery.slimscroll.min.js" type="text/javascript"></script>

<script src="/res/media/js/jquery.blockui.min.js" type="text/javascript"></script>

<script src="/res/media/js/jquery.cookie.min.js" type="text/javascript"></script>

<script src="/res/media/js/jquery.uniform.min.js" type="text/javascript"></script>

<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL PLUGINS -->

<script src="/res/media/js/jquery.backstretch.min.js" type="text/javascript"></script>

<!-- END PAGE LEVEL PLUGINS -->

<script src="/res/media/js/app.js"></script>

<script src="/res/media/js/lock.js"></script>

<script>

    jQuery(document).ready(function () {

        App.init();

        Lock.init();

        $("#loginBtn").click(function (data) {
            var username = $("#username").html();
            var pwd = $("#password").val();
            if (username == '' || pwd == '') {
                //layer.msg("信息不完整");
                return;
            }
            $.post('/service/user/loginto',
                    {
                        username: username,
                        password: pwd
                    },
                    function (data, textStatus, xhr) {
                        var r = JSON.stringify(data);
                        if (r.indexOf("suc") != -1) {
                            window.location.href = "/";
                        } else {
                            alert("登录失败");
                        }
                    });
        });

    });

</script>

<!-- END JAVASCRIPTS -->

</body>

<!-- END BODY -->

</html>