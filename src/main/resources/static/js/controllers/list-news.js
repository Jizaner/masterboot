'use strict';

// signup controller
app.controller('ListNewsCtrl', ['$scope', '$http', '$state', '$filter','$modal', '$log',function($scope, $http, $state,$filter,$modal,$log) {
   //datatables---
	$scope.options = {
			serverSide: true,
			autoWidth: true,
	        ajax: {
	    		url: 'app/news/dtpager',
	    		type:"POST",
	    		dataSrc: 'data'
	  			},
	  		columns: [
	  		            {data: 'cover' },
	  		            {data: 'title' },
	  		            {data: 'source' },
	  		            {data: 'id' },
	  		            {data: 'createdon'},
	  		            {data: null}
	  		          ],
	  		order: [
	  		            [4, 'desc']
	  		          ],
	        columnDefs: [ {
	            "targets": [0,1,2,-1],
	            "sortable":  false},
	            {
	            "targets": 0,
	            "render": function(data, type, row) {
	                return "<img style='width:50px;height:50px;' src='"+data+"' />";
	            }},
	            {
		            "targets": -1,
		            "render": function(data, type, row) {
		                return "<button onclick=\"angular.element(this).scope().editData("+row.id+")\"' class='btn btn-default'>编辑</button> <button onclick=\"angular.element(this).scope().openRemoveModal("+row.id+")\" class='btn btn-danger'>删除</button>";
		            }},
	            {
		            "targets": 3,
		            "render": function(data, type, row) {
		                return row.readnum;
		            }
	        },
            {
	            "targets": 4,
	            "render": function(data, type, row) {
	                return  $filter('fromNow')(data*1000,'YYYY-MM-DD');//(arg1,arg2);//row.createdon;
	            }
        }
	        ],
        language: {//下面是一些汉语翻译
            "search": "搜索",
            "lengthMenu": "每页显示 _MENU_ 条记录",
            "infoEmtpy": "没有数据",
            "processing": "正在加载数据...",
            "info": "显示 _START_ 至 _END_ 条 &nbsp;&nbsp;共 _TOTAL_ 条",
            "paginate":
            {
                "first": "首页",
                "previous": "前一页",
                "next": "后一页",
                "last": "末页"
            }
        },
	    };

	    $scope.addData = function () {
	        $scope.counter = $scope.counter + 1;
	        $scope.options.data.push([$scope.counter, $scope.counter * 2]);
	    };

	    $scope.delData = function (id) {
	        //var data = table.row( $(this).parents('tr') ).data();
	        //alert( data[0] +"'s salary is: "+ data[ 5 ] );
	    	alert(id);
	    };
	    $scope.editData = function (id) {
	    	$scope.openRemoveModal('lg',id);
	        //var data = table.row( $(this).parents('tr') ).data();
	        //alert( data[0] +"'s salary is: "+ data[ 5 ] );
	    };
	    
	    $scope.counter = 0;
	  //datatables---end
	    
	$scope.openRemoveModal = function(size,id){  //打开模态 
		var modalInstance = $modal.open({
			templateUrl : 'removeModalContent.html',  //指向上面创建的视图
			controller : 'ModalInstanceCtrler',// 初始化模态范围
			size : size, //大小配置
			resolve : {
				chooseItem : function(){
					return id;
				}
			}
		})
		modalInstance.result.then(function(selectedItem){  
			$scope.selected = selectedItem;
		},function(){
			$log.info('消失时间: ' + new Date())
		})
	}
}])
app.controller('ModalInstanceCtrler',function($scope,$http,toaster,$modalInstance,chooseItem){ //依赖于modalInstance
		$scope.chooseItem = chooseItem;
		$scope.selected = {
			item : chooseItem
		};
		$scope.ok = function(){  
			$modalInstance.close($scope.selected.item); //关闭并返回当前选项
			$http.post('app/news/delete',''+$scope.selected.item+'')
		      .then(function(response) {
		    	if ( !response.data.code || response.data.code!=200) {
		    		$scope.authError = response;
		    		toaster.pop($scope.toaster.type, '失败', $scope.authError);
		        }else{
		        	toaster.pop('success', '提示', '操作成功！');
		        }
		      }, function(x) {
		    	  $scope.authError = 'Server Error';
		    	  toaster.pop('error', '错误', $scope.authError);
		      });
		};
		$scope.cancel = function(){
			$scope.selected.item=[];
			$modalInstance.dismiss('cancel'); // 退出
		}
	})
;