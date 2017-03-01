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
		$("#submit-code-button").bind("click", function(){
			$.ajax({
    			type : "POST",
    			url : $.ace.getContextPath() + "/submission/check",
    			dataType : "json",
    			data:{
    				"code":editor.getValue(),
    				"problemid":"${problem.id}",
    				"language":$("input[name='language']:checked").val()	
    			},
    			success : function(json) {
    				if(json.state=='编译错误'){
    					$("#result").html("").html(
    							"<div class='alert alert-danger result' role='alert'>"+
    				            "<div class='alert-link'>"+json.state+"!&nbsp;&nbsp;"+
    				            "<a href='${pageContext.request.contextPath}/submission/"+json.id+"' target='_blank'>查看详情</a>"+
    				           " </div> "+
    			           		" </div>"		
    					);
    				}else{
    					$("#result").html("").html(
    							"<div class='alert alert-info result' role='info'>"+
    				            "<div class='alert-link'>"+json.state+"!&nbsp;&nbsp;"+
    				            "<a href='${pageContext.request.contextPath}/submission/"+json.id+"' target='_blank'>查看详情</a>"+
    				           " </div> "+
    			           		" </div>"		
    					);
    				}
    			}
    		});
		});
		
	});
</script>
	</head>
<body>
<%@include file="./header.jsp" %>
<!-- nav end -->

<!-- custom body begin -->

  <div class="container main">
        <ul class="nav nav-tabs nav-tabs-google">
            <li role="presentation" class="active">
                 <a href="${pageContext.request.contextPath}/problemdetail/${problem.id }">题目</a>
            </li>
            <li role="presentation">
                 <a href="${pageContext.request.contextPath}/problemdetail/${problem.id }/submission">我的提交</a>
            </li>
        </ul>
        <h2 class="text-center">${problem.name }</h2>

		<p class="text-muted text-center">
		    发布时间: ${problem.createDate }&nbsp;&nbsp;
		    
		    时间限制: ${problem.timelimit }ms&nbsp;&nbsp;
		    内存限制: ${problem.cpulimit }M
		</p>

        <div>
            <div class="problem-section">
                <label class="problem-label">描述</label>
                <div class="problem-detail">
                <p>${problem.remark }
                </p>
                </div>
            </div>
            <div class="problem-section">
                <label class="problem-label">输入</label>
                <p class="problem-detail">
                ${problem.input }
                </p>
            </div>
            <div class="problem-section">
                <label class="problem-label">输出</label>
                <p class="problem-detail">${problem.output }</p>
            </div>
                <div class="problem-section">
                    <label class="problem-label">样例输入</label>
       				 <pre>${problem.inputemp }</pre>
                </div>
                
                <div class="problem-section">
                    <label class="problem-label">样例输出</label>
        			 <pre>${problem.outputemp }</pre>
                </div>
               <div class="problem-section">
                <label class="problem-label">难度</label>
                <p class="problem-detail">
                        <span class="label label-success">${problem.hard }</span>
                </p>
            	</div>
            	
            	<div class="problem-section">
                    <label class="problem-label">来源</label>
                    <div class="problem-detail">${problem.reference }</div>
                </div>
            
            <div>
                <label>选择语言</label>
                <div>
                    <label class="radio-inline">
                        <input type="radio" name="language" value="1" > C (GCC 4.8)
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="language" value="2"> C++ (G++ 4.3)
                    </label>
                    <label class="radio-inline">
                        <input checked="checked" type="radio" name="language" value="3" > Java (Oracle JDK 1.7)
                    </label>
                </div>
            </div>
            <div id="code-field">
                <label class="problem-label">提交代码</label>
                 <textarea id='code' rows="3" cols=""></textarea>
            </div>
            <hr>
            <div id="submit-code">
                <button type="button" class="btn btn-primary" id="submit-code-button">
                	    提交代码
                </button>
            </div>
            <div id="result"> </div>
          </div>
      </div>
    <%@include file="./foot.jsp" %>
</body>
</html>
