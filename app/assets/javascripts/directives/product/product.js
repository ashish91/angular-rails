$app.directive('product', function() {
  return {
    restrict: 'E',
    templateUrl: 'directives/product/_product.html',
    scope: {
      product: '=',
      buttonText: '@',
      onSubmit: '&',
      onCancel: '&?'
    }
  }
});