json.products @products.each do |product|
  json.partial! 'products/product', product: product
end