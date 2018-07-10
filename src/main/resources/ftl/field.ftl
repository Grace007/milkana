<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang=""> <!--<![endif]-->


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
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->


<!-- ====================================================
================= Application Content ===================
===================================================== -->
<div id="wrap" class="animsition">


    <!-- ===============================================
    ================= HEADER Content ===================
    ================================================ -->


<#include "static/header.ftl" >


    <div id="controls">




    <#include "static/menu.ftl" >


    </div>

    <section id="content">

        <div class="page page-dashboard">

            <div class="pageheader">

                <h2>Field Row Data <span></span></h2>

                <div class="page-bar">

                    <ul class="page-breadcrumb">
                        <li>
                            <a href="/"><i class="fa fa-home"></i> Home</a>
                        </li>
                        <li>
                            <a href="">Field Management</a>
                        </li>
                    </ul>


                </div>

            </div>

            <!-- cards row -->
            <div class="row">

                <!-- col -->
                <div class="col-md-12">


                    <!-- tile -->
                    <section class="tile">

                        <!-- tile header -->
                        <div class="tile-header dvd dvd-btm">
                            <h1 class="custom-font"><strong>Field Management</strong></h1>
                           
                        </div>
                        <!-- /tile header -->

                        <!-- tile body -->
                        <div class="tile-body">

                            <table   class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>FieldName</th>
                                    <th>FieldType</th>
                                    <th>Note</th>
                                    <th>Option</th>
                                </tr>
                                </thead>
                                <tbody id="dataList">
                               
                                </tbody>
                                
                            </table>
                            
                             
                        </div>
                        <div class="row">
                            	<div class="col-md-12">
                            		<div class="col-md-3">
										<button type="button" id="addRowBtn" class="btn btn-primary btn-rounded mb-10 pull-left" style="margin-bottom: 10px !important;">ADD Data</button>
									</div>
								</div>
                            </div>
                        <!-- /tile body -->
						<div class="tile-footer dvd dvd-top">
                                <div class="row">
                                    <div class="col-sm-12 text-left">
                                        <ul class="pagination" id="Pagination">

										</ul>
										
                                    </div>

                                </div>
                            </div>
                    </section>
                    <!-- /tile -->

                </div>


            </div>
            <!-- /row -->
        </div>


    </section>
    <!--/ CONTENT -->


</div>
<!--/ Application Content -->


    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title custom-font">Add New Data</h3>
                    </div>
                    <div class="modal-body">
                       <form class="form-horizontal" role="form">

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Field Type</label>
                                            <div class="col-sm-10">
												
                                                 <select class="form-control" id="newFieldType">
                                                 	 <option value="input"> input</option>
                                                 	 <option value="textarea"> textarea</option>
                                                 </select>
                                            </div>
                                        </div>

                                        <hr class="line-dashed line-full">

                           <div class="form-group">
                               <label class="col-sm-2 control-label">Field Name</label>
                               <div class="col-sm-10">
                                   <input id="newFieldName" type="text" class="form-control">
                               </div>
                           </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Note</label>
                                            <div class="col-sm-10">
                                             <textarea id="newRemark" class="form-control" rows="5" name="message" id="message" placeholder="remark..."></textarea>
                                            </div>
                                        </div>

                                    </form>
                    </div>
                    <div class="modal-footer">
                        <button id="saveBtn" class="btn btn-success btn-ef btn-ef-3 btn-ef-3c"><i class="fa fa-arrow-right"></i> Submit</button>
                        <button class="btn btn-lightred btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Cancel</button>
                    </div>
                </div>
            </div>
        </div>


<#--更新模态框-->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title custom-font">Update Row Data</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">


                    <div class="form-group">
                        <label class="col-sm-2 control-label">Field Type</label>
                        <div class="col-sm-10">

                            <select class="form-control" id="updateFieldType">
                                <option value="input"> input</option>
                                <option value="textarea"> textarea</option>
                            </select>
                        </div>
                    </div>

                    <hr class="line-dashed line-full">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Field Name</label>
                        <div class="col-sm-10">
                            <input id="updateFieldName" type="text" class="form-control">
                        </div>
                    </div>

                    <hr class="line-dashed line-full">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Note</label>
                        <div class="col-sm-10">
                            <textarea id="updateRemark" class="form-control" rows="5" name="message" id="message" placeholder="remark..."></textarea>
                        </div>
                    </div>

                    <#--隐藏Id字段-->
                    <input id="updateId" type="text" class="form-control hidden">


                </form>
            </div>
            <div class="modal-footer">
                <button id='btn_update_submit' class="btn btn-success btn-ef btn-ef-3 btn-ef-3c"><i class="fa fa-arrow-right"></i> Submit</button>
                <button class="btn btn-lightred btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Cancel</button>
            </div>
        </div>
    </div>
</div>



<#include "static/footer.ftl" >


<!-- ===============================================
============== Page Specific Scripts ===============
================================================ -->
<script>
  var g_data;
  var g_company = {
      <#list companyList as c>
      ${c.company_id}:"${c.company_name}",
      </#list>

  };


  var pageSize = 10;
$(document).ready(function () {
   $("#navigation li").each(function () {
        $(this).removeClass('active');
    });
    //添加菜单选中
    $('#menu7').addClass('active');
	queryList(1, true);

	$("#searchBtn").click(function(){
  		queryList(1, true);
	});
	$("#addRowBtn").click(function(){
	    $("#newFieldName").val("");
  		$("#myModal").modal("show")
	});
	//更新
    //更新提交按钮提交修改
    $('#btn_update_submit').click(function (data) {
        update();
    });

	$("#saveBtn").click(function(){
  		var newFieldName  = $("#newFieldName").val();
  		var newFieldType  = $("#newFieldType").val();
  		var newRemark  = $("#newRemark").val();

  		if(newFieldName==null||newFieldName==''||newFieldName==undefined){
  			layer.msg("please input FieldName");
  			return;
  		}

//  		var reg=/^[a-zA-Z]\w+$/;
//  		var regexFieldName = reg.test(newFieldName);
//        if(regexFieldName != true){
//            layer.msg("please input correct FieldName");
//            return;
//        }

  		if(newFieldType==null||newFieldType==''||newFieldName==newFieldType){
  			layer.msg("please input FieldType");
  			return;
  		}
  		var field = {};
        field.field_name = newFieldName;
        field.field_type = newFieldType;
        field.remark = newRemark;
  		
  		$.post("/service/field/addRow",field,function(result){
    		if(result.code=='suc'){
    			$("#myModal").modal("hide");
    			queryList(1, true);
    		}else{
    			layer.msg(result.msg);
    		}
  		});
	});

});

// 刷新
function queryList(page, pageinit) {
    var q_company = $("#q_company_id").val();

	$("#dataList").empty();
	
	 $.get("/service/field/query",{
	     "pageNum" : page,
         "pageSize" : pageSize,
     },function(data){
	     g_data = data;
		 var contain, content = "";
			var _totalPage = data.maxPage;
			if (data.data.length) {
				for (var i = 0; i < data.data.length; i++) {
					contain = data.data[i];
					content += "<tr> " +
                            "<td>"+contain.field_name+"</td>" +
                            "<td>"+contain.field_type+"</td>" +
                            "<td>"+contain.remark+"</td>"+
                            "<td>" +
                            "<button u_id='"+contain.id+"'  class=\"btn_update btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10\"><i class=\"fa fa-cog\">" +
                            "</i> <span>Update</span></button>\n" +
                            "<button onclick='deleteById("+contain.id+")' class=\"btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10\"><i class=\"fa fa-trash\"></i> " +
                            "<span>Delete</span></button>\n" +"</td>"+"</tr>" ;


				}
				$("#dataList").append(content);
			}
			if (pageinit) {
				$('#Pagination').empty();
				$.jqPaginator('#Pagination',{
					totalPages : _totalPage,
					visiblePages : 10,
					currentPage : 1,
					prev : '<li class="prev"><a href="javascript:scroll(0,0)">Previous</a></li>',
					next : '<li class="next"><a href="javascript:scroll(0,0)">Next</a></li>',
					first : '<li class="first"><a href="javascript:scroll(0,0)">First</a></li>',
					last : '<li class="last"><a href="javascript:scroll(0,0)">End</a></li>',
					page : '<li class="page"><a href="javascript:scroll(0,0)">{{page}}</a></li>',
					onPageChange : function(num, type) {
						if ((this.currentPage != 1)|| (1 != num)) {
							queryList(num,false);
						}
					}
				});
			}

         $(".btn_update").click(function(){
             var current_row;
             var u_id = $(this).attr("u_id");
             // 查找是哪一个row
             for(var i = 0;i < g_data.data.length;i++){
                 if(g_data.data[i].id==u_id){
                     current_row = g_data.data[i];
                     break;
                 }
             }

             $("#updateFieldName").val(current_row.field_name);
             $("#updateFieldType").val(current_row.field_type);
             $("#updateRemark").val(current_row.remark);
             $("#updateId").val(current_row.id);
             $("#myModal2").modal("show");

         });


	  })
	
}

function update() {
    var finished_form = {};
    var current_row;
    var u_id = $("#updateId").val();;
    // 查找是哪一个row
    for(var i = 0;i < g_data.data.length;i++){
        if(g_data.data[i].id==u_id){
            current_row = g_data.data[i];
            break;
        }
    }

    finished_form.id = u_id;
    finished_form.field_id = current_row.field_id;
    finished_form.create_time = new Date(current_row.create_time);
    finished_form.update_time = new Date(current_row.update_time);
    finished_form.field_name = $("#updateFieldName").val();
    finished_form.field_type = $("#updateFieldType").val();
    finished_form.remark = $("#updateRemark").val();
    finished_form.status = current_row.status;


    if(finished_form.field_name==null||finished_form.field_name==''||finished_form.field_name==undefined){
        layer.msg("please input field_name");
        return;
    }

//    var reg=/^[a-zA-Z]\w+$/;
//    var regexFieldName = reg.test(finished_form.field_name);
//    if(regexFieldName != true){
//        layer.msg("please input correct FieldName");
//        return;
//    }
    if(finished_form.field_type==null||finished_form.field_type==''||finished_form.field_type==undefined){
        layer.msg("please select field_type");
        return;
    }

    $.post("/service/field/update",finished_form,function (data) {
        if(data.code=="suc"){
            $("#myModal2").modal("hide");
            layer.msg("success");
            queryList(1 ,true);
        }else{
            queryList(1 ,true);
            layer.msg("fail");
        }
    });
}


function deleteById(id) {
  $.get("/service/field/delete",{"id":id},function(data){
              if(data.data == true){
                  layer.msg("delete success");
                  queryList(1 ,true);
              }else{
                  layer.msg("delete fail");
              }
          }
  )
}


// 筛选条件
$(".q_filter").change(function (event) {
    queryList(1,true);
})

</script>



</body>
</html>
