<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>工作</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/datetimepicker/css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/select2/4.0.3/css/select2.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/toastr/toastr.min.css">
	<!-- 可选的Bootstrap主题文件（一般不用引入） -->
	<link href="${pageContext.request.contextPath}/resources/css/adminia.css" rel="stylesheet" />
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">
</head>
<body>
<header role="banner" id="top" class="navbar navbar-fixed-bottom">
    <div class="container">
        <div class="navbar-header">
            <button data-target=".bs-navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle collapsed">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="avatar" href="javascript:window.location.replace('logout');" data-tooltip="true" data-placement="right" title="退出登录">
				<img src="resources/img/avatar.jpg" alt="退出" class="img-circle">
			</a>
        </div>
        <nav role="navigation" class="collapse navbar-collapse bs-navbar-collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a href="#addModal" role="button" class="addnew ml11" data-toggle="modal" title="添加">
						<i class="glyphicon glyphicon-edit"></i> 新增
					</a>
                </li>
                <li>
                    <a href="#addModal" role="button" class="addnew ml12" data-toggle="modal" title="清空">
						<i class="glyphicon glyphicon-trash"></i> 清空
					</a>
                </li>
                <li class="dropdown">
                    <a data-toggle="dropdown" href="javascript:" aria-expanded="false">
                        指派给 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a target="_blank" href="http://issues.wenzhixin.net.cn/bootstrap-table/">Examples</a></li>
                        <li><a href="/examples/">jsFiddle Examples</a></li>
                    </ul>
                </li>
                <li>
                    <a target="_blank" href="https://github.com/wenzhixin/vue-bootstrap-table">消息 <span class="label label-success">New</span></a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
            	<li>
                    <a href="javascript:void(0);" onclick="queryTableByStatus('1');" title="进行中"> <i class="glyphicon glyphicon-transfer"></i> 进行中</a>
                </li>
            	<li>
                    <a href="javascript:void(0);" onclick="queryTableByStatus('2');" title="已完成"> <i class="glyphicon glyphicon-ok-sign"></i> 已完成</a>
                </li>
            	<li>
                    <a href="javascript:void(0);" onclick="queryTableByStatus('0');" class="text-low" title="待认领"> <i class="glyphicon glyphicon-gift text-low"></i> 待认领</a>
                </li>
                <li class="dropdown">
                    <a data-toggle="dropdown" href="javascript:" aria-expanded="false">
						<i class="glyphicon glyphicon-option-horizontal"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0);" onclick="queryTableByStatus('1');"><i class="glyphicon glyphicon-trash"></i> 回收站</a></li>
                        <li><a href="javascript:window.location.replace('logout');"><i class="glyphicon glyphicon-log-out"></i> 退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</header>

<div id="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
							<div class="widget ">
								<div class="widget-content">
									<!-- <div id="custom-toolbar">
										<div class="form-inline" role="form">
											<a href="#addModal" title="清空"> <i class="glyphicon glyphicon-trash"></i>
											</a>
										</div>
									</div> -->
									<table id="whiteboardTable"
											    data-row-style="rowStyle"
											    data-show-header="false"
											    data-height="450"
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
											<th data-field="assignedto" data-formatter="assignedtoFormatter" data-visible="true">指派给</th>
											<th data-field="priority"  class="col-md-8" data-formatter="contentFormatter" data-visible="true">任务</th>
											<th data-field="inter" class="col-md-1" data-formatter="GetDateDiff" data-visible="true">完成日期</th>
											<th data-field="status" class="col-md-1" data-formatter="statusFormatter" data-visible="true">状态</th>
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
<!-- /container -->
</div>
<!-- /content -->

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
			新增
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
					<select class="selectpicker show-menu-arrow" name="assignedto" title="指派给...">
					<option value="0">待认领</option>
					</select>
			   </div>
			</div>
			<div class="col-md-6">
			<!-- <select class="js-example-basic-multiple btn dropdown-toggle btn-default" multiple="multiple" style="width: 100%">
  				<option value="AL">Alabama</option>
  				<option value="WY">Wyoming</option>
  				<option value="AL">Alabama1</option>
  				<option value="WY">Wyoming2</option>
  				<option value="AL">Alabama3</option>
  				<option value="WY">Wyoming4</option>
  				<option value="AL">Alabama5</option>
  				<option value="WY">Wyoming6</option>
			</select> -->
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">

				<div class="form-group">
					<div class="btn-group btn-group-justified" data-toggle="buttons">
						<label class="btn btn-default">
							<input type="radio" value="3" name="priority">
							<i class="glyphicon glyphicon-flag text-high"></i>
							重要
						</label>
						<label class="btn btn-default">
							<input type="radio" value="2" name="priority">
							<i class="glyphicon glyphicon-flag text-mid"></i>
							紧急
						</label>
						<label class="btn btn-default">
							<input type="radio"  value="1" name="priority">
							<i class="glyphicon glyphicon-flag text-low"></i>
							一般
						</label>
					</div>
				</div>
				<input type="hidden" value="1" name="status">
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<input type="text"  id="dp1"  name="finishedon"  class="form-control btn btn-default" placeholder="计划完成日期">
					<input type="hidden" name="board"  class="form-control btn btn-default" value="1"></div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
	<span id="validinfo" class="pull-left"></span>
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
<!-- 		<button type="reset" class="btn btn-warning resetForm">清空</button>
 -->		<button type="submit" class="btn btn-success">确定</button>
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
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/jquery-validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap-table/bootstrap-table.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap-table/bootstrap-table-zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/select2/4.0.3/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/toastr/toastr.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
<!-- Placed at the end of the document so the pages load faster -->
<script>
var gstatus="1";
var queryTableByStatus=function(status){
	gstatus=status;
	$("#whiteboardTable").bootstrapTable('refresh');
};

function queryParamsFunc(params) {  //配置参数
   /*  var temp = {   //这里的键的名字和控制器的变量名必须一致，这边改动，控制器也需要改成一样的
    		limit: params.limit,  //页面大小
            offset: params.offset, //页码
            orderid: $("#orderid").val(),
            //maxrows: params.limit,
            pageindex:params.pageNumber,
    };
    return temp; */
    params.status=gstatus;
    return params;
  }
  
$(".js-example-basic-multiple").select2({
	placeholder: "Select a state",
	minimumResultsForSearch: -1}
	
	);
	
toastr.options = {
		  "closeButton": true,
		  "debug": false,
		  "positionClass": "toast-top-right",
		  "onclick": null,
		  "showDuration": "300",
		  "hideDuration": "300",
		  "timeOut": "1000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
		}
		
$(function () {	
	
		$('#whiteboardTable').on('post-body.bs.table', function () {
	        $('[data-tooltip="true"]').tooltip({
	            container: 'body'
	        });
	    });
	$.ajax({url:"${pageContext.request.contextPath }/web/user/list.action",
    type:'get',
    dataType:'json',
    //data:{ids:rowid},
    error:function(xhr,status,statusText){
    	var sessionstatus=xhr.getResponseHeader("sessionstatus");
		if(sessionstatus=="timeout"){
			window.location="${pageContext.request.contextPath}";
		  }		
    },
    success:function(data){
    	var data = eval(data);
    	$.each(data,function(i,item){
    		$(".selectpicker").append($("<option value="+item.id+">"+item.realname+"</option>"));
    	});
    	$('.selectpicker').selectpicker({
			  style: 'btn-default',
			  size: 4
		});
  		$('.selectpicker').selectpicker('refresh');
    },
    complete:function(e){
    	
    }
});
		
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
				  priority: {required: true}
	        	  },
	         messages:{
	        		  content:{
	        			  required: "<font color=red>内容不能为空；</font>",
	 					 minlength: "<font color=red>内容不能少于5字；</font>",
	 					 maxlength:"<font color=red>内容不能超过25字；</font>"
	        		  },
	        		  finishedon:{
	        			  required:"<font color=red>请设置完成时间；</font>"
	        		  },
	        		  assignedto:{
	        			  required:"<font color=red>请指派对象；</font>"
	        		  },
	        		  priority:{
	        			  required:"<font color=red>请选择优先级；</font>"
	        			  }
	         },
	        	//在上例中新增的部分
	        errorPlacement: function(error, element) { //指定错误信息位置
	        	     /*  if (element.is(':radio') || element.is(':checkbox')) { //如果是radio或checkbox
	        	         var eid = element.attr('name'); //获取元素的name属性
	        	         error.appendTo(element.parent().parent().parent().find('label:first')); //将错误信息添加当前元素的父结点后面
	        	      } else {
	        	         //error.insertAfter(element);
	        	    	  error.appendTo(element.parent().find('label:first'));
	        	      } */
	        	error.appendTo($('#validinfo'));
	        	  }, 
		     submitHandler:function(form){
		    	 var $this=$("#addAccountForm");
		          $this.ajaxSubmit({
									type : "post", //提交方式  
									dataType : "json", //数据类型  
									url : "${pageContext.request.contextPath }/todo/new", //请求url  
									success : function(data) { //提交成功的回调函数 
											$("#addModal").modal("hide");
		                                    $("#whiteboardTable").bootstrapTable('refresh',{silent: true});
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
							classes: 'table',
							striped: true,
							pagination: true,
			                pageSize: 5,
			                queryParams:queryParamsFunc,
			                //pageList: [10, 25, 50, 100, 200],
							onClickRow : function(row) {
								//$("#hideResume").attr("class","hide");
								//console.log('Event: onClickRow, data: '+ JSON.stringify(row));
								//var rows = [];
								//rows.push(row);
								//console.log(row.attachment);
								//$('#detailtable').bootstrapTable("load", rows);
								//$("#showResume").attr("data-pdf",row.attachment);
							},
							onLoadError: function (status) {  
							    //$('#reportTable').bootstrapTable('removeAll');
							    console.log(status); 
							    if(status== 200){
									window.location="${pageContext.request.contextPath}";
								  }	
							  },
							  onLoadSuccess: function (data) {  
								  console.log(1); 
								    console.log(data);  
								  },
							/* responseHandler:function(res) {
								console.log(res);
								return res;
							} */
							
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
				return "<span class=\"label label-info\"><i class=\"glyphicon glyphicon-transfer\"></i></span>";
	        } else if (row.status == 2) {//完成
	        	return "<span class=\"label label-success\"><i class=\"glyphicon glyphicon-ok-sign\"></i></span>";
            } else {//其他
            	return "<span class=\"label label-default\">...</span>";
			}
		}
		function assignedtoFormatter(value, row, index) {
			var assignedUsers="";
			if(row.assignedList!=null){
				for(var i=0;i<row.assignedList.length;i++)
					assignedUsers=assignedUsers+ "<a  data-tooltip=\"true\" data-placement=\"right\" title=\""+row.assignedList[i].realname+"\" class=\"avatar-mid\" href=\"\"><img src=\"resources/img/avatar.jpg\" alt=\""+row.assignedList[i].realname+"\" class=\"img-circle\"></a></span>";
			}
			return assignedUsers;
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
			var finishBtn = ['<a href="#" class="btn btn-default finished" title="完成">',
			'<i class="glyphicon glyphicon-ok"></i></a>'].join('');
			var removeBtn = ['<a href="#removeModal" role="button" class="btn btn-default remove ml10" data-toggle="modal"  title="删除">',
								'<i class="glyphicon glyphicon-trash"></i></a>' ].join('');
			if(row.status == 2){
				return removeBtn;
			}else{
				return finishBtn +" "+removeBtn;
			}
			 
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
				$.ajax({url:"${pageContext.request.contextPath }/todo/finish.action",
			        type:'POST',
			        dataType:'json',
			        data:{ids:row.id},
			        error:function(xhr,status,statusText){
			        	var sessionstatus=xhr.getResponseHeader("sessionstatus");
						if(sessionstatus=="timeout"){
							window.location="${pageContext.request.contextPath}";
						  }		
			        },
			        success:function(data){
			        	toastr.success("标记为完成！");
                        $("#whiteboardTable").bootstrapTable('refresh',{silent: true});
			        }
			    });
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
							        	toastr.success("删除成功！","提示");
	                                    $("#whiteboardTable").bootstrapTable('refresh',{silent: true});
							        	/* $("#whiteboardTable").bootstrapTable('refresh',{silent: true,
											url : '${pageContext.request.contextPath}/todo/pager.action?json'
										}); */ 	
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
		
		$('#addModal,#removeModal').on('hide.bs.modal',
			    function(e) {
			//$('.selectpicker').selectpicker('deselectAll');
			        // show.bs.modal or hide.bs.modal执行一些动作...
			        /* $bsTable2.bootstrapTable('refresh'); //刷新表格
			        $form.clearForm(); //初始化（重置）表单
			        $("#addModal").find(".modal-title").text('新增'); */
			    });
		$('#addModal,#removeModal').on('show.bs.modal',
			    function(e) {
			//$('.selectpicker').selectpicker('deselectAll');
			        // show.bs.modal or hide.bs.modal执行一些动作...
			        /* $bsTable2.bootstrapTable('refresh'); //刷新表格
			        $form.clearForm(); //初始化（重置）表单
			        $("#addModal").find(".modal-title").text('新增'); */
			    });
	</script>
</body>
</html>