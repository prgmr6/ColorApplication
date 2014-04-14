'use strict';

/* Directives */

angular.module('colorApp.directives', [])
    .directive('checkDuplicateColor', function () {
        return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, element, attrs, ctrl) {
            scope.$watch(attrs.ngModel, function () {
                // check for existing color matches, don't add
                // if color already exists in collection.
                //scope.errorColorSelection = "base colors loaded.";
                var colors = scope.$eval(attrs.existingColors) || [];
                if (colors.length != 0) {
                    var model = scope.$eval(attrs.ngModel);
                    // object to retrieve the color name
                    // from the hex color
                    var n_match = ntc.name(model);
                    for (var i = 0; i < colors.length; i++) {
                        if (colors[i].hexColor.toUpperCase() === model.toUpperCase()) {
                            scope.selectionComment = n_match[1] + " is already in use.";
                            return;
                        }
                    }
                    scope.selectionComment = n_match[1] + " has been added.";
                    // check for light colors, make the font color
                    // darker for lighter colors, otherwise leave the
                    // font color black.
                    var fontColor = "#ffffff";
                    var b = function (h) {
                        return parseInt((cutHex(h)).substring(4, 6), 16);
                        function cutHex(t) {
                            return (t.charAt(0) == "#") ? t.substring(1, 7) : t;
                        };
                    };
                    // if luminosity is too light, make the font color
                    // dark.
                    if (b(model) > 200) {
                        fontColor = "#000000";
                    }
                    scope.items.push({
                        "color": n_match[1],
                        "hexColor": model,
                        "fontcolor": fontColor,
                        "selected": false
                    });
                    scope.lastPage();
                }
            });
        }
    }

});