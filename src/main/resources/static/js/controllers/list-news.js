'use strict';

// signup controller
app.controller('ListNewsCtrl', ['$scope', '$http', '$state',
                                '$filter','$compile','$modal',
                                'DTOptionsBuilder','DTColumnDefBuilder','DTColumnBuilder','toaster',
                                function($scope, $http, $state,$filter,$compile,$modal,DTOptionsBuilder,
                                		DTColumnDefBuilder,DTColumnBuilder,toaster) {
 
	 	var vm = this;
	 	vm.message = '';
	    vm.edit = edit;
	    vm.delete = deleteRow;
	    vm.news = {};
	    vm.dtOptions = DTOptionsBuilder.newOptions()
	    .withOption('ajax', {
	    	url: 'app/news/dtpager',
    		type:"POST",
    		dataSrc: 'data'
        })
        .withOption('serverSide', true)
        .withLanguageSource('vendor/jquery/datatables/i18n/Chinese.json')
        .withOption('createdRow', createdRow)
        .withPaginationType('full_numbers');
	    
	    vm.dtColumns = [
	                    DTColumnBuilder.newColumn('id').withTitle('ID').notVisible(),
	                    DTColumnBuilder.newColumn('cover').withTitle('资讯封面').notSortable().renderWith(coverHtml),
	                    DTColumnBuilder.newColumn('title').withTitle('资讯标题').notSortable(),
	                    DTColumnBuilder.newColumn('source').withTitle('转载来源').notSortable(),
	                    DTColumnBuilder.newColumn('readnum').withTitle('阅读次数'),
	                    DTColumnBuilder.newColumn('createdon').withTitle('发布时间').renderWith(posttimeHtml),
	                   DTColumnBuilder.newColumn(null).withTitle('操作').notSortable().renderWith(actionsHtml)
	                ];
	    
	    vm.dtColumnDefs = [
	                       DTColumnDefBuilder.newColumnDef(0).notVisible(),
	                       DTColumnDefBuilder.newColumnDef(1).notSortable(),
	                       DTColumnDefBuilder.newColumnDef(2).notSortable()
	                   ];
	    
	    vm.reloadData = reloadData;
	    vm.dtInstance = {};

	    function edit(news) {
	        //vm.message = 'You are trying to edit the row: ' + JSON.stringify(news);
	        // Edit some data and call server to make changes...
	        // Then reload the data so that DT is refreshed
	        vm.dtInstance.reloadData();
	        toaster.pop('info', '提示', '此功能正在开发中...['+news.id+']');
	    }
	    function deleteRow(news) {
	    	$scope.openWin('lg',news.id);

	        //vm.message = 'You are trying to remove the row: ' + JSON.stringify(news);
	        // Delete some data and call server to make changes...
	        // Then reload the data so that DT is refreshed
	        //vm.dtInstance.reloadData();
	        //toaster.pop('success', '提示', '操作成功！'+news.id);
	    }
	    function createdRow(row, data, dataIndex) {
	        // Recompiling so we can bind Angular directive to the DT
	        $compile(angular.element(row).contents())($scope);
	    }
	    function coverHtml(data, type, full, meta) {
	    	return "<img style='width:80px;height:80px;' src='"+data+"' />";
	    }
	    function posttimeHtml(data, type, full, meta) {
	        return  $filter('fromNow')(data*1000,'YYYY-MM-DD');
	    }

	    function actionsHtml(data, type, full, meta) {
	    	vm.news[data.id] = data;
	        return '<button class="btn btn-success" ng-click="showCase.edit(showCase.news[' + data.id + '])">' +
	            '   <i class="fa fa-edit"></i>' +
	            '</button>&nbsp;' +
	            '<button class="btn btn-danger" ng-click="showCase.delete(showCase.news[' + data.id + '])" )"="">' +
	            '   <i class="fa fa-trash-o"></i>' +
	            '</button>';
	    }
	    function reloadData() {
	        var resetPaging = true;//是否刷新所在的页码；是：则重回到首页，否：则保持在当前页
	        vm.dtInstance.reloadData(callback, resetPaging);
	    }

	    function callback(json) {
	        console.log(json);
	    }
	    
	    //---
	    $scope.openWin = function(size,id){
	        var modalInstance = $modal.open({
	                        templateUrl: 'removeModalContent.html',
	                        backdrop:'static',
	                        keyboard:false,
	                        controller: function($scope, $modalInstance) {
	                            $scope.cancel = function() {
	                                $modalInstance.dismiss('cancel');
	                                toaster.pop('info', "提示", "您已取消操作！^_^");
	                            };
	                            $scope.ok = function () {
	                            	$http.post('app/news/delete',''+id+'').then(function(response) {
	                  		    	if ( !response.data.code || response.data.code!=200) {
	                  		    		$scope.authError = response;
	                  		    		toaster.pop('error', '失败', $scope.authError);
	                  		        }else{
	                  		        	vm.dtInstance.reloadData();
	                  		        	toaster.pop('success', "提示", "操作成功！^_^");
	                  		        }
	                  		      }, function(x) {
	                  		    	  $scope.authError = 'Server Error';
	                  		    	  toaster.pop('error', "错误", $scope.authError);
	                  		      });
	                              $modalInstance.close();
	                            };
	                        }
	                    });
	      }
	    
}])
;