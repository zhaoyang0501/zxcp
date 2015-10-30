<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<script type="text/javascript">
	$(document).ready(function(){
		$.ace.setContextPath('${pageContext.request.contextPath}');
	});
</script>
	</head>
<body>
<%@include file="./header.jsp" %>
<div class="container main">
        <ul class="nav nav-tabs nav-tabs-google">
            <li role="presentation" class="active">
                <a href="${pageContext.request.contextPath}/about">帮助</a>
            </li>
        </ul>
        <div>
            <h2 class="text-center">判题系统</h2>
            <h4>判题结果</h4>
            <ul>
                <li>Accepted: 你的答案符合判题标准</li>
                <li>Runtime Error: 你的程序运行时出现错误（指针越界，栈溢出，有未处理的异常，主函数返回值非零等）</li>
                <li>Time Limit Exceeded: 你的程序执行时间超出题目要求</li>
                <li>Memory Limit Exceeded: 你的程序内存使用超出题目要求</li>
                <li>Compile Error: 你的程序在编译（包括链接）时出现错误</li>
                <li>Wrong Answer: 你的程序输出的答案不符合判题标准</li>
                <li>System Error: 判题系统发生故障，请等待重判</li>
                <li>Waiting: 你的提交正在等待处理</li>
            </ul>

            <h4>编译参数</h4>
            <ul>
                <li>C（GCC 4.8）</li>
                <pre>gcc -DONLINE_JUDGE -O2 -w -std=c99 {src_path} -lm -o {exe_path}main</pre>
                <li>C++（G++ 4.3）</li>
                <pre>g++ -DONLINE_JUDGE -O2 -w -std=c++11 {src_path} -lm -o {exe_path}main</pre>
                <li>Java（Oracle JDK 1.7）</li>
                <pre>//编译
javac {src_path} -d {exe_path}
//运行
java -cp {exe_path} Main</pre>

            </ul>

            <h2 class="text-center">常见问题</h2>
            <ul>
                <li>无特殊说明，请使用标准输入输出。</li>
                <li>Java 代码需使用 Main 作为主类名。C/C++代码使用<code>int main()</code>，并且需要<code>return 0;</code>。</li>
                <li>C/C++ 的64位整数类型，请使用 <code>long long</code> 声明，使用 <code>cin/cout</code> 或 <code>%lld</code> 输入输出。
                    使用<code>__int64</code>会导致编译错误。</li>
                <li>程序执行时间指CPU时间，占用内存按执行过程中内存消耗的峰值计，有多组测试数据时以最大的时间和内存消耗为准</li>
                <li>判题的时候会去除你的输出的最后的换行和空格，然后与去除最后的换行和空格的答案做比较，如果不一致就是 Wrong Answer。
                    其余的行末空格和空行不去除，看清楚题目的要求。没有格式错误。
                </li>
            </ul>
        </div>
    </div>
    <%@include file="./foot.jsp" %>
</body>
</html>