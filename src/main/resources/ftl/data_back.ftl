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

                <h2>Metadata Type Row Data <span></span></h2>

                <div class="page-bar">

                    <ul class="page-breadcrumb">
                        <li>
                            <a href="index.html"><i class="fa fa-home"></i> Home</a>
                        </li>
                        <li>
                            <a href="index.html">Dashboard</a>
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
                            <h1 class="custom-font"><strong>Backup Management</strong></h1>
                           
                        </div>
                        <!-- /tile header -->


                        <!-- tile body -->
                        <div class="tile-body">

                            <table   class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Back Name</th>
                                    <th>Create Time</th>
                                    <th>status</th>
                                    <th>remark</th>
                                    <th>option user</th>
                                    <th>restore time</th>
                                    <th>Option</th>
                                </tr>
                                </thead>
                                <tbody id="dataList">
                               
                                </tbody>
                                
                            </table>
                            
                             
                        </div>
                        
                        
                       
                        <!-- /tile body -->
						<div class="tile-footer dvd dvd-top">
						  <div class="row">
			                    	<div class="col-md-12">
			                    		<div class="col-md-3">
										  <button id="addButton"
			                                    class="btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10 pull-left" ><i
			                                    class="fa fa-cog"></i> <span>Create Data Back</span></button>
										</div>
									</div>
			                    </div>
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

<!-- 添加模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="min-width:300px;max-width: 500px;">
            <div class="modal-header" style="border-color: white;">
                <h4 class="modal-title" id="myModalLabel">Create Data Back</h4>
            </div>
            <div  class="modal-body" style="border-color: white;">
                <!--添加选项-->
                <div class="tile-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group"><label for="input01" class="col-sm-3 control-label" >back name</label>
                            <div class="col-sm-9"><input type="text" class="form-control" id="name"></div>
                        </div>

                       

                        <div class="form-group"><label for="input01" class="col-sm-3 control-label">remark</label>
                            <div class="col-sm-9"><input type="text" class="form-control" id="remark"></div>
                        </div>

                    
                     
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button id="modalsumbit" class="btn btn-success btn-ef btn-ef-3 btn-ef-3c"><i
                        class="fa fa-arrow-right"></i> Submit
                </button>
                <button class="btn btn-lightred btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i
                        class="fa fa-arrow-left"></i> Cancel
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->

        <!-- /.modal -->
</div>


<#include "static/footer.ftl" >


<script>
 	var BACK_STATUS = {
			
			0 : {
				name : "已删除",
				value : '0'
			},
			1 : {
				name : "备份完毕",
				value : '1'
			},
			2 : {
				name : "还原完成",
				value : '2'
			},
			3 : {
				name : "还原失败",
				value : '3'
			},
			
			"length" :4
		};
	


var pageSize = 10;
$(document).ready(function () {
    $("#navigation li").each(function () {
        $(this).removeClass('active');
    });

	queryList(1, true);

    $("#searchButton").click(function(){
     
        queryList(1, true);
       
    });
	
	$("#addButton").click(function(){
     
       $("#myModal").modal("show");
       
    });
  	$("#modalsumbit").click(function(){
     
     layer.confirm('Are you confirm submit data to back now？', {
		  btn: ['OK','Cancel'] //按钮
		}, function(){
		var name = $("#name").val();
		var remark = $("#remark").val();
		$.post("/service/data/back/create",{
	     "name" : name,
         "remark" : remark
	     },function(data){
	     	if(data.code=='suc'){
	     		$("#myModal").modal("hide");
	     		layer.msg('Successful', {icon: 1});
	     		queryList(1, true);
	     	}else{
	     		layer.msg(data.msg, {icon: 2});
	     	}
	     	
	     })
		
		  //layer.msg('的确很重要', {icon: 1});
		});
       
    });

	
	 
});

// 刷新
function queryList(page, pageinit) {
    //查询条件
    var keyword = $("#keyword").val();

	$("#dataList").empty();
	
	 $.get("/service/data/back/list",{
	     "pageNum" : page,
         "pageSize" : pageSize
     },function(data){
	     tmpData = data;
		 var contain, content = "";
			var _totalPage = data.maxPage;
			if (data.data.length) {
				for (var i = 0; i < data.data.length; i++) {
					contain = data.data[i];
                   
                    content += "<tr> " +
                            
                            "<td>"+contain.id+"</td> " +
                            "<td>"+contain.name+"</td> " +
                            "<td>"+contain.create_time+"</td>" +
                             "<td>"+BACK_STATUS[contain.status].name+"</td>" +
                             "<td>"+contain.remark+"</td>" +
                             "<td>"+contain.op_user+"</td>" +
                             "<td>"+contain.restore_time+"</td>" +
                             
                            "<td><button u_id='"+contain.id+"'  onclick='apply("+contain.id+")' class=\"btn_update btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10\" ><i class=\"fa fa-cog\">" +
                            "</i> <span>Apply</span></button>\n" +
                            "<button onclick='deleteById("+contain.id+")' class=\"btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10\" ><i class=\"fa fa-trash\"></i> " +
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

            
	  })
	
}
function deleteById(id) {

  layer.confirm('Are you   delete this row？', {
		  btn: ['OK','Cancel'] //按钮
		}, function(){
		
		$.post("/service/data/back/delete",{
	     "id" : id
	     },function(data){
	     	if(data.code=='suc'){
	     		
	     		layer.msg('Successful', {icon: 1});
	     		queryList(1, true);
	     	}else{
	     		layer.msg(data.msg, {icon: 2});
	     	}
	     	
	     })
		
		 
});
}

function apply(id){
  layer.confirm('Are you sure   data  come back now？', {
		  btn: ['OK','Cancel'] //按钮
		}, function(){
		
		$.post("/service/data/back/apply",{
	     "id" : id
	     },function(data){
	     	if(data.code=='suc'){
	     		
	     		layer.msg('Successful', {icon: 1});
	     		queryList(1, true);
	     	}else{
	     		layer.msg(data.msg, {icon: 2});
	     	}
	     	
	     })
		
		 
});

}

</script>



</body>
</html>
