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
<!-- nav end -->

<!-- custom body begin -->
<div class="container main">
	<section id="product">
    <div class="container">
      <div class="row">        
       <div class="col-lg-12">
       <div class="file-commit-form js-file-commit-form">
  <img alt="@zhaoyang0501" class="commit-form-avatar" height="48" src="https://avatars1.githubusercontent.com/u/10969646?v=3&amp;s=96" width="48">

  <div class="commit-form">
    <h3 class="file-commit-form-heading">Commit changes</h3>

    <div class="too-long-message">
      <span class="octicon octicon-light-bulb"></span>
      <strong>ProTip!</strong> Great commit summaries are 50 characters or less. Place extra information in the extended description.
    </div>

    <label for="commit-summary-input" class="hidden">
      Commit summary
    </label>
    <input id="commit-summary-input" type="text" class="input-block input-contrast js-new-blob-commit-summary" placeholder="Update .classpath" name="message" value="">
    <input type="hidden" class="js-commit-message-fallback" name="placeholder_message" value="Update .classpath" data-default-value="Update .classpath">

    <label for="commit-description-textarea" class="hidden">
      Optional extended description
    </label>
    <textarea id="commit-description-textarea" name="description" class="input-block input-contrast commit-message js-new-blob-commit-description" placeholder="Add an optional extended description…"></textarea>

      <div class="quick-pull-choice js-quick-pull-choice ">
        <dl class="form">
          <dd>
            <div class="form-checkbox">
              <label>
                <input type="radio" class="js-quick-pull-choice-option" name="commit-choice" value="direct" checked="checked">
                  <span class="text-muted octicon octicon-git-commit"></span>
                  Commit directly to the <strong class="branch-name">master</strong> branch
              </label>
            </div>
            <div class="form-checkbox">
              <label>
                <input type="radio" class="js-quick-pull-choice-option" name="commit-choice" value="quick-pull">
                <span class="text-muted octicon octicon-git-pull-request"></span>
                Create a <strong>new branch</strong> for this commit and start a pull request.
                <a href="https://help.github.com/articles/using-pull-requests" target="_blank">
                  Learn more about pull requests.
                </a>
              </label>
            </div>
          </dd>
        </dl>

        <div class="quick-pull-branch-name">
          <div class="new-branch-name-input">
            <span class="octicon octicon-git-branch quick-pull-new-branch-icon"></span>
            <input type="text" value="zhaoyang0501-patch-1" class="input-contrast js-quick-pull-new-branch-name" placeholder="New branch name…" data-generated-branch="zhaoyang0501-patch-1" data-check-url="https://github.com/zhaoyang0501/zxcp/ref_check">
            <span class="quick-pull-normalization-info js-quick-pull-normalization-info"></span>
          </div>
        </div>
      </div>

      <input type="hidden" name="target_branch" class="js-quick-pull-target-branch" value="master" data-default-value="master">
      <input type="hidden" name="quick_pull" class="js-quick-pull-choice-value" value="" data-default-value="">

  </div>

  <button type="submit" class="btn btn-primary js-blob-submit" id="submit-file" data-edit-text="Commit changes" data-pull-text="Propose file change" disabled="">
    Commit changes
  </button>

  <a href="/zhaoyang0501/zxcp/blob/master/.classpath" class="btn btn-danger">Cancel</a>

</div>
          <h1 class="heading1"><span class="maintext">留言板</span></h1>
          <section class="commentsblog">
                <h2 class="heading2"><span>欢迎留言</span></h2>
                <ul class="comments">
               
                <li>
                    <a class="avtar thumbnail"><img src="img/avtar.jpg" alt=""></a>
                    <div class="commentdetail">
                      <a class="blogtitle" href="#">${bean.title }</a>
                      <p>${bean.context }</p>
                      <a href="#">${bean.user.nickname } 发表于 ${bean.createDate }</a>
                    </div>
                  </li>
                </ul>
              </section>
              <section class="leavecomment">
                <h2 class="heading2"><span>发表</span></h2>
                <form method="post" action="doMsgBox" class="form-horizontal commentform2" novalidate="novalidate">
                  <fieldset>
                    <div class="control-group">
                      <label class="control-label">标题 <span class="required">*</span></label>
                      <div class="controls">
                        <input type="text" name="msgBox.title" id="name" class="required">
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label">内容</label>
                      <div class="controls">
                        <textarea name="msgBox.context" id="message" cols="40" rows="6" class="required" style="margin-left: 0px; margin-right: 0px; width: 496px;"></textarea>
                      </div>
                    </div>
                    <div class="controls">
                      <input type="submit" id="submit_id" value="提 交" class="btn btn-orange">
                    </div>
                  </fieldset>
                </form>
              </section>
          <div class="clearfix"></div>
          <br>
        </div>
       </div>
    </div>
  </section>
    </div>
    <%@include file="./foot.jsp" %>
</body>
</html>