'use strict';

/* Filters */
// need load the moment.js to use this filter. 
angular.module('app')
  .filter('fromNow', function() {
	  return function(dateString, format) {
	        return moment(dateString).format(format);
	    };
//    return function(date,k) {
//      return moment(k).format('YYYY-MM-DD');//moment(date).fromNow();
//    }
  });