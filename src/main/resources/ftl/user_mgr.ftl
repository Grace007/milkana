<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->



    <head>

       <#include "static/top.ftl" >


<style>

.mb-10 {
     margin-bottom: 0px !important; 
}
</style>
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

                        <h2>User Management</h2>

                        <div class="page-bar">

                            <ul class="page-breadcrumb">
                                <li>
                                    <a href="index.html"><i class="fa fa-home"></i> Minovate</a>
                                </li>
                                <li>
                                    <a href="index.html">User Management</a>
                                </li>
                            </ul>

                        </div>

                    </div>

                    <!-- cards row -->
                    <div class="row">

                        <div class="col-md-12" >

                        <!-- tile -->
                        <section class="tile">

                            <!-- tile header -->
                            <div class="tile-header dvd dvd-btm">
                                <h1 class="custom-font"><strong>User List</strong></h1>
                                
                            </div>
                            <!-- /tile header -->

                            <!-- tile widget -->
                            <div class="tile-widget">

                                <div class="row">

                                   <form class="form-horizontal" role="form"  onsubmit="return false" >
                                      
		                                <div class="form-group col-md-4">
		                                	<label  class="col-md-5 control-label">User Name</label>
		                                	 <div class="form-group col-md-7">
		                                   		<input type="text" id="q_user_name" class="form-control">
		                                   	</div>
		                                 
		                                </div>
		
		                                <div class="form-group col-md-4">
		                                   
		                                   <label  class="col-md-5 control-label">Role</label>
		                                	 <div class="form-group col-md-7">
		                                   		<select id="q_role" class="form-control">
		                                   			<option value="">Please Select Role</option>
		                                   			<option value="0">General User</option>
                                        		    <option value="1">Super User</option>
		                                   		</select>
		                                   	</div>
		                                </div>
		                               
										<div class="form-group col-md-4">
											<button id="searchBtn" class="btn-success btn-rounded btn-ef btn-ef-7 btn-ef-7h mb-10"><i class="fa fa-search"></i> Search</button>
										
										</div>
                         
								</form>

                                </div>
                            </div>
                            <!-- /tile widget -->
                            <!-- tile body -->
                            <div class="tile-body p-0">

                                <div class="table-responsive">
                                    <table class="table table-bordered" id="usersList">
                                        <thead>
                                        <tr>

                                            <th>UserName</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Role</th>
                                            <th>Note</th>
                                            <th>Option</th>
                                        </tr>
                                        </thead>
                                        <tbody id="table">
                                        
                                        </tbody>
                                    </table>
                                </div>


                            </div>
                           <div class="tile-footer dvd dvd-top">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-3">
                                        <button id="addButton"
                                                class="btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10 pull-left"><i
                                                class="fa fa-cog"></i> <span>Add User</span></button>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <!-- tile footer -->
                            <div class="tile-footer dvd dvd-top">
                                <div class="row">
                                    <div class="col-sm-8 text-left">
                                        <ul class="pagination" id="Pagination">

                                        </ul>
                                        
                                    </div>

                                </div>
                            </div>
                            <!-- /tile footer -->

                        </section>
                        <!-- /tile -->
                        </div>

                        <!-- col -->
                        <!-- col -->
                        
                        <!-- /col -->

                        <!-- col -->
                        
                        <!-- /col -->

                    </div>
                    <!-- /row -->
                </div>

                
            </section>
            <!--/ CONTENT -->






        </div>
        <!--/ Application Content -->


        <!-- 模态框 -->
        <div class="modal fade" id="common_modal" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="min-width:300px;max-width: 500px;">
                    <div class="modal-header" style="border-color: white;">
                        <h4 class="modal-title" id="myModalLabel">User</h4>
                    </div>
                    <div id="userList" class="modal-body" style="border-color: white;">
                        <#--begin-->
                            <div class="tile-body">

                                <form name="form1" role="form" id="form1" class="form-horizontal">

                                    <div class="form-group">
                                        <label for="" class="col-sm-3 control-label">User Name: </label>
                                        <div class="col-sm-9">
                                            <input type="text" name="user_name" id="user_name" class="form-control"
                                                   data-parsley-trigger="change"
                                                   data-parsley-range="[4, 20]"
                                                   required>
                                         </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="email" class="col-sm-3 control-label">Email: </label>
                                        <div class="col-sm-9"><input type="email" name="email" id="email" class="form-control"
                                                                     data-parsley-trigger="change"
                                                                     required></div>
                                    </div>


                                    <div class="form-group">
                                        <label for="password" class="col-sm-3 control-label">Password: </label>
                                        <div class="col-sm-9"><input type="password" name="password" id="password" class="form-control"
                                                                     data-parsley-trigger="change"
                                                                     data-parsley-range="[4, 20]"
                                                                     required></div>
                                    </div>

                                    <div class="form-group">
                                        <label for="phone" class="col-sm-3 control-label">Phone: </label>
                                        <div class="col-sm-9"><input type="text" name="phone" id="phone" class="form-control" placeholder="(XXX) XXXX XXX"
                                                                     data-parsley-trigger="change"
                                                                     pattern="^[\d\+\-\.\(\)\/\s]*$"
                                                                     required></div>
                                    </div>

                                    <div class="form-group">
                                        <label for="role" class="col-sm-3 control-label">Role: </label>
                                        <div class="col-sm-9">
                                        	<select id="role" class="form-control">
                                        		<option value="0">General User</option>
                                        		<option value="1">Super User</option>
                                        	</select>
                                        
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="remark" class="col-sm-3 control-label">Note: </label>
                                        <div class="col-sm-9"><input type="text" name="remark" id="remark" class="form-control"
                                                                     data-parsley-trigger="change"></div>
                                    </div>

                                    <input type="hidden"  id="uid" class="form-control">
                                  	<input type="hidden"  id="optype" value="add" class="form-control">
                                </form>
                            </div>
                                       <#--end-->
                    </div>
                    <div class="modal-footer">
                        <button id="submit_click" class="btn btn-success btn-ef btn-ef-3 btn-ef-3c"><i class="fa fa-arrow-right"></i> Submit</button>
                         <button class="btn btn-lightred btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Cancel</button>
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal -->
        </div>
   <#include "static/footer.ftl" >

        <!-- delete prompt modal -->
         <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="min-width:300px;max-width: 500px;">
                    <div class="modal-header" style="border-color: white;">
                        <h4 class="modal-title" id="myModalLabel">Delete User</h4>
                    </div>
                    <div id="modalList" class="modal-body" style="border-color: white;">
                       <span>You are going to delete this record, are you sure to proceed?</span>
                    </div>
                    <div class="modal-footer" style="border-color: white;">
                        <input type="hidden" id='id' name='id' value=''>
                        <button id="modalsumbit" type="button" class="btn btn-primary"
                        onclick="deleteById()">Yes</button>
                        <button id="modalclose" type="button" class="btn btn-default" data-dismiss="modal">No
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal -->
        </div>

        



        <script src="/assets/js/vendor/parsley/parsley.min.js"></script>
        <!-- ===============================================
        ============== Page Specific Scripts ===============
        ================================================ -->
        <script>
      var ROLE_STATUS = {
		0 : {
			name : "General User",
			value : '0'
		},
		1 : {
			name : "Super User",
			value : '1'
		},
		
		
		
		"length" : 2
	};
            $(window).load(function(){
            //移除菜单选中
		        $("#navigation li").each(function () {
		            $(this).removeClass('active');
		        });
		        //添加菜单选中
		        $('#menu3').addClass('active');
		   
                $('#searchBtn').click(function (event) {
                     queryList(1,true)
                });
                 $('#addButton').click(function (event) {
                    addUser();
                });
                 $("#submit_click").click(function (event) {
                    submitclick();
                });

            });
            
            
        var pageSize = 10;
        
        $(document).ready(function () {
            queryList(1, true);
        });



        function deleteAsk(id) {
            $("#uid").val(id);
            $('#deleteModal').modal('show');
        }

        function deleteById() {
            var id=$("#uid").val();
            $.get("/service/usermgr/delete",{"id":id},function(data){
                if(data.data == true){
                    layer.msg("删除成功");
                    queryList(1, true ,false);
                }else{
                    layer.msg("删除失败");
                }
            }
            )
            $('#deleteModal').modal('hide');
        }
    
            function submitclick () {
                //layer.msg("模态框");
                var user_name = $("#user_name").val();
                var email = $("#email").val();
                var phone = $("#phone").val();
                var password = $("#password").val();
                var role = $("#role").val();
                var remark = $("#remark").val();
                var id = $("#uid").val();

               
				var  optype = $("#optype").val();
                if(user_name==null||user_name==''||user_name==undefined){
                    layer.msg("please input username");
                    return;
                }
             
                if(optype=='add'){
	                if(password==null||password==''||password==undefined){
	                    layer.msg("please input password");
	                    return;
	                }
                
                }
                
                if(role==null||role==''||role==undefined){
                    layer.msg("please input role");
                    return;
                }
                var data = {
                    username:user_name,
                    email:email,
                    phone:phone,
                    password:password,
                    role:role,
                    remark: remark,
                    id: id
                }
               
                if (optype=="add"){
                    $.ajax({
                        url: '/service/usermgr/add', //用于文件上传的服务器端请求地址
                        type: "POST",
                        dataType: 'JSON', //返回值类型 一般设置为json(大写!!)
                        data: data,
                        success: function (data, status) {
                            if (data.code == "suc") {
                                layer.msg("User Add Success...");
                                $('#common_modal').modal('hide');
                                queryList(1, true, false);
                            } else {
                                layer.msg("User Add fail...");
                            }

                        },
                        error: function (data, status, e) {
                            layer.msg("User Add fail...");
                        }
                    });
                }else{
                    $.ajax({
                        url: '/service/usermgr/update', //用于文件上传的服务器端请求地址
                        type: "POST",
                        dataType: 'JSON', //返回值类型 一般设置为json(大写!!)
                        data: data,
                        success: function (data, status) {
                            if (data.code == "suc") {
                                layer.msg("User update Success...");
                                $('#common_modal').modal('hide');
                                queryList(1, true, false);
                            } else {
                                layer.msg("User update fail...");
                            }

                        },
                        error: function (data, status, e) {
                            layer.msg("User update fail...");
                        }
                    });

                }
            }


function queryList(page, pageinit) {
    $("#table").empty();

    
     
        var user_name =$("#q_user_name").val();
        var role =$("#q_role").val();
        $.get('/service/usermgr/getQueryList', {"username": user_name,"role": role,"pageNum" : page,"pageSize" : pageSize},
           function (data) {
            var contain, content = "";
            var _totalPage = data.maxPage;
            if (data.data.length) {
             for (var i = 0; i < data.data.length; i++) {
                contain = data.data[i];
                content += "<tr> <td>"+contain.username+"</td> <td>"+contain.email+"</td> <td>"+contain.phone+"</td><td>"+ROLE_STATUS[contain.role].name+"</td><td>"+contain.remark+"</td>"+"<td><button onclick='update("+contain.id+")'class=\"btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10\"><i class=\"fa fa-trash\"></i> <span>Update</span></button>\n" +"<button onclick='deleteAsk("+contain.id+")' class=\"btn btn-red btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10\"><i class=\"fa fa-trash\"></i> <span>Delete</span></button>\n" +"</td>"+"</tr>" ;
             }
            $("#table").append(content);
         }
            if (pageinit) {
                $('#Pagination').empty();
                $.jqPaginator('#Pagination', {
                    totalPages: _totalPage,
                    visiblePages: 10,
                    currentPage: 1,
                    prev: '<li class="prev"><a href="javascript:scroll(0,0)">Previous</a></li>',
                    next: '<li class="next"><a href="javascript:scroll(0,0)">Next</a></li>',
                    first: '<li class="first"><a href="javascript:scroll(0,0)">First</a></li>',
                    last: '<li class="last"><a href="javascript:scroll(0,0)">End</a></li>',
                    page: '<li class="page"><a href="javascript:scroll(0,0)">{{page}}</a></li>',
                    onPageChange: function (num, type) {
                        if ((this.currentPage != 1) || (1 != num)) {
                            queryList(num, false,true);
                        }
                    }
                });
            }
        })
      
}
            

    function addUser() {
      
        $("#optype").val("add")
          //重置为空值
        $("#user_name").val("");
        $("#password").val("");
        $("#email").val("");
        $("#phone").val("");
        $("#role").val("");
        $("#remark").val("");

        $('#common_modal').modal({
            show: true
        });

    }
            
    function update(id) {
        $("#optype").val("update")
        $.get("/service/usermgr/queryById", {"id": id}, function (data) {
                    if (data.code == "suc") {
                        // layer.msg("成功");
                        var user = data.data;
                        $("#user_name").val(user.username);
                        $("#email").val(user.email);
                        $("#password").attr("readonly",true)
                        $("#password").val(user.password);
                        $("#phone").val(user.phone);
                        $("#role").val(user.role);
                        $("#remark").val(user.remark);
                        $("#uid").val(user.id);
                        $('#common_modal').modal({
                            show: true
                        });

                    } else {
                        layer.msg("失败");
                    }
                }
        )

    };
        </script>
      
    </body>
</html>
