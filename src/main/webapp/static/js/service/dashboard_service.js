'use strict';


App.service('advertisingService', ['$http', function($http){

	var config = { 
			headers : {'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'}
			}
	var data ="";
    var fullPullUrl = "advertisements";
	
	this.fetchAllAdvertisements = function(success, failure){
		$http.get(fullPullUrl, data, config)
        .success(function (data, status, headers, config) { 
        	success(data);
           })
        .error(function (data, status, header, config) {
        	failure(status);
        });
		
	}
	
}])




