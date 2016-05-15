'use strict';

App.controller('DashboardController', ['$scope', 'advertisingService', function($scope, advertisingService) {
          
		  var dashboard = this;
          dashboard.showDetails = "";
          dashboard.searchKeyword="";
          
          dashboard.advertisements=[];
          dashboard.fetchAllAdvertisements = function(){
        	  dashboard.advertisements = advertisingService.fetchAllAdvertisements(
        		function success(allAdvertisements){
        			if(allAdvertisements.length > 0){
        				dashboard.advertisements = allAdvertisements;
    				}
        		}, 
        		function failure(status){
        			alert("Webservice call failure");
        		}
        	  );
          };
          
          dashboard.getDateText = function(noOfDays){
        	  var month = new Array();
  				  month[0] = "January";
  		          month[1] = "February";
                  month[2] = "March";
                  month[3] = "April";
                  month[4] = "May";
                  month[5] = "June";
                  month[6] = "July";
                  month[7] = "August";
                  month[8] = "September";
                  month[9] = "October";
                  month[10] = "November";
                  month[11] = "December";
        	  var today=new Date(); //Today's Date
  			var requiredDate=new Date(today.getFullYear(),today.getMonth(),today.getDate()+noOfDays);
  			return (requiredDate.getDate() + " " + month[requiredDate.getMonth()]);
          }
          
          
          dashboard.charting = function(containerName){
        	  	var chart = new CanvasJS.Chart('chart'+ containerName,
        		    {
        		      title:{
        		      text: "Advertisement Performance"  
        		      },
        		      data: [
        		      {        
        		        type: "line",
        		        dataPoints: [
        		        { x: 10, y: 21 },{ x: 20, y: 25},
        		        { x: 30, y: 20 },{ x: 40, y: 25 },
        		        { x: 50, y: 27 },{ x: 60, y: 28 },
        		        { x: 70, y: 28 },{ x: 80, y: 24 },
        		        { x: 90, y: 26}
        		        ]
        		      },
        		        {        
        		        type: "line",
        		        dataPoints: [
        		        { x: 10, y: 31 },{ x: 20, y: 35},
        		        { x: 30, y: 30 },{ x: 40, y: 35 },
        		        { x: 50, y: 35 },{ x: 60, y: 38 },
        		        { x: 70, y: 38 },{ x: 80, y: 34 },
        		        { x: 90, y: 44}
        		        ]
        		      },
        		      ]
        		    });

        		    chart.render();
        		   
          	}
          
          
          
          dashboard.fetchAllAdvertisements();
      }]);
