$app.controller('HomeController', ['ProductService', 'products',
  function(ProductService, products){
    var self = this;

    (function initialize(){
      // Extend Properties
      angular.extend(self, {
        products: products.data.products
      });
      // Extend Functions
      angular.extend(self, {
        addProduct: addProduct,
        editProduct: editProduct,
        updateProduct: updateProduct,
        deleteProduct: deleteProduct,
        isEditing: isEditing,
        onCancel: onCancel
      });
      initProduct();
    })();

    function addProduct() {
      console.log(self.newProduct);
      ProductService.create(self.newProduct)
          .then(function(response) {
            self.products.push(response.data);
          });
      initProduct();
    }

    function editProduct(index) {
      angular.copy(self.products[index], self.tempProduct);
      self.editIndex = index;
    }

    function updateProduct(index) {
      ProductService.update(self.products[index].id, self.products[index])
          .then(function(_) {
            initProduct();
          }, function(error) {
            self.onCancel(index);
          });
    }

    function deleteProduct(index) {
      ProductService.delete(self.products[index].id)
          .then(function(_) {
            self.products.splice(index, 1);
          });
    }

    function isEditing(index) {
      return self.editIndex == index;
    }

    function onCancel(index) {
      angular.copy(self.tempProduct, self.products[index]);
      initProduct();
    }

    // private function
    function initProduct() {
      angular.extend(self, {
        newProduct: {
          name: '',
          description: '',
          price: ''
        },
        tempProduct: {
          name: '',
          description: '',
          price: ''
        },
        editIndex: -1
      });
    }

    return self;
  }
]);