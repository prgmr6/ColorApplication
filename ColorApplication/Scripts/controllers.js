'use strict';

/* Controllers */

angular.module('colorApp.controllers', [])
  .controller('colorListCtrl', ['$scope', '$filter', '$http',
      function ($scope, $filter, $http) {
          $scope.selectionMade = "false";
          $scope.myColor = "Red";
          $scope.colorInput = "#000000";
          $scope.selectionComment = "";
          $scope.reverse = false;
          $scope.filteredItems = [];
          $scope.groupedItems = [];
          $scope.itemsPerPage = 5;
          $scope.query = false;
          $scope.pagedItems = [];
          $scope.currentPage = 0;
          $http.get('dataload/colors.json').success(function (data) {
              var arr = [];
              $scope.items = data;
              angular.forEach($scope.items, function (value, key) {
                  arr.push(value.color);
              });
              $scope.checkUnique(arr);
              $scope.search();
          });
          $scope.selectColor = function (color) {
              $scope.errorColorSelection = "";
              angular.forEach($scope.items, function (value, key) {
                  value.selected = (value.color === color.color);
                  if (value.selected)
                       $scope.myColor = value.hexColor;
              });
              $scope.selectionMade = "true";
              $scope.search();
          };
          $scope.checkUnique = function (array) {
              var map = {}, i, size;
              for (i = 0, size = array.length; i < size; i++) {
                  if (map[array[i]]) {
                      $scope.items.splice(i, 1);
                 }
                 map[array[i]] = true;
              }
          };
          $scope.prevPage = function () {
              if ($scope.currentPage > 0) {
                  $scope.currentPage--;
              }
          };
          $scope.lastPage = function () {
              $scope.search();
              $scope.currentPage = $scope.pagedItems.length - 1;
          };
          $scope.range = function (start, end) {
              var ret = [];
              if (!end) {
                  end = start;
                  start = 0;
              }
              for (var i = start; i < end; i++) {
                  ret.push(i);
              }
              return ret;
          };
          $scope.nextPage = function () {
              if ($scope.currentPage < $scope.pagedItems.length - 1) {
                  $scope.currentPage++;
              }
          };
          $scope.search = function () {
              $scope.filteredItems = $filter('filter')($scope.items, function (item) {
                  for (var attr in item) {
                      return !item.selected;
                  }
              });
              $scope.groupToPages();
          };
          $scope.setPage = function () {
              $scope.currentPage = this.n;
          };
          // calculate page in place
          $scope.groupToPages = function () {
              $scope.pagedItems = [];
              for (var i = 0; i < $scope.filteredItems.length; i++) {
                  if (i % $scope.itemsPerPage === 0) {
                      $scope.pagedItems[Math.floor(i / $scope.itemsPerPage)] = [$scope.filteredItems[i]];
                  } else {
                      $scope.pagedItems[Math.floor(i / $scope.itemsPerPage)].push($scope.filteredItems[i]);
                  }
              }
          };
      }]);