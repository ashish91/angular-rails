$app.factory('ProductService',[ '$http',
  function($http){
    return {
      all: function() {
        return $http.get('/products.json')
            .then(function(data){
              return data;
            }, function(error) {
              console.log(error);
              return error;
            })
      },
      create: function(product) {
        return $http.post('/products.json', product)
            .then(function(data){
              return data;
            }, function(error) {
              console.log(error);
              return error;
            })
      },
      update: function(id, product) {
        return $http.put('/products/' + id + '.json', product)
            .then(function(data){
              return data;
            }, function(error) {
              console.log(error);
              return error;
            })
      },
      delete: function(id) {
        return $http.delete('/products/' + id + '.json')
            .then(function(data){
              return data;
            }, function(error) {
              console.log(error);
              return error;
            })
      }
    }
  }
]);