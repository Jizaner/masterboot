<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 清除缓存防止页面后退安全隐患,使用时直接包含即可 -->
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setDateHeader("Expires", -1);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />    
    <link href="${pageContext.request.contextPath}/resources/plugins/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/pages/login.css" rel="stylesheet" /> 
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
<header role="banner" id="top" class="navbar navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button data-target=".bs-navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle collapsed">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Just do it! </a>
        </div>
        <nav role="navigation" class="collapse navbar-collapse bs-navbar-collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a href="/getting-started/">入门</a>
                </li>
                <li>
                    <a href="/documentation/">文档</a>
                </li>
                <li class="dropdown">
                    <a data-toggle="dropdown" href="javascript:" aria-expanded="false">
                        例子
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a target="_blank" href="http://issues.wenzhixin.net.cn/bootstrap-table/">例子1</a></li>
                        <li><a href="/examples/">例子2</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <!-- Localization -->
                <li class="">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="javascript:void(0)" aria-expanded="false">
                        <span class="language">
                                中文
                        </span> <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        
                        <li data-language="en" class="">
                            <a href="/">
                                English
                            </a>
                        </li>
                        <li data-language="zh-cn">
                            <a href="/zh-cn">
                                简体中文
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</header>

<div id="login-container">
	<div id="login-content" class="clearfix">
    <FORM METHOD="post" NAME="actForm"  ACTION="tologin">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="account">账号</label>
						<div class="controls">
							<input type="text" class="" id="account" NAME="account" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">密码</label>
						<div class="controls">
							<input type="password" class="" id="password" NAME="password"/>
						</div>
					</div>
					<div class="control-group">
					<div id="remember-me" class="pull-left">
					<input type="checkbox" name="remember" id="remember" />
					<label id="remember-label" for="remember">记住</label>
				</div>
				<div class="pull-right">
					<button type="submit" class="btn btn-warning btn-large">
						登录
					</button>
				</div>
					</div>
				</fieldset>
				
			</form>
		</div> <!-- /login-content -->
</div> <!-- /login-wrapper -->
<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
