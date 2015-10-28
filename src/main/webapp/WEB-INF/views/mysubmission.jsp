<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                    <a href="${pageContext.request.contextPath}/problemdetail/${problem.id }">题目</a>
            </li>
            <li role="presentation" class="active">
                    <a href="${pageContext.request.contextPath}/problemdetail/${problem.id }/submission">我的提交</a>
            </li>

        </ul>
        <h2 class="text-center">${problem.name }</h2>
		<p class="text-muted text-center">
				                               发布时间: ${problem.createDate }&nbsp;&nbsp;
						    时间限制: ${problem.timelimit }ms&nbsp;&nbsp;
						    内存限制: ${problem.cpulimit }M
		</p>
        
	      <table class="table table-striped" id='dt_table_view'>
	                        <thead>
	                        <tr>
	                            <th>#</th>
	                            <th>题目名称</th>
	                            <th>提交时间</th>
	                             <th>语言</th>
	                            <th>难度</th>
	                            <th>结果</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        <c:forEach items="${submissions }" var="bean">
							<tr >
								<td class="center"><a href="${pageContext.request.contextPath}/submission/${bean.id }">  ${bean.id }</a></td>
								<td class="center"><a href="${pageContext.request.contextPath}/problemdetail/${bean.problem.id }"> ${bean.problem.name }</a></td>
								<td class="center">${bean.createDate }</td>
								<td class="center"> 
										<c:if test="${bean.language=='1'}">
											C
										</c:if>	
										<c:if test="${bean.language=='2'}">
											C++
										</c:if>	
										<c:if test="${bean.language=='3'}">
											JAVA
										</c:if>								
								 </td>
								<td class="center"><div class="label label-primary">${bean.problem.hard }</div></td>
								<td class="center">
									<c:if test="${bean.state!='成功' }">
									<div class="label label-danger">${bean.state }</div>
									</c:if>
									<c:if test="${bean.state=='成功' }">
									<div class="label label-success">${bean.state }</div>
									</c:if>
								</td>
							</tr>
				</c:forEach>
	                        </tbody>
	     </table>
        
    </div>

<%@include file="./foot.jsp" %>
</body>
</html>
