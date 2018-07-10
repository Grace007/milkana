<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/animate.css/3.4.0/animate.css">

    <title>Company Info</title>
    <style type="text/css">

        body {
            background-color: #eee;
            /*        margin-left: 45px;
                    margin-right: 45px;*/
            font-family: Lato;
            font-size: 10px;
           // padding: 0px 100px 0px 100px;
        }
        .pageNext{page-break-after:always;}

          table {
              margin: auto;
              width: 100%;
              border-top:1px solid #444444;
              border-collapse: collapse;
              border: 1px solid #444444;
          }

          th,
          td {
              border: 1px solid #444444;
              font-size: 10px;
              margin-left: 5px;

          }

          img {
              width: 100%;
              height: auto;
          }


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
        .td_title{
            width: 30%;
        }


    </style>
</head>

<body>

    <!-- 表格 -->
   <div class="A4">
     <#if  (selectCompany?size>0)>
		     <#list selectCompany as s>
	    
    <div class="card">
       
        <div class="tile-header dvd dvd-btm">
            <h1 class="textcenter"><strong>${(s.company_name)!""}</strong> </h1>
        </div>
        <h5><strong>Company Basic Information</strong></h5>
        <!-- /tile header -->
        <!-- tile body -->
        <div class="tile-body">
            <div class="row">	
               <div class="col-md-9">
				 <table  class="table table-bordered">
                     <tr>
                         <td class="td_title">Company Name</td>
                         <td>${(s.company_name)!""}</td>
                     </tr>
                     <tr>
                         <td class="td_title">Year of Establishment</td>
                         <td>${(s.establishment)!""}</td>
                     </tr>

                 <#list s.companyFieldList as c>
                     <#if c.field.field_type == "input" && c.field_value!="" && c.field_value?exists>
                         <tr>
                             <td class="td_title">${c.field.field_name}</td>
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
                    <div class="div-width">
                        <h4 class=""><strong><u>${c.field.field_name!""}</u></strong></h4>
                        <p>${c.field_value}</p>
                    </div>
                    <br></br>
                    </#if>
                </#list>
                    <div>
				<h4 class="div-wi"><strong><u>Any Activity in Cheese</u></strong></h4>
                        <p>${s.cheese}</p>
                    </div>
			    </div>
                <br></br>
			</div>
        </div>
        <div class="tile-body">
            <#if s.img_top1??>
                <div class="col-md-12">
                    <img alt="加载中..." src="${(s.img_top1)!""}"></img>
                </div>

            </#if>
            <#if s.img_top2_left??>
                <div class="col-md-6">
                    <img alt="加载中..." src="${(s.img_top2_left)!""}" ></img>


                </div>
            </#if>
            <#if s.img_top2_right??>
                <div class="col-md-6">
                    <img alt="加载中..." src="${(s.img_top2_right)!""}" ></img>
                </div>
                <#if s.top2_right_table??>
                    <table  class="table table-bordered">

                        <#list s.top2_right_table as tr>
                        <tr>
                            <#list tr as ts>
                            <td>${ts!""}</td>
                            </#list>
                        </tr>
                        </#list>
                    </table>


            </#if>
            </#if>


            <#if s.bottom??>
                <h5><strong>Cow Population and Sales</strong></h5>
                <table  class="table table-bordered">

                    <#list s.bottom as tr>
                        <tr>
                            <#list tr as ts>
                                <td>${ts!""}</td>
                            </#list>
                        </tr>
                    </#list>
                </table>
            </#if>

        </div>
    </div>
                 <#sep><div class="pageNext"></div> </#sep>
   </#list>  
   <#else> 
   </#if>

    <!-- 附加信息 -->
   </div>
</body>

</html>