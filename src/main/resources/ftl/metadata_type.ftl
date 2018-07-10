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

                <h2>Metadata Type Data <span></span></h2>

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
                            <h1 class="custom-font"><strong>Metadata Type Management</strong></h1>
                           
                        </div>
                        <!-- /tile header -->
  						<div class="tile-widget">

                            <div class="row">
							<form class="form-horizontal" role="form"  onsubmit="return false" >
                                      
                                <div class="form-group col-md-5">
                                	<label  class="col-md-5 control-label">Company Name</label>
                                	 <div class="form-group col-md-7">
                                	 	<select id="search_company_id" class="form-control">
                                            <option  value="">Please Select Company</option>
                                	 	 <#list companyList as c>

                                   	   		<option  value="${c.company_id}"> ${c.company_name}</option>
                                  		</#list>
                                   		</select>
                                   	</div>
                                 
                                </div>

                                <div class="form-group col-md-5">

                                    <label  class="col-md-5 control-label">Unit Category</label>
                                    <div class="form-group col-md-7">
                                        <select id="q_unit_category" class="form-control">
                                            <option value=""> Please Unit Category</option>
                                            <option>quantity</option>
                                            <option>weight</option>
                                            <option>percentage</option>

                                        </select>
                                    </div>
                                </div>

                             
                               
								<div class="form-group col-md-2">
									<button id="searchBtn" class="btn-success btn-rounded btn-ef btn-ef-7 btn-ef-7h mb-10"><i class="fa fa-search"></i> Search</button>
								
								</div>
                         
								</form>
                            </div>
                        </div>

                        <!-- tile body -->
                        <div class="tile-body">

                            <table   class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Company Id</th>
                                    <th>Metadata Type Name</th>
                                    <th>Unit</th>
                                    <th>Create Time</th>
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
									<button type="button" id="addRowBtn" class="btn btn-primary btn-rounded mb-10  pull-left" style="margin-bottom: 10px !important;">ADD Data</button>
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
                                <label class="col-sm-2 control-label">Metadata Type Name</label>
                                <div class="col-sm-10">
                                    <input id="addProductName" type="text" class="form-control">
                                </div>
                            </div>
                            <hr class="line-dashed line-full">
                            
                            	<div class="form-group">
			                        <label class="col-sm-2 control-label">Company Name</label>
			                        <div class="col-sm-10">
										
			                           
			                           <select id="add_company_id" class="form-control">
                                	 	 <#list companyList as c>
                                   	   		<option  value="${c.company_id}"> ${c.company_name}</option>
                                  		</#list>
			                             	
			                             </select>
			
			                          
			
			                        </div>
			                    </div>
                   
                            
                              <hr class="line-dashed line-full">
                               <div class="form-group">
			                        <label class="col-sm-2 control-label">Chart Type</label>
			                        <div class="col-sm-10">
										
			                             <select class="form-control" id="newChartType">
			                               <#list charts as c>
                                   	   			<option  value="${c.pos}"> ${c.chart_type}</option>
                                  		   </#list>
			                             	
			                             </select>
			
			                          
			
			                        </div>
			                    </div>
                       <#--<hr class="line-dashed line-full">-->
                       <#--<div class="form-group">-->
                       <#--<label class="col-sm-2 control-label">Unit Name</label>-->
                       <#--<div class="col-sm-10">-->
                       <#--<select id="newUnit" class="form-control">-->
                           <#--<option value="">Please Select...</option>-->
                           <#--<option value="billion">billion</option>-->
                           <#--<option value="million">million</option>-->
                           <#--<option value="ton">ton</option>-->
                           <#--<option value="%">%</option>-->
                       <#--</select>-->
                       <#--</div>-->
                       <#--</div>-->
			                  <hr class="line-dashed line-full">
                             <div class="form-group">
                                <label class="col-sm-2 control-label">Unit Type</label>
                                <div class="col-sm-10">
                                   <select id="newUnit_Type" class="form-control" onChange="setMajor()">
                                       <option value="-1"> Please Unit Category</option>
                                       <option value="0">RMB</option>
                                       <option value="1">weight</option>
                                       <option value="2">percentage</option>
                                       <option value="3">head</option>
                                   </select>
                                </div>
                            </div>
                           <hr class="line-dashed line-full">
                           <div class="form-group">
                               <label class="col-sm-2 control-label">Unit Name</label>
                               <div class="col-sm-10">
                                   <select id="newUnit" class="form-control">
                                   </select>
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


<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title custom-font">Update Row Data</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Metadata Type Name</label>
                        <div class="col-sm-10">
                            <input id="updateProductName" type="text" class="form-control">
                            <input id="upid" type="hidden" class="form-control">
                        </div>
                    </div>
                     <hr class="line-dashed line-full">
                            
                    	<div class="form-group">
	                        <label class="col-sm-2 control-label">Company Name</label>
	                        <div class="col-sm-10">
								
	                           
	                           <select id="up_company_id" class="form-control">
                        	 	 <#list companyList as c>
                           	   		<option  value="${c.company_id}"> ${c.company_name}</option>
                          		</#list>
	                             	
	                             </select>
	
	                          
	
	                        </div>
	                    </div>
                    <hr class="line-dashed line-full">
                   <div class="form-group">
                        <label class="col-sm-2 control-label">Chart Type</label>
                        <div class="col-sm-10">
							
                             <select class="form-control" id="upChartType">
                             	<#list charts as c>
                                   	  <option  value="${c.pos}"> ${c.chart_type}</option>
                                </#list>
                             </select>

                          

                        </div>
                    </div>
                     <#--<hr class="line-dashed line-full">-->
                     <#--<div class="form-group">-->
                        <#--<label class="col-sm-2 control-label">Unit Name</label>-->
                        <#--<div class="col-sm-10">-->
                           <#--<select id="upUnit" class="form-control">-->
                           	   <#--<option value="">Please Select...</option>-->
                           	   <#--<option value="billion">billion</option>-->
                           	   <#--<option value="million">million</option>-->
                           	   <#--<option value="ton">ton</option>-->
                           	   <#--<option value="%">%</option>-->
                           <#--</select>-->
                        <#--</div>-->
                    <#--</div>-->
                    <hr class="line-dashed line-full">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Unit Type</label>
                        <div class="col-sm-10">
                            <select id="upUnit_Type" class="form-control" onChange="setMajor1()">
                                <option value="-1"> Please Unit Category</option>
                                <option value="0">RMB</option>
                                <option value="1">weight</option>
                                <option value="2">percentage</option>
                                <option value="3">head</option>
                            </select>
                        </div>
                    </div>
                    <hr class="line-dashed line-full">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Unit Name</label>
                        <div class="col-sm-10">
                            <select id="upUnit" class="form-control">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button id='updateBtn' class="btn btn-success btn-ef btn-ef-3 btn-ef-3c"><i class="fa fa-arrow-right"></i> Submit</button>
                <button class="btn btn-lightred btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Cancel</button>
            </div>
        </div>
    </div>
</div>



<#include "static/footer.ftl" >


<script>
  var tmpData;

  var d = new Array();
  d[0] = ["billion","million"];
  d[1] = ["ton"];
  d[2] = ["%"];
  d[3] = ["head"];
  var pageSize = 10;
$(document).ready(function () {
 $("#navigation li").each(function () {
        $(this).removeClass('active');
    });
    //添加菜单选中
    $('#menu4').addClass('active');
    $('#menu4-1').addClass('active');
	queryList(1, true);

    $("#searchBtn").click(function(){
     
        queryList(1, true);
       
    });
    
    
	
	$("#addRowBtn").click(function(){
	   
        $("#addProductName").val("");
  		$("#myModal").modal("show")
	});
	$("#saveBtn").click(function(){
  	
  		var addProductName  = $("#addProductName").val();
  		var newUnit  = $("#newUnit").val();
  		var newChartType  = $("#newChartType").val();
  		var add_company_id = $("#add_company_id").val();
  		
  		if(addProductName==null||addProductName==''||addProductName==undefined){
  			layer.msg("please select addProductName");
  			return;
  		}

  		var productdata = {};
        productdata.company_id=add_company_id;
        productdata.metadata_type_name = addProductName;
        productdata.unit = newUnit;
        productdata.chart_type = newChartType;
  	
  		
  		$.post("/service/data/metadatatype/addRow",productdata,function(result){
    		if(result.code=='suc'){
    			$("#myModal").modal("hide");
    			queryList(1, true);
    		}else{
    			layer.msg(result.msg);
    		}
  		});
  		
	});
	$("#updateBtn").click(function(){
	    var id = $("#upid").val();
		updateMetadata(id);
	
	});
	
  

	 
});

// 刷新
function queryList(page, pageinit) {
    //查询条件
      var search_company_id = $("#search_company_id").val();
      var search_unit_category=$("#q_unit_category").val();

	$("#dataList").empty();
	
	 $.get("/service/data/metadatatype/query",{
	     "pageNum" : page,
         "pageSize" : pageSize,
         "company_id" : search_company_id,
         "unit_category" : search_unit_category
     },function(data){
	     tmpData = data;
		 var contain, content = "";
			var _totalPage = data.maxPage;
			if (data.data.length) {
				for (var i = 0; i < data.data.length; i++) {
					contain = data.data[i];
                    var date=new Date(contain.create_time);
                    content += "<tr> " +
                            "<td>"+contain.company_id+"</td> " +
                            "<td>"+contain.metadata_type_name+"</td> " +
                            "<td>"+contain.unit+"</td> " +
                            "<td>"+formatDate(date, 'yyyy-MM-dd hh:mm') +"</td>" +
                            "<td>" +
                            "<button u_id='"+contain.id+"'  onclick='showUpdateMetadata("+contain.id+")' class=\"btn_update btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10\" ><i class=\"fa fa-cog\">" +
                            "</i> <span>Update</span></button>\n" +
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

function showUpdateMetadata(id){
 	 var current_row;
     $("#upid").val(id);
     $("#updateProductName").val("");

    var major=$("#upUnit");
     major.empty();
     // 查找是哪一个row
     for(var i = 0;i < tmpData.data.length;i++){
         if(tmpData.data[i].id==id){
            current_row = tmpData.data[i];
            $("#updateProductName").val(current_row.metadata_type_name);
            $("#up_company_id").val(current_row.company_id);


            var upUnit =  current_row.unit;
            var major=$("#upUnit");
            var o ="<option value='"+upUnit+"'>"+upUnit+"</option>"
             // 将option追加到下拉列表末尾
             major.append(o);

            $("#myModal2").modal("show");
         }
     }

             

}
function updateMetadata(id){
	 var finished_form = {};
	
	 finished_form.id = id;
	 finished_form.chart_type = $("#upChartType").val();;
	 finished_form.metadata_type_name = $("#updateProductName").val();
	 finished_form.company_id = $("#up_company_id").val();
	 finished_form.unit =  $("#upUnit").val();;
	 if(finished_form.metadata_type_name==null||finished_form.metadata_type_name==''||finished_form.metadata_type_name==undefined){
	     layer.msg("please select metadata type name");
	     return;
	 }
	
	$.post("/service/data/metadatatype/update",finished_form,function (data) {
        if(data.code=="suc"){
            $("#myModal2").modal("hide");
            layer.msg("success");
            queryList(1 ,false);
        }else{
            layer.msg("fail");
        }
    });

}


function deleteById(id) {
  $.get("/service/data/metadatatype/delete",{"id":id},function(data){
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

  function formatDate(date,fmt){
      var o = {
          'M+' : date.getMonth() +1,                    //月份
          'd+' : date.getDate(),                        //日
          'h+' : date.getHours(),                       //小时
          'm+' : date.getMinutes(),                     //分
          's+' : date.getSeconds(),                     //秒
          "q+":  Math.floor((date.getMonth() + 3) / 3), //季度
          "S":   date.getMilliseconds()                 //毫秒
      };
      if(/(y+)/.test(fmt)){   //年份
          fmt = fmt.replace(RegExp.$1,(date.getFullYear()+'').substr(4-RegExp.$1.length));
      }
      for(var k in o){
          if (new RegExp("(" + k + ")").test(fmt)){
              var str = o[k] + '';
              fmt = fmt.replace(RegExp.$1,(RegExp.$1.length === 1) ? str:padLeftZero(str));
          }
      }
      return fmt;
  };

  function padLeftZero(str){
      return ('00'+str).substr(str.length);
  }
  
  function  setMajor() {
      var index = $("#newUnit_Type").val();
      var major = $("#newUnit");
      if(index!=-1) {
          // 清空专业下拉列表
          major.empty();
          var arry = d[index];
          for(i=0;i<arry.length;i++) {
              // 产生一个option,参数为(内容,位置);
              var o ="<option value='"+arry[i]+"'>"+arry[i]+"</option>"
              // 将option追加到下拉列表末尾
              major.append(o);
          }
      } else {
          // 清空专业下拉列表
          major.empty();
      }

  }

  function  setMajor1() {
      var index = $("#upUnit_Type").val();
      var major = $("#upUnit");
      if (index != -1) {
          // 清空专业下拉列表
          major.empty();
          var arry = d[index];
          for (i = 0; i < arry.length; i++) {
              // 产生一个option,参数为(内容,位置);
              var o = "<option value='" + arry[i] + "'>" + arry[i] + "</option>"
              // 将option追加到下拉列表末尾
              major.append(o);
          }
      } else {
          // 清空专业下拉列表
          major.empty();
      }
  }

</script>



</body>
</html>
