<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Company Info</title>
    <style type="text/css">
        body {
            background-color: #eee;
            /*        margin-left: 45px;
                    margin-right: 45px;*/
            font-family: Arial Unicode MS;
            font-size: 10px;
            padding: 0px 100px 0px 100px;
        }

        /*  table {
              margin: auto;
              width: 100%;
              border-collapse: collapse;
              border: 1px solid #444444;
          }

          th,
          td {
              border: 1px solid #444444;
              font-size: 10px;
              margin-left: 5px;
          }
          */
          img {
              width: 100%;
              height: auto;
          }

        table.dataintable {
            margin-top: 15px;
            border-collapse: collapse;
            border: 1px solid #aaa;
            width: 100%;
        }

        table.dataintable th {
            vertical-align: baseline;
            padding: 5px 15px 5px 6px;
            background-color: #3F3F3F;
            border: 1px solid #3F3F3F;
            text-align: left;
            color: #fff;
        }

        table.dataintable td {
            vertical-align: text-top;
            padding: 6px 15px 6px 6px;
            border: 1px solid #aaa;
        }

        /* table.dataintable tr:nth-child(odd) {
             background-color: #F5F5F5;
         }

         table.dataintable tr:nth-child(even) {
             background-color: #fff;
         }*/

        div.page{
            background-color: #fcfcfc;
            padding:20px 50px 20px 50px;
            display: block;
            position: relative;
            border-radius: 2px;
            /*box-shadow: 1px 1px 10px 0px black;*/
        }

        div.card{
            position: relative;
            margin: .5rem 0 1rem 0;
            background-color: #fff;
            border-radius: 2px;
            box-shadow: 0px 1px 5px 0px rgba(0, 0, 0, 0.2), 0px 2px 2px 0px rgba(0, 0, 0, 0.14), 0px 3px 1px -2px rgba(0, 0, 0, 0.12);
            padding: 30px;
        }

        .textcenter{
            text-align: center;
        }
    </style>
</head>

<body>
<#--<div class="page">-->
    <!-- 表格 -->
    <div class="card">
        <!-- tile header -->
        <div class="tile-header dvd dvd-btm">
            <h1 class="textcenter"><strong>Company Basic Information</strong> </h1>
        </div>
        <!-- /tile header -->
        <!-- tile body -->
        <div class="tile-body">
            <div class="row">
                <table class="table table-bordered dataintable">
                    <tr>
                        <td>company_name</td>
                        <td>${(company.company_name)!""}</td>
                    </tr>
                    <tr>
                        <td>establishment</td>
                        <td>${(company.establishment)!""}</td>
                    </tr>

                <#list companyFieldList as c>
                    <#if c.field.field_type == "input">
                        <tr>
                            <td>${c.field.field_name!""}</td>
                            <td>${c.field_value!""}</td>
                        </tr>
                    </#if>
                </#list>

                </table>
            </div>
        </div>
    </div>
    <!-- 附加信息 -->
    <div class="card">
        <!-- tile header -->
        <div class="tile-header dvd dvd-btm">
            <h1 class="textcenter"><strong>Company Additional Information</strong> </h1>
        </div>
        <!-- /tile header -->
        <!-- tile body -->
        <div class="tile-body">
            <div class="row">
			<#--附加信息-->
                <div class="col-md-12">
				<#list companyFieldList as c>
                    <#if c.field.field_type == "textarea">
                    <h4 class="">${c.field.field_name!""}</h4>
                    <p>${c.field_value!""}</p>
                    </#if>
				</#list>
                    <h4 class="">Any Activity in Cheese</h4>
                    <p>${(company.cheese)!""}</p>
                </div>
            </div>
        </div>
	<img alt="加载中..." src="${vtop1!""}" />
    <img alt="加载中..." src="${vtop2_left!""}" />
    <img alt="加载中..." src="${vtop2_right!""}" />
  
    </div>
<#--</div>-->
</body>

</html>