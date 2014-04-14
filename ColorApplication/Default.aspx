<!DOCTYPE html>
<html data-ng-app="colorApp">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Color Selection Application</title>
</head>
<body data-ng-controller="colorListCtrl">
    <div class="container">
        <div data-ng-switch on="selectionMade">
            <div data-ng-switch-when="false" class="page-header">
                <h1>Please select a favorite color</h1>
            </div>
        </div>
        <div class="page-header" data-ng-repeat="value in items| filter:{selected:true}">
            <h1>My favorite color is <span id="ng-change-font-color"  
                data-ng-style="{color: myColor}"
                style="text-shadow: -1px 0 lightgrey, 0 1px lightgrey, 1px 0 lightgrey, 0 -1px lightgrey;">{{ value.color }}</span></h1>
        </div>
        <div class="jumbotron">
            <div class="container box-sizing">
                Click on color selector to add a color
                <input 
                    type="color"
                    data-ng-model="colorInput"
                    data-ng-class="{colorSelector: true}"
                    id="ng-change-color"
                    check-duplicate-color 
                    existing-colors="items" />
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <ul class="list-group">
                            <li class="list-group-item"
                                style="background-color: {{ value.hexColor }}; color: {{ value.fontcolor }};"
                                data-ng-click="selectColor(value)"
                                data-ng-repeat="value in pagedItems[currentPage] | filter:{selected:false}">{{ value.color; }}</li>
                        </ul>
                    </div>
                </div>
                <div>{{ selectionComment }}</div>
                <div class="pagination pull-right">
                    <ul>
                        <li data-ng-class="{disabled: currentPage == 0}">
                            <a href="#" data-ng-click="prevPage()">« Prev</a>
                        </li>
                        <li data-ng-repeat="n in range(pagedItems.length)"
                            data-ng-class="{active: n == currentPage}"
                            data-ng-click="setPage()">
                            <a href="#" data-ng-bind="n + 1">1</a>
                        </li>
                        <li data-ng-class="{disabled: currentPage == pagedItems.length - 1}">
                            <a href="#" data-ng-click="nextPage()">Next »</a>
                        </li>
                    </ul>
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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.6/angular.min.js"></script>
    <!-- color converter script -->
    <script src="http://chir.ag/projects/ntc/ntc.js"></script>
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/css/bootstrap.no-icons.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/2.0/css/font-awesome.css" rel="stylesheet">
    <link href="Content/stickyfooter.css" rel="stylesheet" />
    <script src="Scripts/app.js"></script>
    <script src="Scripts/controllers.js"></script>
    <script src="Scripts/directives.js"></script>
</body>
</html>
