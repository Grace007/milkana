<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang=""> <!--<![endif]-->
<head>
    <title>Company Export View</title>
<#include "static/top.ftl" >
</head>
<body id="minovate" class="appWrapper">

<div>
<!-- col -->
<div class="col-md-12">



    <!-- tile -->
    <section class="tile">


        <div id="content" name="content"></div>
        <!-- tile header -->
        <div class="tile-header dvd dvd-btm">
            <h1 class="custom-font"><strong>Company Export View</strong></h1>
            <ul class="controls">
                <li class="dropdown">

                    <a role="button" tabindex="0" class="dropdown-toggle settings" data-toggle="dropdown">
                        <i class="fa fa-cog"></i>
                        <i class="fa fa-spinner fa-spin"></i>
                    </a>

                    <ul class="dropdown-menu pull-right with-arrow animated littleFadeInUp">
                        <li>
                            <a role="button" tabindex="0" class="tile-toggle">
                                <span class="minimize"><i class="fa fa-angle-down"></i>&nbsp;&nbsp;&nbsp;Minimize</span>
                                <span class="expand"><i class="fa fa-angle-up"></i>&nbsp;&nbsp;&nbsp;Expand</span>
                            </a>
                        </li>
                        <li>
                            <a role="button" tabindex="0" class="tile-refresh">
                                <i class="fa fa-refresh"></i> Refresh
                            </a>
                        </li>
                        <li>
                            <a role="button" tabindex="0" class="tile-fullscreen">
                                <i class="fa fa-expand"></i> Fullscreen
                            </a>
                        </li>
                    </ul>

                </li>
                <li class="remove"><a role="button" tabindex="0" class="tile-close"><i class="fa fa-times"></i></a></li>
            </ul>
        </div>
        <!-- /tile header -->

        <!-- tile body -->
        <div class="tile-body">

            <form role="form">
            <#--公司名-->
                <div class="form-group">
                    <label><strong>Company Name</strong></label>
                    <label class="checkbox checkbox-custom-alt checkbox-custom-lg">
                        <input type="checkbox" id="company_all"><i></i> All Select
                    </label>
                    <#list companyList as c>
                        <label class="checkbox checkbox-custom-alt checkbox-custom-lg">
                            <input class="company" type="checkbox" id="${c.company_id}"><i></i> ${c.company_name}
                        </label>
                    </#list>
                </div>
            <#--数据类型-->
                <div class="form-group">
                    <label><strong>Data Type</strong></label>
                    <label class="checkbox checkbox-custom-alt checkbox-custom-lg">
                        <input type="checkbox" id="datatype_all"><i></i> All Select
                    </label>
                    <label class="checkbox checkbox-custom-alt checkbox-custom-lg">
                        <input class="datatype" type="checkbox" id="datatype_ifm"><i></i> Information
                    </label>
                    <label class="checkbox checkbox-custom-alt checkbox-custom-lg">
                        <input class="datatype" type="checkbox" id="datatype_chart"><i></i> Chart
                    </label>
                </div>
            <#--Field数据类型-->
                <div class="form-group">
                    <label><strong>Field Name</strong></label>
                    <label class="checkbox checkbox-custom-alt checkbox-custom-lg">
                        <input type="checkbox" id="field_all"><i></i> All Select
                    </label>
                <#list fieldList as f>
                    <label class="checkbox checkbox-custom-alt checkbox-custom-lg">
                        <input class="field" type="checkbox" id="${f.field_id}"><i></i> ${f.field_name}
                    </label>
                </#list>
                </div>
            <#--year-->
                <div class="form-group">
                    <label><strong>Data Period</strong></label>
                    <label class="checkbox checkbox-custom-alt checkbox-custom-lg">
                        <input type="checkbox"><i></i> Large checkbox
                    </label>

                </div>
                <button id="submit" type="submit" class="btn btn-rounded btn-success btn-sm">Submit</button>
            </form>

        </div>

    </section>
</div>
</div>

<script>

//    CKEDITOR.tools.enableHtml5Elements( document );
$('#content').summernote(
        {
            focus:true,
            onImageUpload: function(files, editor, $editable) {
                console.log("#content:"+$('#content'));
                console.log("this:"+$(this));
                console.log("editor:"+editor);
                console.log("$editable:"+$editable);
                sendFile(files,$(this));
            }
        }
);
    //push也行
    var company_array = new Array(
    <#list companyList as c>
        <#if c_has_next>
                "${c.company_id}",
        <#else>
                "${c.company_id}"
        </#if>
    </#list>
    );
    var field_array = new Array(
    <#list fieldList as f>
        <#if f_has_next>
                "${f.field_id}",
        <#else>
                "${f.field_id}"
        </#if>
    </#list>
    );
    var datatype_array=new Array("information","chart");

    $(document).ready(function () {

//        if (CKEDITOR.instances['content']){
//            CKEDITOR.instances['content'].destroy();
//        }
//        CKEDITOR.replace('content');
//        if (CKEDITOR.instances['content']){
//            CKEDITOR.instances['content'].destroy();
//        }
//       CKEDITOR.replace('content').setData("dasdsa");
//



        $("#submit").click(function () {


//            submit();
        });
    });


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



    function submit() {
        var finished_form = {};
        select();
        
    }

    //确定select
    function select() {
        var finished_form = {};
        var company_all = $("#company_all").is(":checked");
        var field_all =$("#field_all").is(":checked");
        var datatype_all =$("#datatype_all").is(":checked");


        if (company_all){
            finished_form.company =company_array.join(",");
        }else{
            var company_finish = new Array();
            var company_select = $(".company");
            for (var i=0;i<company_select.size();i++){
                var company_one = $(company_select.get(i));
                if (company_one.is(":checked")){
                    company_finish.push(company_one.attr("id"));
                }
            }
            finished_form.company=company_finish.join(",");
        }
        if (field_all){
            finished_form.field =field_array.join(",");
        }else{
            var field_finish = new Array();
            var field_select = $(".field");
            for (var i=0;i<field_select.size();i++){
                var field_one = $(field_select.get(i));
                if (field_one.is(":checked")){
                    field_finish.push(field_one.attr("id"));
                }
            }
            finished_form.field=field_finish.join(",");
        }
        if (datatype_all){
            finished_form.datatype =datatype_array.join(",");
        }else{
            var datatype_finish = new Array();
            var datatype_select = $(".field");
            for (var i=0;i<datatype_select.size();i++){
                var datatype_one = $(datatype_select.get(i));
                if (datatype_one.is(":checked")){
                    datatype_finish.push(datatype_one.attr("id"));
                }
            }
            finished_form.datatype=datatype_finish.join(",");
        }

        console.log(finished_form);
        $.post("/service/dashboard/exportAll", finished_form , function (result) {
            if (result.code == 'suc') {
                layer.msg(result.msg);
            } else {
                layer.msg(result.msg);
            }
        });



    }






</script>

</body>