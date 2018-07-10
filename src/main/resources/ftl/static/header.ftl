<section id="header">
                <header class="clearfix">

                    <!-- Branding -->
                    <div class="branding">
                        <a class="brand" href="index.html">
                            <span><strong>MIIM System</strong></span>
                        </a>
                        <a role="button" tabindex="0" class="offcanvas-toggle visible-xs-inline"><i class="fa fa-bars"></i></a>
                    </div>
                    <!-- Branding end -->



                    <!-- Left-side navigation -->
                    <ul class="nav-left pull-left list-unstyled list-inline">
                        <li class="sidebar-collapse divided-right">
                            <a role="button" tabindex="0" class="collapse-sidebar">
                                <i class="fa fa-outdent"></i>
                            </a>
                        </li>
                       
                    </ul>
                    <!-- Left-side navigation end -->




                 



                    <!-- Right-side navigation -->
                    <ul class="nav-right pull-right list-inline" >
                        

                        

                     

                        <li class="dropdown nav-profile">

                            <a href class="dropdown-toggle" data-toggle="dropdown">
                              
                                <span > <font id="username"></font><i class="fa fa-angle-down"></i></span>
                            </a>

                            <ul class="dropdown-menu animated littleFadeInRight" role="menu">

                                <li>
                                    <a role="button" tabindex="0">
                                       
                                        <i class="fa fa-user"></i>Profile
                                    </a>
                                </li>
                             
                                <li>
                                    <a role="button" tabindex="0">
                                        <i class="fa fa-cog"></i>Settings
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a role="button" tabindex="0">
                                        <i class="fa fa-lock"></i>Lock
                                    </a>
                                </li>
                              

                            </ul>

                        </li>
                     	<li class="toggle-right-sidebar">
                                <a id="logout" href="/service/user/logout" role="button" tabindex="0">
                                    <i class="fa fa-sign-out"></i>Logout
                                </a>
                            </li>
                       

                      
                    </ul>
                    <!-- Right-side navigation end -->



                </header>

            </section>
            
            <script>
              var bds_username = Cookies.get('bds_milkana_username');
                $("#username").text(bds_username);

                $("#logout").click(function () {
                    clearCookie();
                })


              function clearCookie(){
                  var keys=document.cookie.match(/[^ =;]+(?=\=)/g);
                  if (keys) {
                      for (var i = keys.length; i--;)
                          document.cookie=keys[i]+'=0;expires=' + new Date( 0).toUTCString()
                  }
              }
            </script>