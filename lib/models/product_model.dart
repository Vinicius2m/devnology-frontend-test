class ProductModel {
  late String productId = '';
  final String name;
  final String description;
  final String price;
  final String image;
  final String material;

  ProductModel(
    this.productId,
    this.name,
    this.description,
    this.price,
    this.image,
    this.material,
  );

  factory ProductModel.fromJson(String supplier, Map json) {
    if (supplier == 'supplier1') {
      return ProductModel(
        '',
        json['nome'],
        json['descricao'],
        json['preco'],
        json['imagem'],
        json['material'],
      );
    }
    if (supplier == 'supplier2') {
      return ProductModel(
        '',
        json['name'],
        json['description'],
        json['price'],
        json['gallery'][1],
        json['details']['material'],
      );
    } else {
      return ProductModel(
        json['product_id'],
        json['name'],
        json['description'],
        json['price'],
        json['image'],
        json['material'],
      );
    }
  }

  Map toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'material': material
    };
  }
}
