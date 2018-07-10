<aside id="sidebar">


    <div id="sidebar-wrap">

        <div class="panel-group slim-scroll" role="tablist">
            <div class="panel panel-default">

                <div id="sidebarNav" class="panel-collapse collapse in" role="tabpanel">
                    <div class="panel-body">


                        <!-- ===================================================
                        ================= NAVIGATION Content ===================
                        ==================================================== -->
                        <ul id="navigation">
                            <li id="menu2"><a href="/service/dashboard/show/${sessionContext.company_id}"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a>
                            </li>

                            <li id="menu1" class="active">
                                <a href="/service/company/showlist" role="button" tabindex="0"><i
                                        class="fa fa-list"></i>
                                    <span>Company Information</span> </a>

                            </li>

                            <li id="menu7"><a href="/service/field/showlist"><i class="fa fa-edit"></i> <span>Field Management</span></a>
                            </li>
                            
                           
							
						
					        <#if sessionContext.role == "1">
							<li id="menu4">
                                <a role="button" tabindex="0"><i class="fa fa-table"></i>
                                    <span>Metadata Management</span>
                                </a>
                                <ul>
                                    <li id="menu4-1">
                                        <a href="/service/data/metadatatype/show"><i class="fa  fa-bar-chart-o"></i>
                                            <span>Metadata Type Management</span> </a></li>
                                    <li id="menu4-2">
                                        <a href="/service/data/metadata/show"><i class="fa fa-cubes"></i>
                                            <span>Metadata Management</span> </a></li>

                                </ul>
                            </li>



							 <li id="menu8">        
                             	<a href="/service/data/back/show" role="button" tabindex="0"><i class="fa fa-database"></i> <span>Data Back</span> </a>
                            </li>
                            <li id="menu3">
                                <a href="/service/usermgr/showlist" role="button" tabindex="0"><i
                                        class="fa fa-users"></i>
                                    <span>User Managment</span> </a>

                            </li>
							
							</#if>
							
							
						    <li id="menu9">
                                <a  href="/service/data/export/show" role="button" tabindex="0"><i
                                        class="fa fa-file-pdf-o"></i> <span>Export</span> </a>

                            </li>
                            


                            <li id="menu5">
                                <a role="button" tabindex="0"><i class="fa fa-asterisk"></i> <span>User Setting</span>
                                </a>
                                <ul>
                                    <li id="menu5-2"><a href="/service/user/user_pass"><i class="fa fa-caret-right"></i>
                                        Modify
                                        Password</a></li>

                                </ul>
                            </li>
                           

                             <li id="menu6">
                                <a id="logout2" href="/service/user/logout" role="button" tabindex="0"><i
                                        class="fa fa-sign-out"></i> <span>Logout</span> </a>

                            </li>
                          
                        </ul>
                        <!--/ NAVIGATION Content -->


                    </div>
                </div>
            </div>


        </div>

    </div>

    <script>

        $("#logout2").click(function () {
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


</aside>