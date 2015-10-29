<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Smart - UI Elements</title>

		<!-- Bootstrap -->
		<link href="css/bootstrap.css" rel="stylesheet">
		<link href="css/font-awesome.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<!-- DataTables http://www.datatables.net/  -->
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace.js"></script>
		<script src="${pageContext.request.contextPath}/js/problem.js"></script>
		<script src="${pageContext.request.contextPath}/admin/js/falgun/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/admin/js/falgun/dataTables.bootstrap.js"></script>
		<script src="${pageContext.request.contextPath}/admin/js/falgun/TableTools.min.js"></script>
		
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<script type="text/javascript">
	$(document).ready(function(){
		$.ace.setContextPath('${pageContext.request.contextPath}');
		$.adminProblem.initSearchDataTable();
	});
</script>
	</head>
<body>
 <%@include file="./header.jsp" %>
<!-- custom body begin -->
    <div class="container main">
        <div class="row">
            <div class="col-md-9 col-lg-9  ">
                <div class="row">
                    <div class="pull-right">
                        <form class="form-inline" method="get">
                            <div class="form-group">
                                <input id="keyword" class="form-control" placeholder="请输入关键词">
                                <input type="button" value="搜索" class="btn btn-primary" onclick="$.adminProblem.initSearchDataTable()">
                            </div>
                        </form>
                    </div>
                </div>
                <div>
                    <table class="table table-striped" id='dt_table_view'>
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>题目</th>
                            <th>难度</th>
                              <th>发布时间</th>
                            <th>通过率</th>
                        </tr>
                        </thead>
                        <tbody>
                       
                        
                        </tbody>
                    </table>
                   
                </div>
            </div>

            <div class="col-md-3 col-lg-3">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
                       		   分类
                        </h3>
                    </div>
                    <ul class="list-group">
                        <c:forEach items="${categorys }" var="bean">
                         <li class="list-group-item problem-tag">
                                <a href="#"  onclick="$.adminProblem.initSearchDataTable( ${bean.id})"> ${bean.name}</a>
                            </li>
                        </c:forEach>
                        
                    </ul>
                </div>

            </div>
        </div>
    </div>
    <input type="hidden" id="categoryid">
     <%@include file="./foot.jsp" %>
</body>
</html>