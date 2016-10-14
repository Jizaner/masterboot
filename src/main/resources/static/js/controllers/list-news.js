'use strict';

// signup controller
app.controller('ListNewsCtrl', ['$scope', '$http', '$state', '$filter',function($scope, $http, $state,$filter) {
   
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
		                return "<button onclick=\"angular.element(this).scope().editData("+row.id+")\"' class='btn btn-default'>编辑</button> <button onclick=\"angular.element(this).scope().delData("+row.id+")\" class='btn btn-danger'>删除</button>";
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
	        //bJQueryUI: true,
	        //bDestroy: true,
//	        data: [
//	            ["Webber", "Adam", "Adam", "Adam", "Adam"],["Webber", "Adam", "Adam", "Adam", "Adam"],["Webber", "Adam", "Adam", "Adam", "Adam"]
//	        ]
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
	        //var data = table.row( $(this).parents('tr') ).data();
	        //alert( data[0] +"'s salary is: "+ data[ 5 ] );
	    	alert(id);
	    };
	    
	    $scope.counter = 0;
	    
	    
  }])
 ;