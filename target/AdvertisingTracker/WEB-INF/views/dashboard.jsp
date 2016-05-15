<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>  
    <title>Yume- Ad Tracker</title>
    <style type="text/css">
		span.head{
			font-size: 27px;
			display: block;
		}
		span.small_text{
			font-size: 12px;
			color: black;
		}
		span.highlighted_color{
			color:#00FFFF;
		}
		span.lessLineHeight{
			line-height:80%;
		}
		
	</style>  
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	 <script src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>
     <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
     <meta charset="utf-8">
  	 <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body ng-app="myApp" class="ng-cloak">
      <div class="generic-container container-fluid" ng-controller="DashboardController as ctrl">
         <div class="panel marker"  style="background: #000; color: #FFF;">
              <div class="row">
			  	<div class="col-md-9">
					<img src="http://www.yume.com/sites/all/themes/yume/logo.png" class="img-thumbail" alt="YuMe" title="YuMe" width="60" height="20">
				</div>
				<div class="col-md-3 pull-right">
					<span class="pull-right" style="margin-right: 5px;">
						<img src="http://www.yume.com/sites/all/themes/yume/logo.png" class="img-thumbail" alt="Cinque Terre" width="60" height="20">
					</span>
  					<span class="pull-right" style="margin-right: 5px;">
  						John Snow
  					</span>
  					<span class="pull-right" style="margin-right: 5px;">
  						Accuen
  					</span>
				</div>
			  </div>
		</div>
		<div class="panel row">
            <div class="col-md-12">
  				<a href="#" class="btn btn-primary btn-sm pull-right">
         			 <span class="glyphicon glyphicon-plus"></span> INSERTION ORDERS
        		</a>
  				<span class="pull-left"><b>Insertion Orders</b></span>  
  			</div>
        </div>
		<div class="panel row " style="margin-top: 50px">
			<div class="col-sm-6">
				<input type="text" placeholder="search insert orders..." ng-model="searchKeyword" class="form-control ng-pristine ng-untouched ng-valid">
			</div>
			<div class="col-md-6">
				<div class="btn-group pull-right">
					<button type="button" class="btn btn-primary ">Timeline</button>
					<button type="button" class="btn btn-primary">List</button>
				</div>
				<div class="btn-group pull-right" style="margin-right: 20px;">
					<button type="button" class="btn btn-primary">Quarter</button>
					<button type="button" class="btn btn-primary">Month</button>
					<button type="button" class="btn btn-primary">Year</button>
				</div>
			</div>		
		</div>      
		<div class="table-row" style="margin-top: 90px">
			<div class="today">
				<div class="marker">Today</div>
				<div class="line"></div>
			</div>
			<div class="check"></div>
			<div class="name">Name</div>
			<div class="day">
				<span ng-bind="ctrl.getDateText(-3)"></span>
			</div>
			<div class="day">
				<span ng-bind="ctrl.getDateText(-2)"></span>
			</div>
			<div class="day no-border">
				<span ng-bind="ctrl.getDateText(-1)"></span>
			</div>
			<div class="day">
				<span ng-bind="ctrl.getDateText(0)"></span>
			</div>
			<div class="day">
				<span ng-bind="ctrl.getDateText(1)"></span>
			</div>
			<div class="day">
				<span ng-bind="ctrl.getDateText(2)"></span>
			</div>
			<div class="day">
				<span ng-bind="ctrl.getDateText(3)"></span>
			</div>
			<div class="completion"> % of goal</div>
		</div>
		<div class="tbody" ng-repeat="advertisement in ctrl.advertisements  | filter: searchKeyword" >
			<div class="table-row  tbody">
				<div class="today"></div>
				<div class="check"><input type="radio" ng-model="$parent.showDetails" value="{{advertisement.id}}"></div>
				<div class="name" ng-click="$parent.showDetails=advertisement.id">
					<span ng-bind="advertisement.name" style="color:#00FFFF" ></span>
				</div>
				<div class="day-all">
					<div class="comp1" style="width:{{advertisement.totalBarLength}}%; margin-left:{{advertisement.startingPoint}}%">
						<div class="comp2" style="width:{{advertisement.goal}}%"></div>
					</div>
				</div>
				<div class="day"></div>
				<div class="day"></div>
				<div class="day no-border"></div>
				<div class="day"></div>
				<div class="day"></div>
				<div class="day"></div>
				<div class="day"></div>
				<div class="completion">
					<meter value="{{advertisement.goal}}" min="0" max="100"></meter>
					<span ng-bind="advertisement.goal" ></span> % of goal
				</div>
			</div>
			<div class="panel panel-default"  ng-show="$parent.showDetails == advertisement.id">
				<div class="row" style="background: #EEE;">
					<div id="chart{{advertisement.id}}" class="col-md-4" style="height:150px; margin-top: 10px; ">
						<span ng-bind="ctrl.charting(advertisement.id)"></span>
					</div>
					
					<div class="col-md-8" style="margin-top: 5px;">
						<div class="row" style="margin-top: 5px;">
							<div class="col-md-8" style="margin-top: 5px;">
								<span class="head highlighted_color lessLineHeight" ng-bind="advertisement.advertiser.name"></span>
								<span class="small_text">Advertiser</span>
							</div>
							<div class="col-md-4" style="margin-top: 5px;">
								<button class="btn bt-primary">Edit</button>
								<button class="btn bt-default">Explore</button>
							</div>
						</div>
						<div class="row" style="margin-top: 100px;">
							<div class="col-md-2">
								<span class="head highlighted_color lessLineHeight"><span ng-bind="advertisement.impressions"></span></span>
								<span class="small_text">Impressions</span>
							</div>
							<div class="col-md-2">
								<span class="head highlighted_color lessLineHeight" ><span ng-bind="advertisement.vcr"></span></span>
								<span class="small_text">VCR</span>
							</div>
							<div class="col-md-2">
								<span class="head highlighted_color lessLineHeight"><span ng-bind="advertisement.goal"></span></span>
								<span class="small_text">Of Goal</span>
							</div>
							<div class="col-md-2">
								<span class="head highlighted_color lessLineHeight"><span ng-bind="advertisement.cpm"></span></span>
								<span class="small_text">CPM</span>
							</div>
							<div class="col-md-2" >
								<span class="head highlighted_color lessLineHeight"><span ng-bind="advertisement.cpr"></span></span>
								<span class="small_text">CTR</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
     </div>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular-resource.js"></script>
      <script src="<c:url value='/static/js/app.js' />"></script>
      <script src="<c:url value='/static/js/service/dashboard_service.js' />"></script>
      <script src="<c:url value='/static/js/controller/dashboard_controller.js' />"></script>
  </body>
</html>