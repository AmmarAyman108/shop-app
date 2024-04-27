import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/widgets/api.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category,
      required int id,
      Rating? rating}) async {
    Map<String, dynamic> jsonData = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category
      },
      token: null,
    );
    return ProductModel.fromJson(jsonData);
  }
}
