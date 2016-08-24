<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>基本信息</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap3/bootstrap.css">
	<!-- 可选的Bootstrap主题文件（一般不用引入） -->
	<%-- <link href="${pageContext.request.contextPath}/resources/css/adminia.css" rel="stylesheet" />
	--%>
	
	<style>

.avatar{
width:40px;
}

.red{
 background-color:red;
}
.green{
 background-color:green;
}
.yellow{
 background-color:yellow;
}
.blue{
 background-color:blue;
}
.text-high{
	color:red;
}
.text-mid{
	color:#f0ad4e;
}
.text-low{
	color:#5cb85c;
}

.hide{
 display:none;
}
.fixed-table-container
{
 border-left-width: 0px; border-right-width: 0px;
 border-radius:0px;
}
.fixed-table-container tbody td{border:0px solid #ddd !important}
.bootstrap-table .table{
border:0;
}

</style>
</head>
<body>
	<%-- <jsp:include page="header.jsp"></jsp:include>
--%>
<div id="content">
	<div class="container">
		<div class="row">
			<div class="col-md-12"
					style="padding-left: 0px; padding-right: 0px;">
				<ul class="nav nav-tabs " id="myTab">
					<!-- <li class="active">
					<a href="#home">白板</a>
				</li>
				<li >
					<a href="#profile" class="red">白板-（产品研发）</a>
				</li>
				<li>
					<a href="#messages" class="green">白板-（产品设计）</a>
				</li>
				<li>
					<a href="#settings" class="yellow">白板-（综合管理）</a>
				</li>
				-->
			</ul>
			<div class="tab-content">
				<!-- tab1 -->
				<div class="tab-pane  active" id="home">
					<div class="row" style="background-color: #fff;">
						<div class="col-md-12" style="padding-left: 0px;" id="resumeList">
							<div class="widget ">
								<div class="widget-content">
									<div id="custom-toolbar">
										<div class="form-inline" role="form">
											<a href="javascript:window.location.replace('../tologout.action');"title="退出">
												<img src="../resources/img/avatar.jpg" alt="退出" class="img-circle avatar"></a>
											<a href="#addTodoModal" role="button"
														class="btn btn-default addnew ml11" data-toggle="modal"
														title="添加"> <i class="glyphicon glyphicon-edit"></i>
												新增
											</a>
											<a href="#addModal" role="button"
														class="btn btn-default addnew ml12" data-toggle="modal"
														title="清空"> <i class="glyphicon glyphicon-trash"></i>
												清空
											</a>
											<!-- /input-group -->
										</div>
									</div>
									<table id="whiteboardTable"
											    data-row-style="rowStyle"
											    data-show-header="false"
											    data-height="558"
												data-striped="false" data-toolbar="#custom-toolbar"
												data-side-pagination="server" data-show-refresh="true"
												data-show-toggle="false" data-show-columns="true"
												data-click-to-select="false" data-select-item-name="radioName"
												data-search="false" data-pagination="true"
												data-page-list="[5, 10, 20, 50, 100, 200]">
										<thead>
											<tr>
												<!-- <th data-field="state" data-checkbox="true" data-visible="false"></th>
											-->
											<th data-field="priority"  class="col-md-6" data-formatter="contentFormatter" data-visible="true"></th>
											<th data-field="inter" class="col-md-1" data-formatter="GetDateDiff" data-visible="true">倒计时</th>
											<th data-field="status" class="col-md-1" data-formatter="statusFormatter" data-visible="true">状态</th>
											<th data-field="assignedto" class="col-md-1" data-formatter="assignedtoFormatter11" data-visible="true">所属团队</th>
											<th data-field="remark" class="col-md-1" data-visible="false">备注</th>
											<th data-field="operate" class="col-md-2" data-formatter="operateFormatter"  data-halign="left" data-align="right"
															data-events="operateEvents">操作</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<!-- widget end -->
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- tab1 end -->
			<!-- tab2 -->
			<div class="tab-pane fade" id="profile"></div>
			<!-- tab2 end -->
			<!-- tab3 -->
			<div class="tab-pane fade" id="messages">...</div>
			<!-- tab3 end -->
			<!-- tab4 -->
			<div class="tab-pane fade" id="settings">...</div>
			<!-- tab4 end -->
		</div>
	</div>
</div>
<!-- /row -->

</div>
<!-- /container -->
</div>
<!-- /content -->
<%-- <jsp:include page="footer.jsp"></jsp:include>
--%>
<!-- Modal-------------------------------------------------------------- -->
<div class="modal fade" id="addTodoModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="addModalLabel">新增</h4>
</div>
<div class="modal-body">
	<form id="form1" class="form-horizontal form-bordered">
		<input name="id" type="text" class="hide">
		<div class="form-group">
			<div class="col-sm-12">
				<input name="title" placeholder="标题" class="form-control" type="text"></div>
		</div>
		<div class="form-group">
			<div class="col-sm-12">
				<input name="orderby" placeholder="排序" class="form-control" type="text">
				<span class="help-block">只能填写正整数</span>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-12">
				<textarea name="sourceurl" placeholder="关联URL" class="form-control" rows="5"></textarea>
			</div>
		</div>
	</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	<button type="button" class="btn btn-primary">保存</button>
</div>
</div>
<!-- modal-content -->
</div>
</div>
<!-- modal-dialog -->
<!-- modal-------------------------------------------------------------- -->

<!-- RemoveModal -->
<div class="modal fade" id="removeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header" id="22222">
	<button type="button" class="close" data-dismiss="modal">
		<span aria-hidden="true">&times;</span>
		<span class="sr-only">Close</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">警告</h4>
</div>
<div class="modal-body">
	<p>确定删除该条数据？删除后将无法恢复。</p>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	<button type="button" class="btn btn-danger removeBtn">确定</button>
</div>
</div>
</div>
</div>
<!-- RemoveModal -->
<!-- finishedModal2 -->
<div class="modal fade" id="finishedModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header" id="erase">
	<button type="button" class="close" data-dismiss="modal">
		<span aria-hidden="true">&times;</span>
		<span class="sr-only">Close</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">提示</h4>
</div>
<div class="modal-body">
	<p>标记为完成？</p>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	<button type="button" class="btn btn-danger finishedBtn">确定</button>
</div>
</div>
</div>
</div>
<!-- finishedModal2 -->
<!-- AddModal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog">
<form id="addAccountForm" >
<div class="modal-content">
	<div class="modal-header"  id="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h4 class="modal-title" id="exampleModalLabel">
			<i class="glyphicon glyphicon-edit"></i>
			写下内容...
		</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<textarea class="form-control" name="content" placeholder="请输入内容..."></textarea>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">

				<div class="form-group">
					<div class="btn-group btn-group-justified" data-toggle="buttons">
						<label class="btn btn-default ">
							<input type="radio" value="3" name="priority">
							<i class="glyphicon glyphicon-flag text-high"></i>
							重要
						</label>
						<label class="btn btn-default ">
							<input type="radio" value="2" name="priority">
							<i class="glyphicon glyphicon-flag text-mid"></i>
							紧急
						</label>
						<label class="btn btn-default ">
							<input type="radio"  value="1" name="priority">
							<i class="glyphicon glyphicon-flag text-low"></i>
							一般
						</label>
					</div>
				</div>
				<div class="form-group">
					<div class="btn-group btn-group-justified" data-toggle="buttons">
						<label class="btn small btn-default">
							<input type="radio" value="1" name="status">开始</label>
						<label class="btn btn-default">
							<input type="radio" value="2" name="status">完成</label>
						<label class="btn btn-default">
							<input type="radio" value="0" name="status">关闭</label>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<input type="text"  id="dp1"  name="finishedon"  class="form-control btn btn-default" placeholder="计划完成日期">
					<input type="hidden" name="board"  class="form-control btn btn-default" value="1"></div>

			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		<button type="reset" class="btn btn-warning resetForm">清空</button>
		<button type="submit" class="btn btn-success">确定</button>
	</div>
</div>
</form>
</div>
</div>
<!-- AddModal end-->
<!-- Placed at the end of the document so the pages load faster -->
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap3/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/jquery-validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap-table/bootstrap-table.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap-table/bootstrap-table-zh-CN.js"></script>
<!-- Placed at the end of the document so the pages load faster -->
<script>

	$(function () {	
		
		// 重置表单
		$().ready(function() {
		 var validator = $("#addAccountForm").validate({
			 rules: {
	        	   content: {
	        		 required: true,
					 minlength: 5,
					 maxlength:25
	        	   },
	        	   priority:{
	        		 required:true
	        	   },
	        	   finishedon: {
		        		 required: true,
						 minlength: 5
		        	   },
		          assignedto: {required: true},
			      status: {required: true},
				  priority: {required: true}
	        	  },
	         messages:{
	        		  content:{
	        			  required: "<font color=red>不能为空</font>",
	 					 minlength: "<font color=red>不能少于5字</font>",
	 					 maxlength:"<font color=red>不能超过25字</font>"
	        		  },
	        		  finishedon:{
	        			  required:"<font color=red>不能为空</font>"
	        		  },
	        		  assignedto:{
	        			  required:"<font color=red>不能为空</font>"
	        		  },
	        		  priority:{
	        			  required:"<font color=red>不能为空</font>"
	        			  },
	        		  status:{
	        			  required:"<font color=red>不能为空</font>"
	        	  }
	         },
	        	//在上例中新增的部分
	        errorPlacement: function(error, element) { //指定错误信息位置
	        	      if (element.is(':radio') || element.is(':checkbox')) { //如果是radio或checkbox
	        	         var eid = element.attr('name'); //获取元素的name属性
	        	         error.appendTo(element.parent().parent().parent().find('label:first')); //将错误信息添加当前元素的父结点后面
	        	      } else {
	        	         //error.insertAfter(element);
	        	    	  error.appendTo(element.parent().find('label:first'));
	        	      }
	        	  }, 
		     submitHandler:function(form){
		    	 var $this=$("#addAccountForm");
		          $this.ajaxSubmit({
									type : "post", //提交方式  
									dataType : "json", //数据类型  
									url : "${pageContext.request.contextPath }/todo/new.action", //请求url  
									success : function(data) { //提交成功的回调函数 
										console.log(data.responseText);
											$("#addModal").modal("hide");
		                                    $("#whiteboardTable").bootstrapTable('refresh',{
														url : '${pageContext.request.contextPath}/todo/pager.action?json'
													});
											$("#addAccountForm").resetForm();
											$this.find(".form-group").find("label").removeClass("active")
											},
									error : function(error){
										var sessionstatus=error.getResponseHeader("sessionstatus");
										if(sessionstatus=="timeout"){
											window.location="${pageContext.request.contextPath}";
										  }		
										}
									});
									return false; //不刷新页面  
		        }   
		    });
		    $("#reset").click(function() {
		        validator.resetForm();
		    });

		});
	//---	
	$('#dp1').datetimepicker({
        language:  'zh-CN',
        format: 'yyyy-mm-dd',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 0,
        minView:2
    });
	});
		// button state demo
		$('.showpass').click(function() {
			var btn = $(this)
			btn.button('loading')
			setTimeout(function() {
				btn.button('reset')
			}, 3000)
			
		});
		//$('#detailtable').bootstrapTable();
		//=====
		$('#whiteboardTable').bootstrapTable({
							url : '${pageContext.request.contextPath}/todo/pager.action?json',
							classes: 'table table-wihteboard',
							striped: true,
							pagination: true,
			                pageSize: 5,
			                pageList: [10, 25, 50, 100, 200],
							onClickRow : function(row) {
								//$("#hideResume").attr("class","hide");
								//console.log('Event: onClickRow, data: '+ JSON.stringify(row));
								//var rows = [];
								//rows.push(row);
								//console.log(row.attachment);
								//$('#detailtable').bootstrapTable("load", rows);
								//$("#showResume").attr("data-pdf",row.attachment);
							},
							
						});
		function GetDateDiff(value, row, index){
			//startDate,endDate
		   //var startTime = new Date(Date.parse(startDate.replace(/-/g, "/"))).getTime();
		   var startTime = new Date(Date.parse(row.finishedon.replace(/-/g, "/"))).getTime();
		   var endTime = new Date();
		   var dates = Math.ceil((startTime - endTime)/(1000*60*60*24));
		   if(row.finishedon!=null){
		   if(dates==1){
			   //return Math.abs(dates)+"天内";
			   return "明天";
		   }else if(dates==0){
			   return "今天";
		   }if(dates>1){
			   return Math.abs(dates)+"天内";
		   }else if(dates<0){
			   return "<font color=red>"+Math.abs(dates)+"天前</font>";
		   }
		   }else{
			   return "-";
		   }
		    
		}   
		
		function statusFormatter(value, row, index) {
			if (row.status == 0) {//关闭
				return "<span class=\"label label-danger\"><i class=\"glyphicon glyphicon-remove\"></i></span>";
			} else if (row.status == 1) {//开始
				return "<span class=\"label label-info\"><i class=\"glyphicon glyphicon-play\"></i></span>";
	        } else if (row.status == 2) {//完成
	        	return "<span class=\"label label-success\"><i class=\"glyphicon glyphicon-ok\"></i></span>";
            } else {//其他
            	return "<span class=\"label label-default\">...</span>";
			}
		}
		function assignedtoFormatter(value, row, index) {
			if (row.priority == 4) {
				return "<span class=\"label label-danger\">"+row.assignedto+"</span>";
			} else if (row.priority == 3) {
				return "<span class=\"label label-warning\">"+row.assignedto+"</span>";
	        } else if (row.priority == 2) {
	        	return "<span class=\"label label-info\">"+row.assignedto+"</span>";
            } else  {
            	return "<span class=\"label label-default\">"+row.assignedto+"</span>";
			}
		}
		function contentFormatter(value, row, index) {
			//'<a href="#removeModal" role="button" class="btn  btn-default  remove ml10" data-toggle="modal"  title="删除"><i class="glyphicon glyphicon-trash"></i></a>'
			if (row.priority == 3) {
				return "<i class=\"glyphicon glyphicon-flag text-high\"></i> "+row.content;
			} else if (row.priority == 2) {
				return "<i class=\"glyphicon glyphicon-flag text-mid\"></i> "+row.content;
	        } else if (row.priority == 1) {
	        	return "<i class=\"glyphicon glyphicon-flag text-low\"></i> "+row.content;
	        } else  {
	        	return "<i class=\"glyphicon glyphicon-flag text-success\"></i> "+row.content;
	        }
		}
		function operateFormatter(value, row, index) {
			return [
                    /* '<a class="like" href="javascript:void(0)" title="Like">',
                    '<i class="glyphicon glyphicon-heart"></i>',
                    '</a>', */
                    '<a href="#finishedModal" role="button" class="btn btn-default finished" data-toggle="modal"  title="完成">',
					'<i class="glyphicon glyphicon-ok"></i>',
					'</a> ',
					' <a href="#removeModal" role="button" class="btn btn-default remove ml10" data-toggle="modal"  title="删除">',
					'<i class="glyphicon glyphicon-trash"></i>',
					'</a>' ].join('');
		}
		window.operateEvents = {
			/* 'click .status' : function(e, value, row, index) {
				//console.log(value, row, index, row.id);
				var rowid = row.id;
				 $.get("${pageContext.request.contextPath }/whiteboard/deleteaccount.action?accountid="+ rowid, function(data, status) {  
					$("#whiteboardTable").bootstrapTable('refresh',{
						url : '${pageContext.request.contextPath}/whiteboard/showwhiteboard.action?json'
					}); 
					$('#detailtable').bootstrapTable("load", []);
				});  
			}, */
			'click .finished' : function(e, value, row, index) {
				$("#finishedModal").find(".modal-header").attr("id", row.id);
			},
			'click .remove' : function(e, value, row, index) {
				$("#removeModal").find(".modal-header").attr("id", row.id);
			}
		};
		$(".resetForm").click(function() {
			$('#addAccountForm')[0].reset();
			$('#addAccountForm').find(".form-group").find("label").removeClass("active")
		});
		$('.removeBtn').on('click',function() {
							var rowid =  $("#removeModal").find(".modal-header").attr("id");
							$("#removeModal").modal("hide");
							$.ajax({url:"${pageContext.request.contextPath }/todo/delete.action",
							        type:'POST',
							        dataType:'json',
							        data:{ids:rowid},
							        error:function(xhr,status,statusText){
							        	var sessionstatus=xhr.getResponseHeader("sessionstatus");
										if(sessionstatus=="timeout"){
											window.location="${pageContext.request.contextPath}";
										  }		
							        },
							        success:function(data){
							        	$("#whiteboardTable").bootstrapTable('refresh',{
											url : '${pageContext.request.contextPath}/todo/pager.action?json'
										}); 	
							        }
							    });
						});
		$('.finishedBtn').on('click',function() {
			var rowid = $("#finishedModal").find(".modal-header").attr("id");
			$("#finishedModal").modal("hide");
			$.ajax({url:"${pageContext.request.contextPath }/todo/finish.action",
		        type:'POST',
		        dataType:'json',
		        data:{ids:rowid},
		        error:function(xhr,status,statusText){
		        	var sessionstatus=xhr.getResponseHeader("sessionstatus");
					if(sessionstatus=="timeout"){
						window.location="${pageContext.request.contextPath}";
					  }		
		        },
		        success:function(data){
		        	$("#whiteboardTable").bootstrapTable('refresh',{
						url : '${pageContext.request.contextPath}/todo/pager.action?json'
					}); 	
		        }
		    });
		});
		/*--------clock picker--------*/
		$('#myTab a').click(function(e) {
			e.preventDefault()
			//$(this).value()
		});
		
		/*--------end--------*/
		$('.selectall').click(function(e) {
			$('#whiteboardTable').bootstrapTable('checkAll');
			alert('Selected values: ' + JSON.stringify($('#whiteboardTable').bootstrapTable('getSelections')));
		});
		function responseHandler(res) {
			return res.repos;
		}
		
	</script>
</body>
</html>