
var colorApp = angular.module('colorApp', []);
 
colorApp.controller('colorListCtrl', ['$scope', '$http',
  function ($scope, $http) {
      $(".container").hide();
      $http.get('dataload/colors.json').success(function(data) {
          $scope.values = data;
      });
      $scope.selectionMade = "false";
      $scope.selectColor = function (color) {
          angular.forEach($scope.values, function (value, key) {
              value.selected = (value.color === color.color);
          });
          $scope.selectionMade = "true";
      };
      $(".container").show();
  }]);