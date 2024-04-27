import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/widgets/api.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategory({required String categoryName}) async {
    List jsonData = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> data = [];
    for (var i = 0; i < jsonData.length; i++) {
      data.add(ProductModel.fromJson(jsonData[i]));
    }
    return data;
  }
}
