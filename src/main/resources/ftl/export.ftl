<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang=""> <!--<![endif]-->


<head>


<#include "static/top.ftl" >

<script>
//    HTMLImageElement.prototype.crossOrigin = "anonymous";
</script>
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

                <h2>Export<span></span></h2>

                <div class="page-bar">

                    <ul class="page-breadcrumb">
                        <li>
                            <a href="index.html"><i class="fa fa-home"></i> Home</a>
                        </li>
                        <li>
                            <a href="index.html">Export</a>
                        </li>
                    </ul>


                </div>

            </div>

            <div class="row">
                <div class="col-md-12">

                    <!-- tile -->
                    <section class="tile">
                    <div class="tile-header dvd dvd-btm">
                            <h1 class="custom-font"><strong>Export Option</strong> Choose</h1>
                            <ul class="controls">
                                <li class="dropdown">

                                    <a id="selall" role="button" tabindex="0" class="dropdown-toggle settings" data-toggle="dropdown">
                                        <i class="fa fa-cog"></i>
                                        <i class="fa fa-spinner fa-spin"></i>
                                        Select All
                                    </a>

                                    

                                </li>
                              
                            </ul>
                        </div>
                    
                        <div class="tile-widget ">

                            <div class="row">

                                <div class="form-group col-md-8">
                                	<div class="col-sm-4">
                                        <select id="q_filed_id" data-placeholder="Choose a Filed..." multiple="" tabindex="3" class="chosen-select" style="width: 240px;">
                                            <#--<option value="<#list fields as f><#if f_has_next>${f.field_id},<#else>${f.field_id}</#if></#list>"> all</option>-->
		                                    <#list fields as f>
		                                        <option value="${f.field_id}"> ${f.field_name}</option>
		                                    </#list>
                                        </select>
                                    </div>
                                
                                	<div class="col-sm-4">
                                        <select id="q_chart_id" data-placeholder="Choose a Chart Type..." multiple="" tabindex="3" class="chosen-select" style="width: 240px;">
                                            <#--<option value="<#list charts as c><#if c_has_next>${c.pos},<#else>${c.pos}</#if></#list>"> all</option>-->
		                                    <#list charts as c>
		                                        <option value="${c.pos}"> ${c.chart_type}</option>
		                                    </#list>
                                        </select>
                                    </div>
                                    
                                    <div class="col-sm-4">
                                        <select id="q_company_id" multiple="" data-placeholder="Choose a Company..." tabindex="3" class="chosen-select" style="width: 240px;">
                                            <#--<option value="<#list companyList as c><#if c_has_next>${c.company_id},<#else>${c.company_id}</#if></#list>"> all</option>-->
		                                    <#list companyList as c>
		                                        <option value="${c.company_id}"> ${c.company_name}</option>
		                                    </#list>
                                        </select>
                                    </div>
                                        
                                </div>

                                
								<div class="form-group col-md-4">
									<button id="previewBtn" class="btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10" > <i class="fa fa-cog"></i> <span>Preview</span></button>
								
									<button id="exportBtn" class="btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10" "><i class="fa fa-cog"></i> <span>Export</span></button>
									
								</div>

                            </div>

                        </div>

                    </section>
                </div>

            </div>
            
            
            
            <div class="row">
	    <div class="col-md-12">
	     <#if selectCompany?? && (selectCompany?size > 0) >
	    
		     <#list selectCompany as s>

		    
		    	<section class="tile">
	
	                <!-- tile header -->
	                <div class="tile-header dvd dvd-btm">
	                    <h1 class="custom-font"><strong>Company Basic Information</strong> </h1>
	               
	                </div>
	                <!-- /tile header -->
	
	                <!-- tile body -->
	                <div class="tile-body">
	                    <div class="row">
							
	                       <div class="col-md-9">
							 <table class="table table-bordered">
	
	                             <tr>
	                                 <td>Company Name</td>
	                                 <td>${(s.company_name)!""}</td>
	                             </tr>
	                             <tr>
	                                 <td>Year of Establishment</td>
	                                 <td>${(s.establishment)!""}</td>
	                             </tr>
                                 <#--<tr>-->
                                     <#--<td>Any Activity in Cheese</td>-->
                                     <#--<td>${(s.cheese)!""}</td>-->
                                 <#--</tr>-->
	
	                         <#list s.companyFieldList as c>
                                 <#if c.field.field_type == "input" && c.field_value!="" && c.field_value?exists>
	                                 <tr>
	                                     <td>${c.field.field_name}</td>
	                                     <td>${c.field_value}</td>
	                                 </tr>
	                             </#if>
	                         </#list>
							
							        </table>
	                       </div>
	                    </div>  
	                    <div class="row">
	                        <div class="col-md-12">

	                        <#list s.companyFieldList as c>
                                <#if c.field.field_type == "textarea"  && c.field_value!="" && c.field_value?exists>
	                                <h4 class=""><strong><u>${c.field.field_name}</u></strong></h4>
	                                <p>${c.field_value}</p>
	                            </#if>
	                        </#list>
                                <h4 class=""><strong><u>Any Activity in Cheese</u></strong></h4>
                                <p>${(s.cheese)!""}</p>
						
						    </div>
						</div>
	               	</div>
	           
	            </section>

             <#--修改预览界面-->
                 <#if (selectCharts?size > 0)>
                     <#list selectCharts as c>
                         <#if c == 'top1' && s.charts_type[0] ==true>
                             <div class="row">
                                 <div class="col-md-12">
                                     <!-- tile -->
                                     <section class="tile">
                                         <!-- tile header -->
                                         <div class="tile-widget ">
                                             <h4 class="underline custom-font mb-20"><strong>Turnover</strong> </h4>
                                             <div id="${(s.company_id)!""}_top1" style="height:300px"></div>
                                         </div>
                                     </section>
                                     <!-- /tile -->
                                 </div>
                             </div>
                         </#if>
                         <#if c == 'top2_right' && s.charts_type[1] ==true>
                             <div class="row">
                                 <div class="col-md-6">

                                     <!-- tile -->
                                     <section class="tile">

                                         <!-- tile header -->

                                         <div class="tile-widget">
                                         <#--<h4 class="underline custom-font mb-20"><strong>Product Mix (sales value ${top2year})</strong> </h4>-->
                                             <h4 class="underline custom-font mb-20"><strong>Product Mix </strong> </h4>
                                             <div id="${(s.company_id)!""}_top2_left" style="height:300px"></div>
                                         </div>


                                     </section>
                                     <!-- /tile -->

                                 </div>

                                 <div class="col-md-6">

                                     <!-- tile -->
                                     <section class="tile">
                                         <div class="tile-widget">
                                             <h4 class="underline custom-font mb-20"><strong>Sales Value By Product Segment</strong> </h4>
                                             <div id="${(s.company_id)!""}_top2_right" style="height:300px"></div>
                                         </div>


                                     </section>
                                     <!-- /tile -->

                                 </div>
                             </div>
                         </#if>
                         <#if c == 'bottom' && s.charts_type[2] ==true>
                             <div class="row">

                                 <div class="col-md-12">

                                     <section class="tile">

                                         <!-- tile header -->
                                         <div class="tile-header  dvd dvd-btm">
                                             <h1 class="custom-font"><strong>Cow Population and Sales</strong></h1>

                                         </div>

                                         <div class="tile-widget">

                                             <table class="table table-bordered">
                                                 <thead id="${(s.company_id)!""}_th">

                                                 </thead>
                                                 <tbody id="${(s.company_id)!""}_tb">


                                                 </tbody>

                                             </table>
                                         </div>


                                     </section>

                                 </div>


                             </div>
                         </#if>
                     </#list>
                 </#if>
	          </#list>  
	       <#else>
	       </#if>
                    
	    </div>
  	</div>




            <#if selectCompany?? && (selectCompany?size > 0) >
            <#list selectCompany as s>
            </#list>
             <#else>
	       </#if>
            
            
            <!-- /row -->


        </div>
        


    </section>
    <!--/ CONTENT -->


</div>
<!--/ Application Content -->

<form id="exportSubmit" method="post" action="/service/data/export/Dairy Market Landscape ${(dateStr)!''}.pdf"  target="_blank">
	<input type="hidden"  name='fileds' value='${(selectFiledJson)!''}'  >
	<input type="hidden"  name='companys'  value='${(selectCompanyJson)!''}' >
	<input type="hidden"  name='charts'  value='${(selectChartsJson)!''}'  >
  <#if selectCompany?? && (selectCompany?size > 0) >
     <#list selectCompany as s>
     	 <#if (selectCharts?size > 0)>
            <#list selectCharts as c>
             <#if c == 'top1'>
              <input type="hidden"  name='imgs_1' value="${(s.company_id)!""}|top1"  id="img_${(s.company_id)!""}_top1">
             </#if>
             <#if c == 'top2_right'>
              <input type="hidden"  name='imgs_1' value="${(s.company_id)!""}|top2_left" id="img_${(s.company_id)!""}_top2_left">
              <input type="hidden"  name='imgs_1' value="${(s.company_id)!""}|top2_right" id="img_${(s.company_id)!""}_top2_right">
             </#if>
     		</#list>
     	</#if>	
     </#list>
  </#if>       

</form>

<#include "static/footer.ftl" >


<!-- ===============================================
============== Page Specific Scripts ===============
================================================ -->
<script>



	var chart_data = ${(chart_data)!'""'};
	var selectFiledJson = ${(selectFiledJson)!'""'};
	var selectChartsJson = ${(selectChartsJson)!'""'};
	var selectCompanyJson = ${(selectCompanyJson)!'""'};
	var charts_type= ${charts_type!'""'};

	
	var arrayTop1 = new Array();
    var arrayTop_left = new Array();
    var arrayTop_right = new Array();


    $(window).load(function () {

        //移除菜单选中
        $("#navigation li").each(function () {
            $(this).removeClass('active');
        });
        //添加菜单选中
        $('#menu9').addClass('active');
        $('.date-picker').datepicker({
            //rtl: App.isRTL()
            format: 'yyyy',
            autoclose: true,
            startView: 'decade',
            maxViewMode: 'years',
            minViewMode: 'years'
        });
        
        if(selectFiledJson!=null&&selectFiledJson!=''&&selectFiledJson!=undefined){
	        for (var i = 0; i < selectFiledJson.length; i++) {
	            var value = selectFiledJson[i];
	            $("#q_filed_id option[value='" + value + "']").attr('selected', 'selected');
	        }
        }
        $("#q_filed_id").chosen();
        
        
        if(selectChartsJson!=null&&selectChartsJson!=''&&selectChartsJson!=undefined){
	        for (var i = 0; i < selectChartsJson.length; i++) {
	            var value = selectChartsJson[i];
	            $("#q_chart_id option[value='" + value + "']").attr('selected', 'selected');
	        }
        }
        $("#q_chart_id").chosen();
        
        if(selectCompanyJson!=null&&selectCompanyJson!=''&&selectCompanyJson!=undefined){
	        for (var i = 0; i < selectCompanyJson.length; i++) {
	            var value = selectCompanyJson[i];
	            $("#q_company_id option[value='" + value + "']").attr('selected', 'selected');
	        }
        }
         $("#q_company_id").chosen();
        
         $("#previewBtn").click(function(){  
           var fileds = $("#q_filed_id").val();
           var charts = $("#q_chart_id").val();
           var companys = $("#q_company_id").val();
           if(fileds==null||fileds==''||fileds==undefined){
           		layer.msg("Please Choose a Field")
           		return;
           }
           
           if(charts==null||charts==''||charts==undefined){
           		layer.msg("Please Choose a Chart Type")
           		return;
           }
           
           if(companys==null||companys==''||companys==undefined){
           		layer.msg("Please Choose a Company")
           		return;
           }
           
           
           window.location.href="/service/data/export/preview?companys="+companys+"&fileds="+fileds+"&charts="+charts ;
        });
         $("#exportAllBtn").click(function () {
             window.location.href="/service/dashboard/show_exportAll";
             //window.open("/service/dashboard/show_exportAll","_blank","top=100,left=100,width=100,height=100,menubar=yes,scrollbars=no,toolbar=yes,status=yes");
         });
         
         //全选
         
         $("#selall").click(function () {
            
            var fops = $("#q_filed_id option");
            
	        for (var i = 0; i < fops.length; i++) {
	            var op = fops[i];
	            op.selected = true; 
	        }
            $("#q_filed_id").trigger("chosen:updated");  
            
            
            var qops = $("#q_chart_id option");
            
	        for (var i = 0; i < qops.length; i++) {
	            var op = qops[i];
	            op.selected = true; 
	        }
            $("#q_chart_id").trigger("chosen:updated");
            
            
            
            var cops = $("#q_company_id option");
            
	        for (var i = 0; i < cops.length; i++) {
	            var op = cops[i];
	            op.selected = true; 
	        }
            $("#q_company_id").trigger("chosen:updated");

         });
         
         
         
         for(var i=0;i<chart_data.length;i++){
         	var chart = chart_data[i];
         	var company_id = chart.company_id;
         	var top1 = chart.top1;
         	var top2_right = chart.top2_right;
         	var top2_left = chart.top2_left;
         	var bottom = chart.bottom;
         	var leftyear = chart.leftyear;
         	if(charts_type.hasOwnProperty(company_id)){
	         	if(top1!=null&&top1!=undefined&&charts_type[company_id][0]){
	         		var cht = getTop1(company_id+"_top1",company_id,top1);
	         		var top = {};
	         		top.company_id=company_id;
	         		top.chart=cht;
	         		arrayTop1.push(top);
	         	}
	         	

	         	if(top2_left!=null&&top2_left!=undefined&&charts_type[company_id][1]){
                    var cht_right = getTopRight(company_id+"_top2_right",company_id,company_id+"_top2_left",top2_right)
                    var top_right = {};
                    top_right.company_id=company_id;
                    top_right.chart=cht_right;
                    arrayTop_right.push(top_right);
                    var cht_left = getTopLeft(company_id+"_top2_left",company_id, leftyear,top2_left);
                    var top_left = {};
                    top_left.company_id=company_id;
                    top_left.chart=cht_left;
                    arrayTop_left.push(top_left);


	         	}
	         	if(bottom!=null&&bottom!=undefined&&charts_type[company_id][2]){
	         		getBottomTable(company_id,bottom);
	         	}
        	}	
    	}
//    	sleep(1000);
        
        for(var i=0;i<chart_data.length;i++){
        	var company_id = chart_data[i].company_id;
        	if(charts_type.hasOwnProperty(company_id)){
        	    //top1
        		var myChart = getTopHandler(company_id);
            	if(myChart!=null&&myChart!=undefined) {
                        var picBase64Info =null;
                        try {
                    picBase64Info= myChart.getSVG();
                        }catch (error){
                            console.error(error);
                        }
                    if(picBase64Info!=null){
                    var id = company_id + "_top1";
                    $.ajax({
                        type: "post",
                        url: "/service/data/export/getImgPath",
                        data: {
                            "chart": id + ".jpg",
                            "base64": picBase64Info
                        },
                        async: false,
                        success: function (data) {
                            var v = $("#img_" + id).val();
                            $("#img_" + id).val(v + "|" + data.data)
                            console.log($("#img_" + id).val());
                        }
                    });
                    }

                }
                	//top_left
                    /*var myChart_left = getTopHandler_left(company_id);
                    if(myChart_left!=null&&myChart_left!=undefined) {
                        var picBase64Info;
                        try {
                            picBase64Info= myChart_left.getConnectedDataURL();
                        }catch(error) {
                            window.location.href="/service/data/export/show" ;
                        }
                        var id = company_id + "_top2_left";

                        $.ajax({
                            type: "post",
                            url: "/service/data/export/getImgPath",
                            data: {
                                "chart": id + ".jpg",
                                "base64": picBase64Info
                            },
                            async: false,
                            success: function (data) {
                                var v = $("#img_" + id).val();
                                $("#img_" + id).val(v + "|" + data.data)
                                console.log($("#img_" + id).val());
                            }
                        });
                    }*/
                var myChart_left = getTopHandler_left(company_id);
                if(myChart_left!=null&&myChart_left!=undefined) {
                        var picBase64Info =null;
                        try {
                            picBase64Info= myChart_left.getSVG();
                        }catch (error){
                            console.error(error);
                            continue;
                        }
                        if(picBase64Info!=null){
                            var id = company_id + "_top2_left";

                            $.ajax({
                                type: "post",
                                url: "/service/data/export/getImgPath",
                                data: {
                                    "chart": id + ".jpg",
                                    "base64": picBase64Info
                                },
                                async: false,
                                success: function (data) {
                                    var v = $("#img_" + id).val();
                                    $("#img_" + id).val(v + "|" + data.data)
                                    console.log($("#img_" + id).val());
                                }
                            });
                        }

                }

                //top_right
                /*var myChart_right = getTopHandler_right(company_id);
                if(myChart_right!=null&&myChart_right!=undefined) {
                    var picBase64Info;
                    try {
                        picBase64Info= myChart_right.getConnectedDataURL();
                    }catch(error) {
                        window.location.href="/service/data/export/show" ;
                    }
                    var id = company_id + "_top2_right";

                    $.ajax({
                        type: "post",
                        url: "/service/data/export/getImgPath",
                        data: {
                            "chart": id + ".jpg",
                            "base64": picBase64Info
                        },
                        async: false,
                        success: function (data) {
                            var v = $("#img_" + id).val();
                            $("#img_" + id).val(v + "|" + data.data)
                            console.log($("#img_" + id).val());
                        }
                    });
                }*/
                var myChart_right = getTopHandler_right(company_id);
                if(myChart_right!=null&&myChart_right!=undefined) {
                        var picBase64Info =null;
                        try {
                            picBase64Info= myChart_right.getSVG();
                        }catch (error){
                            console.error(error);
                            continue;
                        }
                        if(picBase64Info!=null){
                            var id = company_id + "_top2_right";

                            $.ajax({
                                type: "post",
                                url: "/service/data/export/getImgPath",
                                data: {
                                    "chart": id + ".jpg",
                                    "base64": picBase64Info
                                },
                                async: false,
                                success: function (data) {
                                    var v = $("#img_" + id).val();
                                    $("#img_" + id).val(v + "|" + data.data)
                                    console.log($("#img_" + id).val());
                                }
                            });
                        }

                }

          		

        	}
        	
        	
        }
});
function getTopHandler(cid){
	
	for(var i=0;i<arrayTop1.length;i++){
		var obj = arrayTop1[i];
		if(cid==obj.company_id){
			return obj.chart;
		}
	}
}
    function getTopHandler_left(cid){

        for(var i=0;i<arrayTop_left.length;i++){
            var obj = arrayTop_left[i];
            if(cid==obj.company_id){
                return obj.chart;
            }
        }
    }
    function getTopHandler_right(cid){

        for(var i=0;i<arrayTop_right.length;i++){
            var obj = arrayTop_right[i];
            if(cid==obj.company_id){
                return obj.chart;
            }
        }
    }

	function getTop1(id,company_id,datas){
	    var firstTurnover=0;
        var lastTurnover=0;
        var index1 = datas;
        var unit = index1.unit;
	    if (index1.ss !=null && index1.ss.hasOwnProperty("bar")){
            firstTurnover = index1.ss.bar[0];
            lastTurnover=index1.ss.bar[index1.ss.bar.length-1];
        }
	    var intervalYear =0;
	    if(index1.x !=null){
            intervalYear =index1.x[index1.x.length-1]-index1.x[0];
        }

	    var CAGR= Math.pow((lastTurnover/firstTurnover),1/intervalYear)-1;
	    CAGR="CAGR: "+(CAGR*100).toFixed(1)+"%";
//	    var myChart = echarts.init(document.getElementById(id));
//		var	option = {
//            animation:false,
//			title: {
//                text: 'Turnover (in billion RMB)',
//                subtext: CAGR,
//                x:'center'
//            },
//		    tooltip: {
//		        trigger: 'axis',
//		        axisPointer: {
//		            type: 'cross',
//		            crossStyle: {
//		                color: '#999'
//		            }
//		        }
//		    },
//		    toolbox: {
//		        feature: {
//                    saveAsImage: {show: true},
//                    myTool : {
//                        show : true,
//                        title : 'excel',
//                        icon : 'image://http://pic.sfont.cn/svg/img/f7h22j.svg',
//                        onclick : function (){
//                            exportExcel(id,company_id,"");
//                        }
//                    },
//                }
//		    },
//
//		    xAxis: [
//		        {
//		            type: 'category',
//		            data: index1.xs,
//		            axisPointer: {
//		                type: 'shadow'
//		            },
//		             axisLabel: {
//	                  show: true,
//	                  interval: 'auto',
//	                  formatter: '{value}'
//	                }
//		        }
//		    ],
//		    yAxis: [
//		        {
//		            type: 'value',
//                    name: 'Unit ('+unit+')',
//		            min: 0,
////		            max: 100,
////		            interval: 50,
//		            axisLabel: {
//		                formatter: '{value}'
//		            }
//		        }
//		    ],
//            series: [{
//                data: index1.ss.bar,
//                type: 'bar'
//            }]
//        };
//		myChart.clear();
//        myChart.setOption(option);
    	/**
		var picBase64Info = myChart.getConnectedDataURL();

		  $.post("/service/data/export/getImgPath", {
            "chart": id+".jpg",
            "base64":picBase64Info
        }, function (data) {
        	var v  = $("#img_"+id).val();
        	$("#img_"+id).val(v+"|"+data.data)

        });
		  **/

        var	options = {
            chart: {
                type: 'column'
            },
            colors:['#0068A6','#01ACD8','#008874','#EFC028','#F3582C','#BEAD93','#F5F3DE','#7CA3A8','#EE843C','#FFBF00','#A3521B','#43682B','#7CAFDD','#F1975A','#B7B7B7'],
            credits: {
                enabled: false
            },
            title: {
                text: 'Turnover',
                style: {
                    color: '#000000',
                    fontWeight: 'bold',
                    fontSize:20
                }
            },
            subtitle:{
                text: CAGR,
                align: 'center'
            },
            navigation: {
                menuItemStyle: {
                    padding: '6px 14px'
                }
            },
            exporting: {
                url: 'https://export.highcharts.com.cn'
            },
            xAxis: {
                categories: index1.xs,
            },
            yAxis:{
                type: 'value',
                title: {
                    text: unit
                },
                min: 0
            },
            plotOptions: {
                series: {
                    dataLabels: {
                        enabled: true,
                        format: '{point.y:.0f}',
                    }
                }
            },
            legend: {
                enabled: false
            },
            series: [{
                type: 'column',
                data: index1.ss.bar
            }]
        };
        var myChart = Highcharts.chart(id, options);
        return myChart;
	}






    function getTopLeft(id,company_id, year,datas) {

//        var myChart = echarts.init(document.getElementById(id));
        //myChart.showLoading();
        var dataArr = [];

   		var data_l = [];

        var list= datas ;
        for (var i = 0; i < list.length; i++) {
            var obj = new Object();
            obj.y = list[i].val;
            obj.name = list[i].tt.metadata_type_name;
            data_l.push(list[i].tt.metadata_type_name)
            dataArr.push(obj);
        }
//         var option = {
//             animation:false,
//             title: {
//                 text: 'Product Mix',
//                 x:'center',
//                 textStyle:{
//                     fontSize:10,
//                 }
//             },
//
//             tooltip: {
//		        trigger: 'item',
//		        formatter: "{a} <br/>{b} : {c} ({d}%)"
//		    },
//
//		    series: [
//		        {
//		            name: 'Sales ratio',
//		            type: 'pie',
//		            radius: '55%',
//		            center: ['50%', '60%'],
//		            data: dataArr,
//		            itemStyle: {
//		                emphasis: {
//		                    shadowBlur: 10,
//		                    shadowOffsetX: 0,
//		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
//		                },
//		                normal:{
//		                    label:{
//		                        show: true,
//		                        formatter: '{b} : {c} ({d}%)'
//		                    },
//		                    labelLine :{show:true}
//		                }
//		            }
//		        }
//		    ],
//             toolbox:{
//                 feature: {
//                     saveAsImage: {
//                         show:true,
//                         excludeComponents :['toolbox'],
//                         pixelRatio: 2
//                     },
//                     myTool : {
//                         show : true,
//                         title : 'excel',
//                         icon: 'image://http://pic.sfont.cn/svg/img/f7h22j.svg',
//
//                         onclick : function (){
//                             exportExcel("top2_right",company_id,year);
//                         }
//                     },
//                 }
//         }
//		};
//		myChart.clear();
//		myChart.setOption(option);
		//myChart.hideLoading();
//		var picBase64Info = myChart.getConnectedDataURL();
//
//		$.post("/service/data/export/getImgPath", {
//		    "chart":id+ ".jpg",
//		    "base64":picBase64Info
//		}, function (data) {
//			var v  = $("#img_"+id).val();
//        	$("#img_"+id).val(v+"|"+data.data)
//
//		});
        var options = {
            chart: {
                type: 'pie'
            },
            colors:['#0068A6','#01ACD8','#008874','#EFC028','#F3582C','#BEAD93','#F5F3DE','#7CA3A8','#EE843C','#FFBF00','#A3521B','#43682B','#7CAFDD','#F1975A','#B7B7B7'],
            credits: {
                enabled: false
            },
            title: {
                text: 'Product Mix',
                style: {
                    color: '#000000',
                    fontWeight: 'bold',
                    fontSize:20
                }
            },
            plotOptions: {
                pie: {
                    center: ["50%", "50%"],
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    }
                }
            },
            tooltip: {
                headerFormat: '{series.name}<br>',
                pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
            },
            series: [
                {
                    name: 'Sales ratio',
                    type: 'pie',
                    center: ['50%', '50%'],
                    data: dataArr,
                }
            ]
        };

        var myChart = Highcharts.chart(id, options);
        return myChart;

	}


    function getTopRight(id,company_id,leftPos,datas) {

//        var myChart = echarts.init(document.getElementById(id));
        var xys = datas;
        //myChart.showLoading();
        var unit = xys.unit;
        var serArr = [];
        var y_data3 = [];
        var x_data = [];
        if (xys.x !=null){
        for (var i = 0; i < xys.x.length; i++) {
           x_data.push(xys.x[i])
        }
        }
        if (xys.ys !=null){
        var yy = xys.ys;
        for (var i = 0; i < yy.length; i++) {
            //y_data3.push(yy[i].name);
            //显示增长率
            y_data3.push(getTopLeftLegendName(yy,i,x_data));
            //封装需要的serArr数组
            var json = new Object();
            //json.name = yy[i].name;
            json.name =getTopLeftLegendName(yy,i,x_data)
//            json.type = "bar";
//            json.stack = "turnover";
//            var obj = new Object();
//            var obj2 = new Object();
//            obj2.show = true;
//            obj2.position = "insideRight";
//            obj.normal = obj2;
//            json.label = obj;
            var y_data = [];
            var tMetadataList = yy[i].ts;
            for (var j = 0; j < x_data.length; j++) {
            	var index = x_data[j];
            	var tm = tMetadataList[index];
            	if(tm){
            	    y_data.push(tm.val);
            	}else{
            	    y_data.push(0);
            	}
               
            }
            json.data = y_data;
            serArr.push(json);
           
        }
        }
//        option = {
//            animation:false,
//            title: {
//                text: 'Sales Value By Product Segment',
//                x:'center',
//                textStyle:{
//                    fontSize:10,
//                }
//
//            },
//            tooltip: {
//                trigger: 'axis',
//                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
//                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
//                }
//            },
//            legend: {
//                orient: 'vertical',
//                data: y_data3,
//                left: 'right',
//                type: 'scroll',
//                y: 'center',   //延Y轴居中
//                x: 'right', //居右显示
//            },
//            grid: {
//                left: '3%',
//                right: '45%',
//                bottom: '3%',
//                containLabel: true
//            },
//            yAxis: {
//                type: 'value',
//                name: 'Unit ('+unit+')'
//            },
//            xAxis: {
//                type: 'category',
//                data: x_data
//            },
//            series: serArr,
//            toolbox:{
//                feature: {
//                    saveAsImage: {
//                        show:true,
//                        excludeComponents :['toolbox'],
//                        pixelRatio: 2
//                    },
//                    myTool : {
//                        show : true,
//                        title : 'excel',
//                        icon : 'image://http://pic.sfont.cn/svg/img/f7h22j.svg',
//                        onclick : function (){
//                            exportExcel(id,company_id,"");
//                        }
//                    },
//                }
//            }
//        }
//        ;
//        myChart.clear();
//        myChart.setOption(option);
//        myChart.on('click', function (params) {
//        	var index_year = x_data[params.dataIndex];
//            getTopLeft(index_year,leftPos);
//        });
//        var picBase64Info = myChart.getConnectedDataURL();
//
//		$.post("/service/data/export/getImgPath", {
//            "chart": id+".jpg",
//            "base64":picBase64Info
//        }, function (data) {
//        	var v  = $("#img_"+id).val();
//        	$("#img_"+id).val(v+"|"+data.data)
//
//        });
        options = {
            chart: {
                type: 'column'
            },
            colors:['#0068A6','#01ACD8','#008874','#EFC028','#F3582C','#BEAD93','#F5F3DE','#7CA3A8','#EE843C','#FFBF00','#A3521B','#43682B','#7CAFDD','#F1975A','#B7B7B7'],
            credits: {
                enabled: false
            },
            title: {
                text: 'Sales Value By Product Segment',
                style: {
                    color: '#000000',
                    fontWeight: 'bold',
                    fontSize:20
                }
            },
            plotOptions: {
                column: {
                    stacking: 'normal',
                    dataLabels: {
                        enabled: false,
                        color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'black',
                        style: {
                            color:'contrast',
                            fontSize: '10px',
                            fontWeight: 'bold',
                            textOutline: '0px 0px contrast'
                        }
                    }
                }
            },
            tooltip: {
                formatter: function () {
                    return '<b>' + this.x + '</b><br/>' +
                            this.series.name + ': ' + this.y + '<br/>' +
                            '总量: ' + this.point.stackTotal;
                }
            },
            legend: {
                align: 'right',
                x: -30,
                verticalAlign: 'middle',
                y: 25,
                floating: false,
                layout:"vertical",
                backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
//                borderColor: '#CCC',
//                borderWidth: 1,
                shadow: false
            },
            yAxis: {
                type: 'value',
                title: {
                    text: unit
                },
                min: 0,
                stackLabels: {
                    enabled: true,
                    style: {
                        fontWeight: 'bold',
                        color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                    },
                    formatter: function () {
                        return numberHandle(this.total)
                    }
                }
            },
            xAxis: {
                categories: x_data
            },
            series: serArr,
        };
        var myChart = Highcharts.chart(id, options);
        return myChart;
        
    }
    
    
    
    
    
    
    function getBottomTable(id,datas){
    	var index6 = datas;
    	var th = index6.x;
    	var tb = index6.ys;
    	if (th == null || tb == null){
    	    return;
        }
    	var thead = "<tr> <th></th>";
    	var tbody = "";
		$("#"+id+"_th").empty();
		$("#"+id+"_tb").empty();
    	for(var i=0;i<th.length;i++){
    		thead+=" <th>"+th[i]+"</th>";
    	}
    	$("#"+id+"_th").append("<tr>"+thead);
    	for(var i=0;i<tb.length;i++){
    		
			tbody+="<tr> <td>"+tb[i].name+"</td>";
			for(var j=0;j<th.length;j++){
				var index = th[j];
				
				if(tb[i].ts[index]){
					tbody+="<td>"+numberHandle( tb[i].ts[index].val)+"</td>";
				}else{
					tbody+="<td></td>";
				}
				
				
			}
    		tbody+="</tr>";
    		
    		
    	}
    	$("#"+id+"_tb").append(tbody);
    	
    }

     // 导出按钮
     $("#exportBtn").click(function () {
     
    	var images = $("input[name='imgs_1']");
    	
    	if(images==null||images==undefined){
    		 layer.msg("please chose option to export");
    		 return;
    	}
    	
    	for(var i=0;i<images.length;i++){
    		var img = images[i];
    		
    		if($(img).val()==null||$(img).val()==undefined||$(img).val()==''){
    			layer.msg("please waite a moment");
    		    return;
    		}
    	}
    	//window.open("/service/dashboard/show_exportAll","_blank","top=100,left=100,width=100,height=100,menubar=yes,scrollbars=no,toolbar=yes,status=yes");
        $("#exportSubmit").submit();

    });

     //获得图例增长率
    function getTopLeftLegendName(unprocessed, i,x_data) {
        var yy = unprocessed;
        var legend_name;
        try {
        if (yy[i].length = 2) {
            legend_name = yy[i].name+"/"+ ((Number(yy[i].ts[x_data[1]].val) / Number(yy[i].ts[x_data[0]].val)-1)*100).toFixed(1)+"%";
        }
        }catch (err){
            legend_name = yy[i].name;
        }
        return legend_name;
    }
    //下载excel

    function exportExcel(chart_type,company_id,year) {
        console.log("ajaxDownloadSynchronized");
        var url = "/server/dashboard/charts/exportExcel";
        var form = $("<form></form>").attr("action", url).attr("method", "POST");
        form.append($("<input></input>").attr("type", "hidden").attr("name", "chart_type").attr("value", chart_type));
        form.append($("<input></input>").attr("type", "hidden").attr("name", "company_id").attr("value", company_id));
        form.append($("<input></input>").attr("type", "hidden").attr("name", "year").attr("value", year));
        form.appendTo('body').submit().remove();
        
    }

    function numberHandle(number){
        var str=String(parseInt(number));
        var re=/(?=(?!(\b))(\d{3})+$)/g;
        str=str.replace(re,",");
        return str;
    }
    function sleep(delay) {
        var start = (new Date()).getTime();
        while ((new Date()).getTime() - start < delay) {
            continue;
        }
    }


</script>


</body>
</html>
