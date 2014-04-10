<!DOCTYPE html>
<html ng-app="colorApp">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Color Selection Application</title>
</head>
<body data-ng-controller="colorListCtrl">
    <div class="container">
        <div ng-switch on="selectionMade">
            <div ng-switch-when="false" class="page-header">
                <h1>Please select a favorite color</h1> 
            </div>
        </div>
        <div class="page-header" data-ng-repeat="value in values| filter:{selected:true}">
            <h1>My favorite color is <span style="color: {{ value.color }};">{{ value.color }}</span></h1>
        </div>
        <div class="jumbotron">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <ul class="list-group" >
                            <li class="list-group-item" 
                                style="background-color: {{ value.color }}; color: {{ value.fontcolor }};" 
                                data-ng-click="selectColor(value)" 
                                data-ng-repeat="value in values| filter:{selected:false}">{{ value .color; }}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="footer">
        <div class="container">
            <p class="text-muted">Color Selection Application - Randal Wilcox 2014</p>
        </div>
    </div>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.6/angular.min.js"></script>
    <link href="Content/stickyfooter.css" rel="stylesheet" />
    <script src="Scripts/controller.js"></script>
</body>
</html>
