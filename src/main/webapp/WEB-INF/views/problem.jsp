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
<nav class="navbar navbar-default">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <a class="navbar-brand" href="#">首页</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      
      <ul class="nav navbar-nav">
                <li class="active"><a href="problems">题目</a></li>
                <li><a href="submissions/">提交</a></li>
                <li><a href="contests/">比赛</a></li>
                <li><a href="/about/">关于</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li class="user1">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">user <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<!-- nav end -->

<!-- custom body begin -->

    
    <div class="container main">
        <div class="row">
            <div class="col-md-9 col-lg-9  ">
                <div class="row">
                    <div class="pull-right">
                        <form class="form-inline" method="get">
                            <div class="form-group">
                                <input name="keyword" class="form-control" placeholder="请输入关键词">
                                <input type="submit" value="搜索" class="btn btn-primary">
                            </div>
                        </form>
                        
                        
                        <form role="form" class="form-inline">
						 <div class="form-group">
							<label for="input-email" class="sr-only">Email address</label>
							<input id="input-email" type="email" placeholder="Type your email" class="form-control">
						 </div>
						 <div class="form-group">
							<label for="input-password" class="sr-only">Password</label>
							<input id="input-password" type="password" placeholder="Type your password" class="form-control">
						 </div>
						 <div class="checkbox c-checkbox">
							<label>
							   <input type="checkbox">
							   <span class="fa fa-check"></span>Remember</label>
						 </div>
						 <button type="submit" class="btn btn-default">Sign in</button>
					  </form>
                        
                    </div>
                </div>
                <div>
                    <table class="table table-striped" id='dt_table_view'>
                        <thead>
                        <tr>
                            <th></th>
                            <th>#</th>
                            <th>题目</th>
                            <th><a href="/problems/?order_by=difficulty">难度</a></th>
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
            <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
            公告
        </h3></div>
    <div class="panel-body">
    
        
           <p>暂无可显示的公告</p>
        
    </div>
</div>
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
                            分类
                        </h3>
                    </div>
                    <ul class="list-group">
                        
                            <li class="list-group-item problem-tag"
                                onclick="location.href='/problems/?tag=qduoj 第一次月赛'">
                                <span class="badge">7</span>
                                qduoj 第一次月赛
                            </li>
                        
                            <li class="list-group-item problem-tag"
                                onclick="location.href='/problems/?tag=水题'">
                                <span class="badge">7</span>
                                水题
                            </li>
                        
                            <li class="list-group-item problem-tag"
                                onclick="location.href='/problems/?tag=搜索'">
                                <span class="badge">3</span>
                                搜索
                            </li>
                        
                            <li class="list-group-item problem-tag"
                                onclick="location.href='/problems/?tag=数据结构'">
                                <span class="badge">2</span>
                                数据结构
                            </li>
                        
                            <li class="list-group-item problem-tag"
                                onclick="location.href='/problems/?tag=位运算'">
                                <span class="badge">2</span>
                                位运算
                            </li>
                        
                            <li class="list-group-item problem-tag"
                                onclick="location.href='/problems/?tag=简单'">
                                <span class="badge">2</span>
                                简单
                            </li>
                        
                            <li class="list-group-item problem-tag"
                                onclick="location.href='/problems/?tag=线段树'">
                                <span class="badge">2</span>
                                线段树
                            </li>
                        
                            <li class="list-group-item problem-tag"
                                onclick="location.href='/problems/?tag=栈'">
                                <span class="badge">2</span>
                                栈
                            </li>
                        
                            <li class="list-group-item problem-tag"
                                onclick="location.href='/problems/?tag=字符串'">
                                <span class="badge">1</span>
                                字符串
                            </li>
                        
                            <li class="list-group-item problem-tag"
                                onclick="location.href='/problems/?tag=康拓展开'">
                                <span class="badge">1</span>
                                康拓展开
                            </li>
                        
                            <li class="list-group-item problem-tag"
                                onclick="location.href='/problems/?tag=voting'">
                                <span class="badge">1</span>
                                voting
                            </li>
                        
                            <li class="list-group-item problem-tag"
                                onclick="location.href='/problems/?tag=manacher'">
                                <span class="badge">1</span>
                                manacher
                            </li>
                        
                            <li class="list-group-item problem-tag"
                                onclick="location.href='/problems/?tag=数学规律'">
                                <span class="badge">1</span>
                                数学规律
                            </li>
                        
                            <li class="list-group-item problem-tag"
                                onclick="location.href='/problems/?tag=素数'">
                                <span class="badge">1</span>
                                素数
                            </li>
                        
                            <li class="list-group-item problem-tag"
                                onclick="location.href='/problems/?tag=dp'">
                                <span class="badge">1</span>
                                dp
                            </li>
                        
                            <li class="list-group-item problem-tag"
                                onclick="location.href='/problems/?tag=数组'">
                                <span class="badge">1</span>
                                数组
                            </li>
                        
                    </ul>
                </div>

            </div>
        </div>
    </div>
</body>
</html>