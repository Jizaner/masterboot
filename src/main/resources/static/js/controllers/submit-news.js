'use strict';

// signup controller
app.controller('FormNewsCtrl', ['$scope','toaster', '$http', '$state', function($scope,toaster, $http, $state) {
	//init varibles
	//$scope.news=[];
	//$scope.news.readnum=parseInt(Math.random()*10+1);
	$scope.selectedItems = [] ;  //声明变量
	$scope.toaster = {
	        type: 'success',
	        title: 'Title',
	        text: 'Message'
	    };
	$http.post('app/tag/list?_='+new Date().getTime(),{cache: false}).success( function(response) {
        $scope.tags = response;
      });
	//actions
	$scope.isChecked = function(id){  
	        return $scope.selectedItems.indexOf(id) >= 0 ;  
	  } ;  
	$scope.updateSelection = function($event,id,title){  
	        var checkbox = $event.target ;  
	        var checked = checkbox.checked ;  
	        if(checked){  
	            $scope.selectedItems.push(title) ;  
	        }else{  
	            var idx = $scope.selectedItems.indexOf(title) ;  
	            $scope.selectedItems.splice(idx,1) ;  
	        }  
	    } ;

	toaster.pop($scope.toaster.type, $scope.toaster.title, $scope.toaster.text);
    $scope.authError = null;
    $scope.submitdata = function() {
      $scope.authError = null;
      // Try to create
      console.log($scope.selectedItems);
      var tagsArr=$scope.selectedItems;
      if(!$scope.selectedItems||$scope.selectedItems==""){
    	  $scope.news.tags="";
      }else{
    	  $scope.news.tags=tagsArr.join("|");
      }
      $http.post('app/news/new', $scope.news)
      .then(function(response) {
    	if ( !response.data.code || response.data.code!=200) {
    		$scope.authError = response;
    		toaster.pop($scope.toaster.type, '失败', $scope.authError);
        }else{
        	toaster.pop('success', '提示', '操作成功！');
            $state.go('app.form.news');
        }
      }, function(x) {
    	  $scope.authError = 'Server Error';
    	  toaster.pop('error', '错误', $scope.authError);
      });
    };
  }])
 ;