import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/widgets/api.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List jsonData = await Api().get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> data = [];
    for (var i = 0; i < jsonData.length; i++) {
      data.add(ProductModel.fromJson(jsonData[i]));
    }
    return data;
  }
}
