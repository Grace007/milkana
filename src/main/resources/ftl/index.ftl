<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang=""> <!--<![endif]-->


<head>

<#include "static/top.ftl" >


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

                <h2>${company.company_name} <span></span></h2>

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

            <div class="row">
                <div class="col-md-12">

                    <!-- tile -->
                    <section class="tile">
                        <div class="tile-widget ">

                            <div class="row">

                                <div class="form-group col-md-3">

                                    <select id="q_company_id" class="form-control q_filter">
                                        <option value=""> Please Select Company</option>
                                    <#list companyList as c>
                                        <option value="${c.company_id}"> ${c.company_name}</option>
                                    </#list>
                                    </select>
                                </div>

                                
								<div class="form-group col-md-4">
									<button id="switchBtn" class="btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10" > <i class="fa fa-cog"></i> <span>Switch Company</span></button>
								
								</div>

                            </div>

                        </div>

                    </section>
                </div>

            </div>
            
            
            
            <div class="row">
	    <div class="col-md-12">
	    
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
                                         <td>${(company.company_name)!""}</td>
                                     </tr>
                                     <tr>
                                         <td>Year of Establishment</td>
                                         <td>${(company.establishment)!""}</td>
                                     </tr>

                                 <#list company.companyFieldList as c>
                                     <#if c.field_type == "input">
                                         <tr>
                                             <td>${c.field.field_name}</td>
                                             <td>${c.field_value}</td>
                                         </tr>
                                     </#if>
                                 </#list>
								
								        </table>
                               </div>

                            </div>  
                        </div>
                   
                    </section>
	    </div>
  	</div>
  	
  	
  	
  	<div class="row">
	    <div class="col-md-12">
	    
	    	<section class="tile">

                        <!-- tile header -->
                        <div class="tile-header dvd dvd-btm">
                            <h1 class="custom-font"><strong>Company Additional Information</strong> </h1>
                       
                        </div>
                        <!-- /tile header -->

                        <!-- tile body -->
                        <div class="tile-body">
                            <div class="row">
								
                               <#--附加信息-->
							    <div class="col-md-12">
							    <#--<#list companyFieldList as c>
							        <h4 class="custom-font text-strong">${c.field.field_name}</h4>
							        <p>- ${c.field_value}</p>
							    </#list>-->
                                <#list company.companyFieldList as c>
                                        <#if c.field_type == "textarea"  && c.field_value!="" && c.field_value?exists>
                                        <h4 class=""><strong><u>${c.field.field_name}</u></strong></h4>
                                        <p>${c.field_value}</p>
                                    </#if>
                                </#list>
                                    <h4 class=""><strong><u>Any Activity in Cheese</u></strong></h4>
                                    <p>${(company.cheese)!""}</p>
							
							    </div>

                            </div>  
                        </div>
                   
                    </section>
	    </div>
  	</div>
            
            
            <div class="row">


                <div class="col-md-12">

                    <!-- tile -->
                    <section class="tile">

                        <!-- tile header -->
         
                        <div class="tile-widget ">
                            <h4 class="underline custom-font mb-20"><strong>${companyName}</strong> </h4>
                            <div id="top1" style="height:300px"></div>
                        </div>


                    </section>
                    <!-- /tile -->

                </div>


            </div>
            <div class="row">
            
            


                <div class="col-md-6">

                    <!-- tile -->
                    <section class="tile">

                        <!-- tile header -->
            
                        <div class="tile-widget">
 							<#--<h4 class="underline custom-font mb-20"><strong>Product Mix (sales value ${top2year})</strong> </h4>-->
                                <h4 class="underline custom-font mb-20"><strong>Product Mix </strong> </h4>
                            <div id="top2_left" style="height:300px"></div>
                        </div>


                    </section>
                    <!-- /tile -->

                </div>

                <div class="col-md-6">

                    <!-- tile -->
                    <section class="tile">
                        <div class="tile-widget">
                            <h4 class="underline custom-font mb-20"><strong>Sales Value By Product Segment</strong> </h4>
                            <div id="top2_right" style="height:300px"></div>
                        </div>


                    </section>
                    <!-- /tile -->

                </div>

               
            </div>
            <!-- /row -->
            
            
            
            <!-- /row -->

            <div class="row">

                <div class="col-md-12">

                    <section class="tile">

                        <!-- tile header -->
                        <div class="tile-header  dvd dvd-btm">
                            <h1 class="custom-font"><strong>Cow Population and Sales</strong></h1>

                        </div>

                        <div class="tile-widget">

                            <table class="table table-bordered">
                                <thead id="th">
                                
                                </thead>
                                <tbody id="tb">
                                
                              
                                </tbody>

                            </table>
                        </div>


                    </section>

                </div>


            </div>
        </div>
        


    </section>
    <!--/ CONTENT -->


</div>
<!--/ Application Content -->
    <input type="hidden" id="vtop1">
    <input type="hidden" id="vtop2_left">
    <input type="hidden" id="vtop2_right">


<#include "static/footer.ftl" >


<!-- ===============================================
============== Page Specific Scripts ===============
================================================ -->
<script>


    var top1 = ${top1};
    var top2_right = ${top2_right};
    var top2_left = ${top2_left};
    var bottom = ${bottom};
    $(window).load(function () {
        //移除菜单选中
        $("#navigation li").each(function () {
            $(this).removeClass('active');
        });
        //添加菜单选中
        $('#menu2').addClass('active');
        $('.date-picker').datepicker({
            //rtl: App.isRTL()
            format: 'yyyy',
            autoclose: true,
            startView: 'decade',
            maxViewMode: 'years',
            minViewMode: 'years'
        });
         $("#switchBtn").click(function(){  
           var companyid = $("#q_company_id").val();
           if(companyid==null||companyid==''||companyid==undefined){
           		layer.msg("Please Select Company to Switch")
           		return;
           }
           
           window.location.href="/service/dashboard/show/"+companyid ;
        });
         $("#exportAllBtn").click(function () {
             window.location.href="/service/dashboard/show_exportAll";
         });
        getTop1(top1);



        getTopRight('top2_right',top2_right);


		setLeftData(top2_left,${top2year})
        //getTopLeft(${top2year},'top2_left');
      
        getBottomTable(bottom);

    });


	function getTop1(top1){
		var index1  = top1;
		var unit = index1.unit;
	    var firstTurnover=0;
        var lastTurnover=0;
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
//	    var myChart = echarts.init(document.getElementById("top1"));
	    var company="${companyId}";

        var	options = {
            chart: {
                type: 'column'
            },
            credits: {
                enabled: false
            },
            colors:['#0068A6','#01ACD8','#008874','#EFC028','#F3582C','#BEAD93','#F5F3DE','#7CA3A8','#EE843C','#FFBF00','#A3521B','#43682B','#7CAFDD','#F1975A','#B7B7B7'],
            title: {
                text: 'Turnover',
                style: {
                    color: '#000000',
                    fontWeight: 'bold',
                    fontSize:25
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
            legend: {
                enabled: false
            },
            plotOptions: {
                series: {
                    dataLabels: {
                        enabled: true,
                        format: '{point.y:.0f}'
                    }
                }
            },
            series: [{
                type: 'column',
                data: index1.ss.bar
            }]
        };
        var myChart = Highcharts.chart('top1', options);
	}
	
	

    


    function getTopLeft( year,chartType) {
        var company="${companyId}";
      
       // myChart.showLoading();

        $.get(" /service/dashboard/charts/index2/${companyId}", {
            "year": year,
            "chart_type":chartType
        }, function (data) {
           // myChart.hideLoading();
          
            if(data.code=='suc'){
		        setLeftData(top2_left,year)      
            }else{
            	layer.msg(data.msg);
            }
        
        })
       
    }

    function setLeftData(top2_left,year){
        var company= '${companyId}';
//        var myChart = echarts.init(document.getElementById("top2_left"));
     	var dataArr = [];
        var data_l = [];
    	var list= top2_left ;
        for (var i = 0; i < list.length; i++) {
            var obj = new Object();
            obj.y = list[i].val;
            obj.name = list[i].tt.metadata_type_name;
            data_l.push(list[i].tt.metadata_type_name)
            dataArr.push(obj);
        }
//        var dataArrJson = jQuery.parseJSON("{"+dataArr.toString()+"}");
//		var option = {
//		            tooltip: {
//		                trigger: 'item',
//		                formatter: "{a} <br/>{b} : {c} ({d}%)"
//		            },
//		            series: [
//		                {
//		                    name: 'Sales ratio',
//		                    type: 'pie',
//		                    radius: '55%',
//		                    center: ['50%', '60%'],
//		//                    color: ['#1E90FF', '#9370DB', '#98FB98', '#FF7F50', '#6495ED'],
//		                    data: dataArr,
//		                    itemStyle: {
//		                        emphasis: {
//		                            shadowBlur: 10,
//		                            shadowOffsetX: 0,
//		                            shadowColor: 'rgba(0, 0, 0, 0.5)'
//		                        },
//                                normal:{
//                                    label:{
//                                        show: true,
//                                        formatter: '{b} : {c} ({d}%)'
//                                    },
//                                    labelLine :{show:true}
//                                }
//                            }
//		                }
//		            ],
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
//                             exportExcel("top2_right",company,year);
//                         }
//                     },
//                 }
//             }
//        };
//        myChart.clear();
//        myChart.setOption(option);

        var options = {
            chart: {
                type: 'pie'
            },
            colors:['#0068A6','#01ACD8','#008874','#EFC028','#F3582C','#BEAD93','#F5F3DE','#7CA3A8','#EE843C','#FFBF00','#A3521B','#43682B','#7CAFDD','#F1975A','#B7B7B7'],
            credits: {
                enabled: false
            },
            title: {
                text: ''
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

        var myChart = Highcharts.chart('top2_left', options);
    }

    //Sales Value By Product Segment
    function getTopRight(leftPos,datas) {
        var company="${companyId}";
//        var myChart = echarts.init(document.getElementById("top2_right"));
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
            var obj = new Object();
            var obj2 = new Object();
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
//                            exportExcel("top2_left",company,"");
//                        }
//                    },
//                }
//            }
//        };
//        myChart.clear();
//        myChart.setOption(option);
//        myChart.on('click', function (params) {
//        	var index_year = x_data[params.dataIndex];
//            getTopLeft(index_year,leftPos);
//        });
        options = {

            chart: {
                type: 'column',
            },
            colors:['#0068A6','#01ACD8','#008874','#EFC028','#F3582C','#BEAD93','#F5F3DE','#7CA3A8','#EE843C','#FFBF00','#A3521B','#43682B','#7CAFDD','#F1975A','#B7B7B7'],
            credits: {
                enabled: false
            },
            title: {
                text: ''
            },
            plotOptions: {
                column: {
                    stacking: 'normal',
                    dataLabels: {
                        enabled: true,
                        color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                        format: '{point.y:.0f}',
                        style: {
                            textShadow: '0 0 3px black'
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
                borderColor: '#CCC',
                borderWidth: 1,
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
        var myChart = Highcharts.chart('top2_right', options);


//        myChart.on('click', function (params) {
//            var index_year = x_data[params.dataIndex];
//            getTopLeft(index_year,leftPos);
//        });
    }
    
    
    
    
    
    
    function getBottomTable(bottom){
    	var index6 = bottom;
    	var th = index6.x;
    	var tb = index6.ys;
    	if (th == null || tb == null){
    	    return;
        }
    	var thead = "<tr> <th></th>";
    	var tbody = "";
		$("#th").empty();
		$("#tb").empty();
    	for(var i=0;i<th.length;i++){
    		thead+=" <th>"+th[i]+"</th>";
    	}
    	$("#th").append("<tr>"+thead);
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
    	$("#tb").append(tbody);
    	
    }
    
   


    // 搜索按钮
    $("#searchBtn").click(function () {
        var company_id= $("#q_company_id").val();
        window.location.href = "/service/dashboard/show/" + company_id;
    });
    
     // 导出按钮
     $("#exportBtn").click(function () {
        var company_id= '${companyId}';
        var vtop1 = $("#vtop1").val();
        var vtop2_left = $("#vtop2_left").val();
        var vtop2_right = $("#vtop2_right").val();
        var vtop3_left = $("#vtop3_left").val();
        var vtop3_right = $("#vtop3_right").val();
        
        var imgObj = {};
        imgObj.vtop1=vtop1;
        imgObj.vtop2_left=vtop2_left;
        imgObj.vtop2_right=vtop2_right;
        imgObj.vtop3_left=vtop3_left;
        imgObj.vtop3_right=vtop3_right;
        var a = JSON.stringify(imgObj);

         var url = "/service/data/export/exportPdf";
         var form = $("<form></form>").attr("action", url).attr("method", "post");
         form.append($("<input></input>").attr("type", "hidden").attr("name", "companyId").attr("value", company_id));
         form.append($("<input></input>").attr("type", "hidden").attr("name", "charts").attr("value", a));
         form.appendTo('body').submit().remove();
      
        /*$.post("/service/data/export/exportPdf", {
            "charts": a,
            "companyId": company_id
        }, function (data) {
        	layer.msg("导出成功")
        
        });*/
        // window.location.href = "/service/data/export/exportPdf?companyId=" + company_id+"&charts="+a;
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

</script>


</body>
</html>
