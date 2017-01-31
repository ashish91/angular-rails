$app.config(['$stateProvider', '$urlRouterProvider', '$locationProvider',
  function ($stateProvider, $urlRouterProvider, $locationProvider) {
    $locationProvider.hashPrefix('');
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