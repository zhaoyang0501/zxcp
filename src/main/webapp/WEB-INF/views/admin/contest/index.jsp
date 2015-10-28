<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="../common/meta.jsp"%>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace/admin.contest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/falgun/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".form_datetime").datetimepicker({
			language : 'zh-CN',
			format : 'yyyy-mm-dd hh:ii',
			autoclose : 1,
			todayHighlight : 1,
			minuteStep:30,
			forceParse : 0
		});
		
		
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
								<h3>竞赛管理</h3>
							</div>
							<div class="box well form-inline">
								<span>标题：</span>
								<input type="text" id="_name" >
								<a onclick="$.adminContest.initSearchDataTable()"
									class="btn btn-info" data-loading-text="正在加载..."><i class="icon-search"></i>查询</a>
							</div>
							
							<div class="widget-container">
							<a class="btn btn-success" style="float: right; margin: 5px;" onclick="$.adminContest.showContestAddModal()"><i class="icon-plus"></i> 问题录入</a>
								<table class="responsive table table-striped table-bordered"
									id="dt_table_view">
									<thead>
										<tr>
											<th >id</th>
											<th >标题</th>
											<th >开始时间</th>
											<th >结束时间</th>
											<th >类别</th>
											<th >状态</th>
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
								<label for="name" class="control-label">名称：</label>
								<div class="controls">
									<input type="text"   name='name' value="" placeholder="">
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
								<label for="name" class="control-label">开始时间：</label>
								<div class="input-append">
										 <input style="width: 115px" name="begainDate" type="text" readonly="readonly" class="form_datetime">
										 <span class="add-on"><i class="icon-th"></i></span>
									   </div>
							</div>
							<div class="control-group">
								<label for="name" class="control-label">结束时间：</label>
								<div class="input-append">
										 <input style="width: 115px" name="endDate" type="text" readonly="readonly" class="form_datetime">
										 <span class="add-on"><i class="icon-th"></i></span>
									   </div>
							</div>
							
							
							<div class="control-group">
								<label for="name" class="control-label">类别：</label>
								<div class="controls">
									<select  name="type">
										<option value="公开赛">公开赛</option>
										<option value="公开赛">小组赛</option>
										<option value="公开赛">考试</option>
									</select>
								</div>
							</div>
							
							<div class="control-group">
								<label for="name" class="control-label">状态：</label>
								<div class="controls">
									<select  name="state">
										<option value="未开始">未开始</option>
										<option value="进行中">进行中</option>
										<option value="已结束">已结束</option>
									</select>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal-footer center" id="div_footer">
			<a class="btn btn-primary" onclick="$.adminContest.saveContest()">保存</a>
			<a href="#"   class="btn" data-dismiss="modal" id="closeViewModal">关闭</a>
		</div>
	</div>
</body>
</html>