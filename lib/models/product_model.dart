class ProductModel {
  final String name;
  final String description;
  final String price;
  final String image;
  final String material;

  ProductModel(
    this.name,
    this.description,
    this.price,
    this.image,
    this.material,
  );

  factory ProductModel.fromJson(String supplier, Map json) {
    if (supplier == 'supplier1') {
      return ProductModel(
        json['nome'],
        json['descricao'],
        json['preco'],
        json['imagem'],
        json['material'],
      );
    } else {
      return ProductModel(
        json['name'],
        json['description'],
        json['price'],
        json['gallery'][0],
        json['details']['material'],
      );
    }
  }
}
