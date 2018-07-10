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

                <h2>Metadata Data <span></span></h2>

                <div class="page-bar">

                    <ul class="page-breadcrumb">
                        <li>
                            <a href="/"><i class="fa fa-home"></i> Home</a>
                        </li>
                        <li>
                            <a href="">Metadata</a>
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
                            <h1 class="custom-font"><strong>Metadata Management</strong></h1>

                        </div>
                        <!-- /tile header -->

                        <!-- tile body -->
                        <div class="tile-body">
                            <div class="row">

                                <div class="form-group col-md-3">

                                  <select id="q_company_id" class="form-control q_filter">
                                   	<option value=""> Please Select Company</option>
                                    <#list companyList as c>
                                   	   <option  value="${c.company_id}"> ${c.company_name}</option>
                                  	</#list>
                                  </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <select id="q_chart_type" class="form-control q_filter">
                                        <option value=""> Please Select Chart Type</option>
                                    <#list charts as c>
                                        <option  value="${c.pos}"> ${c.chart_type}</option>
                                    </#list>
                                    </select>
                                </div>

                                <#--<div class="form-group col-md-3">
                                    <select id="q_year" class="form-control q_filter">
                                    		<option value=""> Please Select Year</option>
                                    		<option>1993</option>
                                          	<option>1994</option>
                                          	<option>1995</option>
                                          	<option>1996</option>
                                          	<option>1997</option>
                                          	<option>1998</option>
                                          	<option>1999</option>
                                          	<option>2000</option>
                                          	<option>2001</option>
                                          	<option>2002</option>
                                          	<option>2003</option>
                                          	<option>2004</option>
                                          	<option>2005</option>
                                          	<option>2006</option>
                                          	<option>2007</option>
                                          	<option>2008</option>
                                          	<option>2009</option>
                                          	<option>2010</option>
                                          	<option>2011</option>
                                          	<option>2012</option>
                                          	<option>2013</option>
                                          	<option>2014</option>
                                          	<option>2015</option>
                                          	<option>2016</option>
                                          	<option>2017</option>
                                          	<option>2018</option>
                                    </select>
                                </div>-->
                                <#--<div class="form-group col-md-3">-->
                                  <#--<select id="q_chart_type" class="form-control q_filter">-->
                                   	<#--<option value=""> Please Select Chart Type</option>-->
                                   <#--<#list charts as c>-->
                                   	   	<#--<option  value="${c.pos}"> ${c.chart_type}</option>-->
                                   <#--</#list>-->
                                  <#--</select>-->
                                <#--</div>-->
								<div class="form-group col-md-1">
									<button id="searchBtn" class="btn-success btn-rounded btn-ef btn-ef-7 btn-ef-7h mb-10"><i class="fa fa-search"></i> Search</button>
								</div>
                                <#--<div class="form-group col-md-1">
                                    <button id="batchUpdate" class="btn btn-primary btn-rounded mb-10 pull-left" style="margin-bottom: 10px !important;">Batch update</button>
                                </div>-->
                                <div class="form-group col-md-1">
                                </div>
                            </div>
                            <table  id="editable" class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>CompanyId</th>
                                    <th>CompanyName</th>
                                    <th>Year</th>
                                    <th>MetadataName</th>
                                    <th>Turnover</th>
                                    <th>Unit</th>
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
                                            <label for="input01" class="col-sm-2 control-label">Company Name</label>
                                            <div class="col-sm-10">
                                                 <select id="newCompanyId" class="form-control">
                                                   <#list companyList as c>
				                                   	   <option value="${c.company_id}"> ${c.company_name}</option>
				                                  
				                                  	
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
                                        <hr class="line-dashed line-full">

                                        <div class="form-group">
                                            <label for="input02" class="col-sm-2 control-label"> Start Year</label>
                                            <div class="col-sm-4">
                                                  <select id="startYear" class="form-control">
                                                  	<option>1993</option>
                                                  	<option>1994</option>
                                                  	<option>1995</option>
                                                  	<option>1996</option>
                                                  	<option>1997</option>
                                                  	<option>1998</option>
                                                  	<option>1999</option>
                                                  	<option>2000</option>
                                                  	<option>2001</option>
                                                  	<option>2002</option>
                                                  	<option>2003</option>
                                                  	<option>2004</option>
                                                  	<option>2005</option>
                                                  	<option>2006</option>
                                                  	<option>2007</option>
                                                  	<option>2008</option>
                                                  	<option>2009</option>
                                                  	<option>2010</option>
                                                  	<option>2011</option>
                                                  	<option>2012</option>
                                                  	<option>2013</option>
                                                  	<option>2014</option>
                                                  	<option>2015</option>
                                                  	<option>2016</option>
                                                  	<option>2017</option>
                                                  	<option>2018</option>
                                                  	
                                                  </select>
                                            </div>
                                            <label for="input02" class="col-sm-2 control-label"> Stop Year</label>
                                            <div class="col-sm-4">
                                                <select id="stopYear" class="form-control">
                                                    <option>1993</option>
                                                    <option>1994</option>
                                                    <option>1995</option>
                                                    <option>1996</option>
                                                    <option>1997</option>
                                                    <option>1998</option>
                                                    <option>1999</option>
                                                    <option>2000</option>
                                                    <option>2001</option>
                                                    <option>2002</option>
                                                    <option>2003</option>
                                                    <option>2004</option>
                                                    <option>2005</option>
                                                    <option>2006</option>
                                                    <option>2007</option>
                                                    <option>2008</option>
                                                    <option>2009</option>
                                                    <option>2010</option>
                                                    <option>2011</option>
                                                    <option>2012</option>
                                                    <option>2013</option>
                                                    <option>2014</option>
                                                    <option>2015</option>
                                                    <option>2016</option>
                                                    <option>2017</option>
                                                    <option>2018</option>

                                                </select>
                                            </div>
                                        </div>



                                        <hr class="line-dashed line-full">

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Metadata Type</label>
                                            <div class="col-sm-10">
												
                                                 <select class="form-control" id="newProductId">
                                                 	
                                                 </select>

                                              

                                            </div>
                                        </div>

                                        <hr class="line-dashed line-full">

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Remark</label>
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

<#--
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title custom-font">Update Row Data</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">

                    <div class="form-group">
                        <label for="input01" class="col-sm-2 control-label">CompanyId</label>
                        <div class="col-sm-10">
                            <select id="up_company_id" class="form-control">
                            <#list companyList as c>
                                <option value="${c.company_id}"> ${c.company_name}</option>


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
                    <hr class="line-dashed line-full">

                    <div class="form-group">
                        <label for="input02" class="col-sm-2 control-label">Year</label>
                        <div class="col-sm-10">
                            <select id="up_year" class="form-control">
                                <option>1993</option>
                                <option>1994</option>
                                <option>1995</option>
                                <option>1996</option>
                                <option>1997</option>
                                <option>1998</option>
                                <option>1999</option>
                                <option>2000</option>
                                <option>2001</option>
                                <option>2002</option>
                                <option>2003</option>
                                <option>2004</option>
                                <option>2005</option>
                                <option>2006</option>
                                <option>2007</option>
                                <option>2008</option>
                                <option>2009</option>
                                <option>2010</option>
                                <option>2011</option>
                                <option>2012</option>
                                <option>2013</option>
                                <option>2014</option>
                                <option>2015</option>
                                <option>2016</option>
                                <option>2017</option>
                                <option>2018</option>

                            </select>
                        </div>
                    </div>



                    <hr class="line-dashed line-full">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Sales Amount</label>
                        <div class="col-sm-10">
                            <input id="up_val" type="text" class="form-control">
                        </div>
                    </div>

                    <hr class="line-dashed line-full">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Metadata Name</label>
                        <div class="col-sm-10">

                            <select class="form-control" id="up_product_name">
                         
                            </select>



                        </div>
                    </div>

                    <hr class="line-dashed line-full">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Remark</label>
                        <div class="col-sm-10">
                            <textarea id="up_remark" class="form-control" rows="5" name="message" id="message" placeholder="remark..."></textarea>
                        </div>
                    </div>





                </form>
            </div>
            <div class="modal-footer">
                <button id='btn_update_submit' class="btn btn-success btn-ef btn-ef-3 btn-ef-3c"><i class="fa fa-arrow-right"></i> Submit</button>
                <button class="btn btn-lightred btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Cancel</button>
            </div>
        </div>
    </div>-->
</div>



<#include "static/footer.ftl" >


<!-- ===============================================
============== Page Specific Scripts ===============
================================================ -->
<script>
  var g_data = {};
  var g_company = {
      <#list companyList as c>
      ${c.company_id}:"${c.company_name}",
      </#list>

  };

  var g_product = {
      <#list productList as p>
      ${p.metadata_type_id}:"${p.metadata_type_name}",
      </#list>

  };

  <#--var pageSize = 10;-->
$(document).ready(function () {
    $("#navigation li").each(function () {
        $(this).removeClass('active');
    });
    //添加菜单选中
    $('#menu4').addClass('active');
    $('#menu4-2').addClass('active');
    //queryList(1, true);


//    var v = $("#newChartType").val();
//
//    $.get("/service/data/metadatatype/get", {"chart_type": v}, function (result) {
//        if (result.code == 'suc') {
//
//            var list = result.data;
//            var op = "";
//            for (var i = 0; i < list.length; i++) {
//                op += "<option value=" + list[i].metadata_type_id + "> " + list[i].metadata_type_name + "</option>"
//            }
//            $("#newProductId").html(op)
//        } else {
//            layer.msg(result.msg);
//        }
//    });



	$("#newChartType,#newCompanyId").change(function () {
	      //var v = $(this).children('option:selected').val();
        var newCompanyId =$("#newCompanyId").children('option:selected').val();
        var newChartType =$("#newChartType").children('option:selected').val();
          $.get("/service/data/metadatatype/get",{"chart_type":newChartType,"company_id":newCompanyId},function(result){
    		if(result.code=='suc'){
    		    var list = result.data;
    			var op ="";
    			for(var i=0;i<list.length;i++){
    				op+="<option value="+list[i].metadata_type_id+"> "+list[i].metadata_type_name+"</option>"
    			}
    			$("#newProductId").html(op)
    		}else{
    			layer.msg(result.msg);
    		}
  		});
    });

//	$("#upChartType").change(function () {
//
//          var v = $(this).children('option:selected').val();
//          $.get("/service/data/metadatatype/get",{"chart_type":v},function(result){
//    		if(result.code=='suc'){
//    		    var list = result.data;
//    			var op ="";
//    			for(var i=0;i<list.length;i++){
//    				op+="<option value="+list[i].metadata_type_id+"> "+list[i].metadata_type_name+"</option>"
//    			}
//    			$("#up_product_name").html(op)
//    		}else{
//    			layer.msg(result.msg);
//    		}
//  		});
//    });
});
	<#---->
	<#---->
	$("#searchBtn").click(function(){
  		refresh();
	});
    <#--$("#batchUpdate").click(function(){-->
        <#--batchUpdate();-->
    <#--});-->
	$("#addRowBtn").click(function(){
  		$("#myModal").modal("show")
	});
	$("#saveBtn").click(function(){
  		var newCompanyId  = $("#newCompanyId").val();
  		/*var newYear  = $("#newYear").val();
  		var newAmount  = $("#newAmount").val();*/
  		var startYear = $("#startYear").val();
  		var stopYear = $("#stopYear").val();
  		var newProductId  = $("#newProductId").val();
  		var newRemark  = $("#newRemark").val();
  		var chartType  = $("#newChartType").val();

  		if(newCompanyId==null||newCompanyId==''||newCompanyId==undefined){
  			layer.msg("please select company");
  			return;
  		}
  		if(startYear==null||startYear==''||startYear==undefined){
  			layer.msg("please select start year");
  			return;
  		}
        if(stopYear==null||stopYear==''||stopYear==undefined){
            layer.msg("please select stop year");
            return;
        }
  		if(newProductId==null||newProductId==''||newProductId==undefined){
  			layer.msg("please select metadata type");
  			return;
  		}

  		var metadata = {};
  		metadata.company_id = newCompanyId;
  		metadata.start_year = startYear;
  		metadata.stop_year =stopYear;
  		//metadata.val = newAmount;
  		metadata.metadata_type_id = newProductId;
  		metadata.remark = newRemark;
  		metadata.chart_type = chartType;


  		$.post("/service/data/metadata/addRow",metadata,function(result){
    		if(result.code=='suc'){
    			$("#myModal").modal("hide");
/*    			queryList(1, true);*/
                refresh();
    		}else{
    			layer.msg(result.msg);
    		}
  		});

	});

	 <#---->
<#--});-->

<#--// 刷新-->
<#--function queryList(page, pageinit) {-->
    <#--var q_company = $("#q_company_id").val();-->
    <#--var q_year = $("#q_year").val();-->
    <#--var q_chart_type = $("#q_chart_type").val();-->

	<#--$("#dataList").empty();-->
	<#---->
	 <#--$.get("/service/data/metadata/query",{-->
	     <#--"pageNum" : page,-->
         <#--"pageSize" : pageSize,-->
         <#--"company" : q_company,-->
         <#--"year" : q_year,-->
         <#--"chart_type":q_chart_type-->
     <#--},function(data){-->
	     <#--g_data = data;-->
		 <#--var contain, content = "";-->
			<#--var _totalPage = data.maxPage;-->
			<#--if (data.data.length) {-->
				<#--for (var i = 0; i < data.data.length; i++) {-->
					<#--contain = data.data[i];-->
					<#--content += "<tr> " +-->
                            <#--"<td>"+contain.company_id+"</td> " +-->
                            <#--"<td>"+g_company[contain.company_id]+"</td> " +-->
                            <#--"<td>"+contain.year+"</td> " +-->
                            <#--"<td>"+g_product[contain.metadata_type_id]+"</td>" +-->
                            <#--"<td>"+contain.val+"</td>" +-->
                            <#--"<td>"+contain.tt.unit+"</td>" +-->
                            <#--"<td>"+contain.remark+"</td>"+-->
                            <#--"<td>" +-->
                            <#--"<button u_id='"+contain.id+"' class=\"btn_update btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10\"><i class=\"fa fa-cog\">" +-->
                            <#--"</i> <span>update</span></button>\n" +-->
                            <#--"<button onclick='deleteById("+contain.id+")' class=\"btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10\"><i class=\"fa fa-trash\"></i> " +-->
                            <#--"<span>Delete</span></button>\n" +"</td>"+"</tr>" ;-->


				<#--}-->
				<#--$("#dataList").append(content);-->
			<#--}-->
			<#--if (pageinit) {-->
				<#--$('#Pagination').empty();-->
				<#--$.jqPaginator('#Pagination',{-->
					<#--totalPages : _totalPage,-->
					<#--visiblePages : 10,-->
					<#--currentPage : 1,-->
					<#--prev : '<li class="prev"><a href="javascript:scroll(0,0)">Previous</a></li>',-->
					<#--next : '<li class="next"><a href="javascript:scroll(0,0)">Next</a></li>',-->
					<#--first : '<li class="first"><a href="javascript:scroll(0,0)">First</a></li>',-->
					<#--last : '<li class="last"><a href="javascript:scroll(0,0)">End</a></li>',-->
					<#--page : '<li class="page"><a href="javascript:scroll(0,0)">{{page}}</a></li>',-->
					<#--onPageChange : function(num, type) {-->
						<#--if ((this.currentPage != 1)|| (1 != num)) {-->
							<#--queryList(num,false);-->
						<#--}-->
					<#--}-->
				<#--});-->
			<#--}-->





             <#--$(".btn_update").click(function(){-->
                 <#--var current_row;-->
                 <#--var u_id = $(this).attr("u_id");-->
                 <#--// 查找是哪一个row-->
                 <#--for(var i = 0;i < g_data.data.length;i++){-->
                     <#--if(g_data.data[i].id==u_id){-->
                        <#--current_row = g_data.data[i];-->
                        <#--break;-->
                     <#--}-->
                 <#--}-->

                 <#--$("#up_company_id").val(current_row.company_id+"");-->
                 <#--$("#up_year").val(current_row.year);-->
                 <#--$("#up_product_name").val(current_row.metadata_type_id);-->
                 <#--$("#up_val").val(current_row.val);-->
                 <#--$("#up_remark").val(current_row.remark);-->

                 <#--$("#myModal2").modal("show");-->

                 <#--$('#btn_update_submit').click(function (data) {-->
                     <#--var finished_form = {};-->

                     <#--finished_form.id = u_id;-->
                     <#--finished_form.chart_type = $("#upChartType").val();-->
                     <#--finished_form.create_time = new Date(current_row.create_time);-->
                     <#--finished_form.company_id = $("#up_company_id").val();-->
                     <#--finished_form.year = $("#up_year").val();-->
                     <#--finished_form.val = $("#up_val").val();-->
                     <#--finished_form.metadata_type_id = $("#up_product_name").val();-->
                     <#--finished_form.remark = $("#up_remark").val();-->

                     <#--if(finished_form.company_id==null||finished_form.company_id==''||finished_form.company_id==undefined){-->
                         <#--layer.msg("please select company");-->
                         <#--return;-->
                     <#--}-->
                     <#--if(finished_form.year==null||finished_form.year==''||finished_form.year==undefined){-->
                         <#--layer.msg("please select year");-->
                         <#--return;-->
                     <#--}-->
                     <#--if( finished_form.metadata_type_id==null|| finished_form.metadata_type_id==''|| finished_form.metadata_type_id==undefined){-->
                         <#--layer.msg("please select metadata_type_id");-->
                         <#--return;-->
                     <#--}-->
                     <#--if(finished_form.val==null||finished_form.val==''||finished_form.val==newAmount){-->
                         <#--layer.msg("please input amount");-->
                         <#--return;-->
                     <#--}-->

                     <#--update(finished_form);-->
                 <#--});-->
             <#--});-->
	  <#--})-->
	<#---->
<#--}-->

<#--function update(finished_form) {-->
    <#--$.post("/service/data/metadata/update",finished_form,function (data) {-->
        <#--if(data.code=="suc"){-->
            <#--$("#myModal2").modal("hide");-->
            <#--layer.msg("success");-->
<#--//            queryList(1 ,false);-->
        <#--}else{-->
            <#--layer.msg("fail");-->
        <#--}-->
    <#--});-->
<#--}-->


function deleteById(id) {
  $.get("/service/data/metadata/delete",{"id":id},function(data){
              if(data.data == true){
                  layer.msg("delete success");
                  refresh();
              }else{
                  layer.msg("delete fail");
              }
          }
  )
}

<#--function  batchUpdate() {-->
    <#--var company_id = $("#q_company_id").val();-->
    <#--var year = $("#q_year").val();-->
    <#--var chart_type = $("#q_chart_type").val();-->

    <#--window.location.href = "/service/data/metadata/batch?company_id=" + company_id+"&year="+year+"&chart_type="+chart_type;-->



<#--}-->

// 重绘表格
function refresh() {
    if(oTable != undefined) {
    oTable.clear().draw();
    oTable.destroy();
    }
    var company_id = $("#q_company_id").val();
    var year = $("#q_year").val();
    var chart_type = $("#q_chart_type").val();

    $.get("/service/data/metadata/query",{
        "pageNum" : 1,
        "pageSize" : 1000,
        "company" : company_id,
        "year" : year,
        "chart_type":chart_type
    },function(data) {
        g_data = data.data;

        // 公司名称
        for(var i=0;i<g_data.length;i++){
            g_data[i]["company_name"] = g_company[g_data[i]["company_id"]];
        }

        // 产品名
        for(var i=0;i<g_data.length;i++){
            g_data[i]["MetadataName"] = g_product[g_data[i]["metadata_type_id"]];
        }

        // unit
        for(var i=0;i<g_data.length;i++){
            g_data[i]["unit"] = g_data[i]["tt"]["unit"];
        }

        // id
        for(var i=0;i<g_data.length;i++){
            g_data[i]["DT_RowId"] = g_data[i]["id"];
        }

        for(var i=0;i<g_data.length;i++){
            g_data[i]["turnover"] = g_data[i]["val"];
        }


        /* Init DataTables */
        oTable = $('#editable').DataTable({
            dom:'lBrtip',  // 隐藏搜索框
            data: g_data,
            columns: [
                { data: 'company_id' },
                { data: 'company_name' },
                { data: 'year' },
                { data: 'MetadataName' },
                { data: 'turnover' },
                { data: 'unit' },
                { data: 'remark' },
                { data: null}
            ],
            columnDefs: [
                { className: "update", "targets": [2] },
                { className: "update", "targets": [4] },
                { className: "update", "targets": [6] },
                { "orderable": false, "targets": 7 },
                {
                    targets: 7,
                    render: function (data, type, row, meta) {
                        var html = '';
                        var id = row.DT_RowId;

                        html += '<button id="addButton" onclick="deleteById('+id+')" class="btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10 pull-left" ><i class="fa fa-cog"></i> <span>Delete</span></button></div>';
                        /*console.log("data##########")
                        console.log(data);
                        console.log("type##########")
                        console.log(type);
                        console.log("row##########")
                        console.log(row);
                        console.log("meta##########")
                        console.log(meta);*/
                        return html;
                    }
                },
            ]
        });

        /* Apply the jEditable handlers to the table */
       /* oTable.$('.update').editable('/service/data/metadata/updateCell', {
            onblur : "submit",
            "callback": function(sValue, y) {
                var row = oTable.row( this ).index();
                var col = oTable.column( this ).index();

                oTable.cell( row, col ).data( sValue ).draw();
            },
            submitdata : function(value, settings) {
                var column = oTable.column( this ).index();
                return {
                    "row_id": this.parentNode.getAttribute('id'),
                    "column":column,

                };
            },

            "width": "90%",
            "height": "100%"
        });*/

        oTable.$('.update').editable('/service/data/metadata/updateCell', {
            onblur : "submit",
            "callback": function(sValue, y) {
                var row = oTable.row( this ).index();
                var col = oTable.column( this ).index();
                var result =  eval('(' + sValue + ')');

                if (result.code !="NotAllowed"){
                    oTable.cell( row, col ).data( result.data ).draw();
                }

//                console.log(this);
//                console.log(value);
//                console.log(settings);
            },
            submitdata : function(value, settings) {
                var column = oTable.column( this ).index();
                return {
                    "row_id": this.parentNode.getAttribute('id'),
                    "column":column

                };
            },
            "width": "90%",
            "height": "100%"
        });
    });
}




<#--// 筛选条件-->
$(".q_filter").change(function (event) {
    refresh();
})



// datatables表格

var data = {};
var oTable;
$(document).ready(function() {
    refresh();
    /*$.get("/service/data/metadata/query",{
        "pageNum" : 1,
        "pageSize" : 1000,
        "company" : "",
        "year" : "",
        "chart_type":""
    },function(data) {
        g_data = data.data;

        // 公司名称
        for(var i=0;i<g_data.length;i++){
            g_data[i]["company_name"] = g_company[g_data[i]["company_id"]];
        }

        // 产品名
        for(var i=0;i<g_data.length;i++){
            g_data[i]["MetadataName"] = g_product[g_data[i]["metadata_type_id"]];
        }

        // unit
        for(var i=0;i<g_data.length;i++){
            g_data[i]["unit"] = g_data[i]["tt"]["unit"];
        }

        for(var i=0;i<g_data.length;i++){
            g_data[i]["turnover"] = g_data[i]["val"];
        }

        // id
        for(var i=0;i<g_data.length;i++){
            g_data[i]["DT_RowId"] = g_data[i]["id"];
        }


        /!* Init DataTables *!/
        oTable = $('#editable').DataTable({
//            rowId: { data: data.id },
            dom:'lBrtip',  // 隐藏搜索框
            data: g_data,
            columns: [
                { data: 'company_id' },
                { data: 'company_name' },
                { data: 'year' },
                { data: 'MetadataName' },
                { data: 'turnover' },
                { data: 'unit' },
                { data: 'remark' },
                { data: null},
            ],
            columnDefs: [
                { className: "update", "targets": [2] },
                { className: "update", "targets": [4] },
                { className: "update", "targets": [6] },
                { "orderable": false, "targets": 7 },
                {
                    targets: 7,
                    render: function (data, type, row, meta) {
                        var html = '';

                        html += '<button id="addButton" class="btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10 pull-left" ><i class="fa fa-cog"></i> <span>Delete</span></button></div>';
                        return html;
                    }
                },


            ]
        });

        /!* Apply the jEditable handlers to the table *!/
        oTable.$('.update').editable('/service/data/metadata/updateCell', {
            onblur : "submit",
            "callback": function(sValue, y) {
                var row = oTable.row( this ).index();
                var col = oTable.column( this ).index();
                var result =  eval('(' + sValue + ')');

                if (result.code !="NotAllowed"){
                oTable.cell( row, col ).data( result.data ).draw();
                }

//                console.log(this);
//                console.log(value);
//                console.log(settings);
            },
            submitdata : function(value, settings) {
                var column = oTable.column( this ).index();
                return {
                    "row_id": this.parentNode.getAttribute('id'),
                    "column":column

                };
            },
            "width": "90%",
            "height": "100%"
        });
    });
  // 导出pdf csv .....
  // $('.dataTables-example').DataTable({
  //     dom: '<"html5buttons"B>lTfgitp',
  //     buttons: [
  //         { extend: 'copy' },
  //         { extend: 'csv' },
  //         { extend: 'excel', title: 'ExampleFile' },
  //         { extend: 'pdf', title: 'ExampleFile' },

  //         {
  //             extend: 'print',
  //             customize: function(win) {
  //                 $(win.document.body).addClass('white-bg');
  //                 $(win.document.body).css('font-size', '10px');

  //                 $(win.document.body).find('table')
  //                     .addClass('compact')
  //                     .css('font-size', 'inherit');
  //             }
  //         }
  //     ]

  // });*/


});

function fnClickAddRow() {
  var table = $('#editable').DataTable();
      table.row.add( {
          "company_id":       "Tiger Nixon",
          "company_name":   "System Architect",
          "year":     "$3,120",
          "MetadataName": "2011/04/25",
          "turnover":     "Edinburgh",
          "unit":       "5421",
          "remark":       "5421"
      } ).draw();
}
</script>



</script>

<link rel="stylesheet" type="text/css" href="/assets/css/datatables.min.css">
<script src="/assets/js/datatables.min.js"></script>
<script src="/assets/js/jquery.jeditable.js"></script>
<script src="/assets/js/jquery.dataTables.editable.js" type="text/javascript"></script>

</body>

</html>
