<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="../common/meta.jsp"%>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace/admin.problem.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/falgun/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".date").datetimepicker({
			language:  'zh-CN',
	        weekStart: 1,
	        todayBtn:  1,
	        format:'yyyy-mm-dd',
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	    });
		if("${tip}" != null && "${tip}" != ""){
			noty({"text":"${tip}","layout":"top","type":"success","timeout":"2000"});
		}
	});
</script>
</head>
<body>
	<div class="layout">
		<!-- top -->
		<%@ include file="../top.jsp"%>
		<!-- 导航 -->
		<%@ include file="../menu.jsp"%>
		
		<input type="hidden" id="hf_id" />

		<div class="main-wrapper">
			<div class="container-fluid">
				<div class="row-fluid ">
					<div class="span12">
						<div class="content-widgets light-gray">
							<div class="widget-head  bondi-blue" >
								<h3>商品库存管理</h3>
							</div>
							<div class="box well form-inline">
								<span>商品名称：</span>
								<input type="text" id="_name" >
								<a onclick="$.adminProblem.initSearchDataTable()"
									class="btn btn-info" data-loading-text="正在加载..."><i class="icon-search"></i>查询</a>
							</div>
							
							<div class="widget-container">
							<a class="btn btn-success" style="float: right; margin: 5px;" onclick="$.adminProblem.showProblemAddModal()"><i class="icon-plus"></i> 新品入库</a>
								<table class="responsive table table-striped table-bordered"
									id="dt_table_view">
									<thead>
										<tr>
											<th >id</th>
											<th >名称</th>
											<th >难度</th>
											<th >来源</th>
											<th >分类</th>
											<th >发布时间</th>
											<th >操作</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../foot.jsp"%>
	</div>

	<!-- 编辑新增弹出框 -->
	<div class="modal hide fade" id="_modal">
		<div class="modal-header blue">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<label id="modal_header_label"></label>
		</div>
		<div class="modal-body" style="min-height: 200px;">
			<div class="row-fluid">
				<div class="span12">
					<div class="form-container grid-form form-background left-align form-horizontal">
						 <form id='_form' >
							<input type="hidden" id="id" name='id' value="">
							<div class="control-group">
								<label for="name" class="control-label">题目名称：</label>
								<div class="controls">
									<input type="text"   name='name' value="" placeholder="">
								</div>
							</div>
							<div class="control-group">
								<label for="name" class="control-label">来源：</label>
								<div class="controls">
									<input type="text"   name='reference' value="" placeholder="">
								</div>
							</div>
							<div class="control-group">
								<label for="name" class="control-label">难度：</label>
								<div class="controls">
									<select  name="hard">
										<option value="水题目">水题目</option>
										<option value="位运算">位运算</option>
										<option value="搜索">搜索</option>
									</select>
								</div>
							</div>
						
						    <div class="control-group">
								<label for="name" class="control-label">标签：</label>
								<div class="controls">
									<select  name="type">
										<option value="简单">简单</option>
										<option value="一般">一般</option>
										<option value="困难">困难</option>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label for="name" class="control-label">描述：</label>
								<div class="controls">
									<textarea rows="3" cols=""  name='remark'>
									</textarea>
								</div>
							</div>
							<div class="control-group">
								<label for="name" class="control-label">输入描述：</label>
								<div class="controls">
									<textarea rows="3" cols=""  name='input'>
									</textarea>
								</div>
							</div>
							<div class="control-group">
								<label for="name" class="control-label">输出描述：</label>
								<div class="controls">
									<textarea rows="3" cols=""  name='output'>
									</textarea>
								</div>
							</div>
							
							<div class="control-group">
								<label for="name" class="control-label">输入样例：</label>
								<div class="controls">
									<textarea rows="3" cols=""  name='inputemp'>
									</textarea>
								</div>
							</div>
							
							<div class="control-group">
								<label for="name" class="control-label">输出样例：</label>
								<div class="controls">
									<textarea rows="3" cols=""  name='outputemp'>
									</textarea>
								</div>
							</div>
							
							<div class="control-group">
								<label for="name" class="control-label">输入样例（用于验证）：</label>
								<div class="controls">
									<textarea rows="3" cols=""  name='inputok'>
									</textarea>
								</div>
							</div>
							
							<div class="control-group">
								<label for="name" class="control-label">输入样例（用于验证）：</label>
								<div class="controls">
									<textarea rows="3" cols=""  name='outputok'>
									</textarea>
								</div>
							</div>
							
							<div class="control-group">
								<label for="name" class="control-label">时间限制：</label>
								<div class="controls">
									<input type="text"   name='timelimit' value="" placeholder="">
								</div>
							</div>
							<div class="control-group">
								<label for="name" class="control-label">内存限制：</label>
								<div class="controls">
										<input type="text"  name='cpulimit' value="" placeholder="">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal-footer center" id="div_footer">
			<a class="btn btn-primary" onclick="$.adminProblem.saveProblem()">保存</a>
			<a href="#"   class="btn" data-dismiss="modal" id="closeViewModal">关闭</a>
		</div>
	</div>
</body>
</html>