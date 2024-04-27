class ProductModel {
  dynamic id;
  String title, description, category, image;
  // ignore: prefer_typing_uninitialized_variables
  dynamic price;
  Rating? rating;
  ProductModel({
    required this.category,
    required this.description,
    required this.id,
    required this.image,
    required this.price,
    // required this.rating,
    required this.title,
  });
  factory ProductModel.fromJson(json) {
    return ProductModel(
        category: json['category'],
        description: json['description'],
        id: json['id'],
        image: json['image'],
        price: json['price'],
        // rating: Rating.fromJson(json['rating']),
        title: json['title']);
  }
}

class Rating {
  int count;
  // ignore: prefer_typing_uninitialized_variables
  var rate;
  Rating({
    required this.count,
    required this.rate,
  });
  factory Rating.fromJson(json) {
    return Rating(
      count: json['count'],
      rate: json['rate'],
    );
  }
}
