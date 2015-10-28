<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Smart - UI Elements</title>

		<!-- Bootstrap -->
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
		<!-- DataTables http://www.datatables.net/  -->
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace.js"></script>
		<script src="${pageContext.request.contextPath}/js/problem.js"></script>
		<script src="${pageContext.request.contextPath}/admin/js/falgun/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/admin/js/falgun/dataTables.bootstrap.js"></script>
		<script src="${pageContext.request.contextPath}/admin/js/falgun/TableTools.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/codemirror/codemirror.css">
		<script src="${pageContext.request.contextPath}/js/codemirror/codemirror.js"></script>
		<script src="${pageContext.request.contextPath}/js/codemirror/mode/xml/xml.js"></script>
		<script src="${pageContext.request.contextPath}/js/codemirror/mode/xml/xml.js"></script>
<script src="${pageContext.request.contextPath}/js/codemirror/mode/javascript/javascript.js"></script>
<script src="${pageContext.request.contextPath}/js/codemirror/mode/css/css.js"></script>
<script src="${pageContext.request.contextPath}/js/codemirror/mode/htmlmixed/htmlmixed.js"></script>
<script src="${pageContext.request.contextPath}/js/codemirror/addon/edit/matchbrackets.js"></script>
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<script type="text/javascript">
	$(document).ready(function(){
		$.ace.setContextPath('${pageContext.request.contextPath}');
		var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
		    lineNumbers: true,
		    mode: "javascript"
		  });
	});
</script>
	</head>
<body>
<%@include file="./header.jsp" %>

<div class="container main">
        <ul class="nav nav-tabs nav-tabs-google">
            <li role="presentation">
                    <a href="${pageContext.request.contextPath}/problemdetail/${bean.problem.id }">题目</a>
            </li>
            <li role="presentation" class="active">
                    <a href="${pageContext.request.contextPath}/submission/3">我的提交</a>
            </li>

        </ul>
        <h2 class="text-center">${bean.problem.name }</h2>

		<p class="text-muted text-center">
		                               发布时间: ${bean.problem.createDate }&nbsp;&nbsp;
				    时间限制: ${bean.problem.timelimit }ms&nbsp;&nbsp;
				    内存限制: ${bean.problem.cpulimit }M
		</p>
        <div class="panel panel-default">
            <div class="panel-body">
                <h4>运行结果: 
                    <div class="label label-danger">${bean.state}</div>
                </h4>
                    <pre>${bean.result }</pre>
                <p>提交时间: ${bean.createDate }</p>
            </div>
        </div>
        <div id="code-field">
             <textarea id='code' rows="3" cols="">${bean.input }</textarea>
        </div>
    </div>


<%@include file="./foot.jsp" %>
</body>
</html>
