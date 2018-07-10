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
.modal-dialog {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
}

.modal-content {
    /*overflow-y: scroll; */
    position: absolute;
    top: 0;
    bottom: 0;
    width: 100%;
}

.modal-body {
    overflow-y: scroll;
    position: absolute;
    top: 55px;
    bottom: 65px;
    width: 100%;
}

.modal-header .close {margin-right: 15px;}

.modal-footer {
    position: absolute;
    width: 100%;
    bottom: 0;
}
</style>
</head>
<body id="minovate" class="appWrapper">
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->
<div id="wrap" class="animsition">
<#include "static/header.ftl" >
    <div id="controls">
    <#include "static/menu.ftl" >
    </div>

    <section id="content">

        <div class="page page-dashboard">

            <div class="pageheader">

                <h2>Company Information</h2>

                <div class="page-bar">

                    <ul class="page-breadcrumb">
                        <li>
                            <a href="index.html"><i class="fa fa-home"></i> Home</a>
                        </li>
                        <li>
                            <a href="index.html">Company Information</a>
                        </li>
                    </ul>

                </div>

            </div>

            <!-- cards row -->
            <div class="row">

                <div class="col-md-12">

                    <!-- tile -->
                    <section class="tile">

                        <!-- tile header -->
                        <div class="tile-header dvd dvd-btm">
                            <h1 class="custom-font"><strong>Company List</strong></h1>
                           
                        </div>
                        <!-- /tile header -->

                        <!-- tile widget -->
                        <div class="tile-widget">

                            <div class="row">
							<form class="form-horizontal" role="form"  onsubmit="return false" >
                                      
                                <div class="form-group col-md-3">
                                    <label  class="col-md-6 control-label"><small>Comapny Name</small></label>
                                	 <div class="form-group col-md-6">
                                   		<input type="text" id="q_company_name" class="form-control">
                                   	</div>
                                </div>

                                <#--<div class="form-group col-md-5">
                                   
                                   <label  class="col-md-5 control-label">Year of Establishment</label>
                                	 <div class="form-group col-md-7">
                                   		<input type="text" id="q_establishment" class="form-control">
                                   	</div>
                                </div>-->

                                <div class="form-group col-md-4">
                                    <label  class="col-md-6 control-label"><small>Year of Establishment</small></label>
                                    <div class="form-group col-md-6">
                                        <select id="q_establishment" class="form-control">
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
                                    </div>
                                </div>

                                <div class="form-group col-md-4">
                                    <label  class="col-md-5 control-label"><small>If activity in cheese</small></label>
                                    <div class="form-group col-md-7">
                                        <select id="q_cheese" class="form-control">
                                            <option value=""> Please Select Value</option>
                                            <option>All</option>
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </div>
                                </div>
                               
								<div class="form-group col-md-2">
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

                                        <th>Company Name</th>
                                        <th>Year of Establishment</th>
                                        <th>Create Time</th>
                                        <th>Dashboard</th>
                                        <th>Option</th>
                                    </tr>
                                    </thead>
                                    <tbody id="table">

                                    </tbody>
                                </table>
                            </div>


                        </div>
                        <!-- /tile body -->
                     <#if sessionContext.role == "1">
                     <div class="tile-footer dvd dvd-top">
                          <div class="row">
                            	<div class="col-md-12">
                            		<div class="col-md-3">
									  <button id="addButton"
                                            class="btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10 pull-left" ><i
                                            class="fa fa-cog"></i> <span>Add Company</span></button>
									</div>
								</div>
                            </div>
					</div>
					</#if>

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
    <div class="modal-dialog modal-lg">
        <div class="modal-content" >  <#--style="min-width:300px;max-width: 500px;"-->
            <div class="modal-header" style="border-color: white;">
                <h4 class="modal-title" id="myModalLabel">Company</h4>
            </div>
            <div id="modalList" class="modal-body" style="border-color: white;">
                <!--添加选项-->
                <div class="tile-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group"><label for="input01" class="col-sm-3 control-label" >Company Name</label>
                            <div class="col-sm-9"><input type="text" class="form-control" id="company_name"></div>
                        </div>

                        <div class="form-group"><label class="col-sm-3 control-label">Year of Establishment
                        </label>
                            <div class="col-sm-9">
        					 <div class="input-group">
                            <input id='establishment' type="text" name="fc14" class="form-control date-picker" placeholder="Start Year"  required>
                             <span class="input-group-addon ">
                                <span class="fa fa-calendar"></span>
                            </span>
                             </div>                       
                            </div>
                        </div>


                        <div class="form-group"><label for="input01" class="col-sm-3 control-label">Note</label>
                            <div class="col-sm-9"><input type="text" class="form-control" id="remark"></div>
                        </div>

                        <#--展示动态字段-->
                    <#list fieldList as f>
                        <div class="form-group"><label for="input01" class="col-sm-3 control-label">${f.field_name}</label>
                            <div class="col-sm-9">
                                <#if f.field_type == "input">
                                    <input type="text" class="form-control" id="${f.field_id}" />
                                <#else>
                                    <#--<textarea type="text" class="form-control" id="${f.field_id}"></textarea>-->
                                <div>
                                <div class="summernote" id="${f.field_id}"></div>
                                </div>
                                </#if>
                            </div>
                        </div>

                    </#list>
                        <div class="form-group"><label for="input01" class="col-sm-3 control-label" >Any activity in cheese</label>
                            <div class="col-sm-9">
                                <div>
                                    <div class="summernote" id="cheese"></div>
                                </div>
                            </div>
                        </div>

                        <div id="fieldData01">
                        </div>

                       <input type="hidden" class="form-control" id="cid">
                        <input type="hidden" class="form-control" id="optype" value="add">
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

<!-- ===============================================
============== Page Specific Scripts ===============
================================================ -->
<script>


    $('.summernote').summernote(
            {
                toolbar: [
                    // [groupName, [list of button]]
                    ['style', ['bold', 'italic', 'underline', 'clear']],
                    ['fontname', ['fontname']],
                    ['fontsize', ['fontsize']],
                    ['color', ['color']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['height', ['height']],
                    ['Insert', ['picture', 'table', 'hr']]
                ],
                height: 200,
                dialogsInBody: true,

                focus:true,
                onImageUpload: function(files, editor, $editable) {
//                    console.log("#content:"+$('#content'));
//                    console.log("this:"+$(this));
//                    console.log("editor:"+editor);
//                    console.log("$editable:"+$editable);
                    sendFile(files,$(this));
                }
            }
    );



    var fieldNameTemp = new Array();

    <#list fieldList as f>
    fieldNameTemp.push("update"+${f.field_id});
    </#list>

//   CKEDITOR.tools.enableHtml5Elements( document );

	// The trick to keep the editor in the sample quite small
	// unless user specified own height.
//	CKEDITOR.config.height = 150;
//	CKEDITOR.config.width = 'auto';
	


	 <#--<#list fieldList as f>-->
	    <#--<#if f.field_type == "textarea">-->
	  		<#--var editor_${f.field_id}=  CKEDITOR.replace('${f.field_id}');-->
	    <#--</#if>-->
	<#--</#list>-->
    <#--var editor_cheese=  CKEDITOR.replace('cheese');-->

    $(window).load(function () {

        $('.date-picker').datepicker({
            //rtl: App.isRTL()
            format: 'yyyy',
            autoclose: true,
            startView: 'decade',
            maxViewMode: 'years',
            minViewMode: 'years'
        });
        $("#navigation li").each(function () {
            $(this).removeClass('active');
        });
        //添加菜单选中
        $('#menu1').addClass('active');
        $('#searchBtn').click(function (event) {
            queryList(1, true)
        });
        //添加按钮
        $('#addButton').click(function (event) {
            addCompany();
            queryList(1, true)
        });
        //add模态框的添加
        $("#modalsumbit").click(function (event) {
            submitclick();
        });
       


    });

    var pageSize = 10;
    $(document).ready(function () {
        queryList(1, true);
    });

    function update(id) {

        $('#myModal').modal({
            show: true
        });

        <#--if( CKEDITOR.instances['cheese']){-->
            <#--CKEDITOR.instances['cheese'].destroy();-->
        <#--}-->
        <#--CKEDITOR.replace('cheese').setData("");-->
    <#--<#list fieldList as f>-->
        <#--<#if f.field_type == "input">-->
            <#--$("#${f.field_id}").val("");-->
        <#--<#else >-->
            <#--if (CKEDITOR.instances['${f.field_id}']) {-->
                <#--CKEDITOR.instances['${f.field_id}'].destroy();-->
            <#--}-->
            <#--CKEDITOR.replace('${f.field_id}').setData("");-->

        <#--</#if>-->
    <#--</#list>-->
        $("#cheese").code("");
    <#list fieldList as f>
        <#if f.field_type == "input">
            $("#${f.field_id}").val("");
        <#else >
            $("#${f.field_id}").code("");
        </#if>
    </#list>


   	    $("#optype").val("update");


        $.get("/service/company/queryById", {"id": id}, function (data) {
            if (data.code == "suc") {
                //各项重置为空
  
                var establishment = $("#q_establishment").val("");
                var company_name = $("#q_company_name").val("");
                var q_cheese = $("#q_cheese").val("");
                var temp_note =$("#remark").val("");
                var temp_establishment = $("#establishment").val("");
                var temp_company_name = $("#company_name").val("");

                var company = data.data;
                var fieldList =company.companyFieldList;
                if (fieldList != null && fieldList.length !=0){
                    for (var i=0;i<fieldList.length;i++){
                        var fieldone = fieldList[i];
                        
                        if(fieldone.field_type=='input'){
                            $("#"+fieldone.field_id).val(fieldone.field_value);
                        }else{
                            $("#"+fieldone.field_id).code( fieldone.field_value);
                        
//                          if (CKEDITOR.instances[fieldone.field_id]) {
//                           	  CKEDITOR.instances[fieldone.field_id].destroy();
//                              CKEDITOR.replace(fieldone.field_id).setData(fieldone.field_value);
//                          }
                        }
                    }
				}

//				if (CKEDITOR.instances['cheese']) {
//                    CKEDITOR.instances['cheese'].destroy();
//                    CKEDITOR.replace('cheese').setData(company.cheese);
//                }
                $("#cheese").code(company.cheese);
                var company_name = $("#company_name").val(company.company_name);
                var establishment = $("#establishment").val(company.establishment);
                var remark = $("#remark").val(company.remark);
                var id = $("#cid").val(company.id);

            } else {
                layer.msg("update fail");
            }
        })

    };



    function detail(id) {
        window.location.href = "/service/company/queryInfoById/" + id;
    }
    function deleteById(id) {
        //alert(id);
        $.get("/service/company/delete", {"id": id}, function (data) {
                    if (data.data == true) {
                        layer.msg("delete success");
                        queryList(1, true);
                    } else {
                        layer.msg("delete fail");
                    }
                }
        )
    }

    function submitclick() {
        //添加模态框确定按键的事件,增加
        //layer.msg("模态框");
        var company_name = $("#company_name").val();
        var establishment = $("#establishment").val();
//        var cheese = CKEDITOR.instances['cheese'].getData();
        var cheese = $("#cheese").code();
        var remark = $("#remark").val();
        var id = $("#cid").val();
        <#--var field_data ={-->
		    <#--<#list fieldList as f>-->
		    <#--<#if f.field_type == "input">-->
		           <#--${f.field_id}:$("#${f.field_id}").val(),-->
		    <#--<#else>-->
		            <#--${f.field_id}:CKEDITOR.instances['${f.field_id}'].getData(),-->
		    <#--</#if>-->
		    <#--</#list>-->
	    <#--} ;-->
        var field_data ={
    <#list fieldList as f>
        <#if f.field_type == "input">
        ${f.field_id}:$("#${f.field_id}").val(),
        <#else>
        ${f.field_id}:$("#${f.field_id}").code(),
        </#if>
    </#list>
    } ;
        field_data=JSON.stringify(field_data);
        
        if(field_data==null||field_data==''||field_data==undefined){
            layer.msg("please write dynamic field");
            return;
        }

        if(company_name==null||company_name==''||company_name==undefined){
            layer.msg("please write company_name");
            return;
        }

        if(establishment==null||establishment==''||establishment==undefined){
            layer.msg("please write establishment");
            return;
        }

        var company = {
            company_name: company_name,
            establishment: establishment,
            remark: remark,
            cheese:cheese,
            field_data:field_data,
            id: id

        }
        //layer.msg(data);
  		var optype = $("#optype").val();
        if (optype == "add") {
	        $.post("/service/company/add",company,function(result){
	    		if(result.code=='suc'){
			       $('#myModal').modal('hide');
	                queryList(1, true);
	    		}else{
	    			layer.msg(result.msg);
	    		}
	  		});
   
        } else {
            $.post("/service/company/update",company,function(result){
	    		if(result.code=='suc'){
			       $('#myModal').modal('hide');
	                queryList(1, true);
	    		}else{
	    			layer.msg(result.msg);
                    queryList(1, true);
	    		}
	  		});

        }

    }

    function addCompany() {
      $("#optype").val("add");
        //重置为空值
        <#--var company_name = $("#company_name").val("");-->
        <#--var establishment = $("#establishment").val("");-->
        <#--var remark = $("#remark").val("");-->
        <#--var id = $("#cid").val("");-->
        <#--var field_data ={-->
    <#--<#list fieldList as f>-->
    <#--${f.field_name}:$("#${f.field_name}").val(""),-->
    <#--</#list>-->
    <#--} ;-->

        var temp_note =$("#remark").val("");
        var temp_establishment = $("#establishment").val("");
        var temp_company_name = $("#company_name").val("");
        var establishment = $("#q_establishment").val("");
        var company_name = $("#q_company_name").val("");
        var q_cheese =$("#q_cheese").val("");
        //每次刷新重置模态框的值
        <#--if( CKEDITOR.instances['cheese']){-->
            <#--CKEDITOR.instances['cheese'].destroy();-->
        <#--}-->
        <#--CKEDITOR.replace('cheese').setData("");-->
    <#--<#list fieldList as f>-->
        <#--<#if f.field_type == "input">-->
            <#--$("#${f.field_id}").val("");-->
        <#--<#else >-->
            <#--if (CKEDITOR.instances['${f.field_id}']) {-->
                <#--CKEDITOR.instances['${f.field_id}'].destroy();-->
            <#--}-->
            <#--CKEDITOR.replace('${f.field_id}').setData("");-->
        <#--</#if>-->
    <#--</#list>-->
        $("#cheese").code("");
    <#list fieldList as f>
        <#if f.field_type == "input">
            $("#${f.field_id}").val("");
        <#else >
            $("#${f.field_id}").code("");
        </#if>
    </#list>
        $('#myModal').modal({
            show: true
        });
    }

    function queryList(page, pageinit) {
        $("#table").empty();
        var temp_note =$("#remark").val("");
        var temp_establishment = $("#establishment").val("");
        var temp_company_name = $("#company_name").val("");
        
        var establishment = $("#q_establishment").val();
        var company_name = $("#q_company_name").val();
        var cheese = $("#q_cheese").val();
      
        $.get("/service/company/query", {
            "pageNum": page,
            "pageSize": pageSize,
            "companyName": company_name,
            "establishment":establishment,
            "cheese":cheese,

        }, function (data) {
            var contain, content = "";
            var _totalPage = data.maxPage;

            if (data.data.length) {
                for (var i = 0; i < data.data.length; i++) {
                    contain = data.data[i];
                    var date=new Date(contain.create_time);
                    content += "<tr>";
                    content += "  <td><a href='/service/company/queryInfoById/"+contain.id+"'>" + contain.company_name + "</a></td>";
                    content += "  <td>" + contain.establishment + "</td>";
                    content += "  <td>" + formatDate(date, 'yyyy-MM-dd hh:mm') + "</td>";
                    content += "  <td><a href='/service/dashboard/show/"+contain.company_id+"'>switch to dashboard</a></td>";
             
                    content += " <td><button onclick='update(" + contain.id + ")' class=\"btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10\"><i class=\"fa fa-cog\"></i> <span>Update</span></button>" 
                            + "&nbsp;&nbsp;&nbsp;<button  onclick='deleteById(" + contain.id + ")'  class=\"btn btn-red btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10\"><i class=\"fa fa-trash\"></i> <span>Delete</span></button>"
                            +"&nbsp;&nbsp;&nbsp;<button onclick='detail(" + contain.id + ")' class=\"btn btn-primary btn-rounded btn-ef btn-ef-5 btn-ef-5a mb-10\"><i class=\"fa fa-cog\"></i> <span>Info</span> </td>" ;
                
                    
                    content += "</tr>"

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
                            queryList(num, false);
                        }
                    }
                });
            }
        })

        

    }

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

    function sendFile(files,label) {
        var data = new FormData();
        data.append("ajaxTaskFile", files[0]);
        $.ajax({
            data : data,
            type : "POST",
            url : "/service/company/upload_img", //图片上传出来的url，返回的是图片上传后的路径，http格式
            cache : false,
            contentType : false,
            processData : false,
            dataType : "json",
            success: function(data) {//data是返回的hash,key之类的值，key是定义的文件名
                label.summernote('insertImage', data.url);
            },
            error:function(){
                alert("上传失败");
            }
        });
    }
</script>

</body>
</html>
