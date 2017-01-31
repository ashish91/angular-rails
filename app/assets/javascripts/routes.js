$app.config(['$stateProvider', '$urlRouterProvider',
  function ($stateProvider, $urlRouterProvider) {
    $stateProvider
        .state('home', {
          url: '/home',
          templateUrl: 'home/_home.html',
          controller: 'HomeController',
          controllerAs: 'home',
          resolve: {
            products: function (ProductService) {
              return ProductService.all();
            }
          }
        });

    $urlRouterProvider.otherwise('home');
  }
]);