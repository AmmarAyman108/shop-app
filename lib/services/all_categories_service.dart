import 'package:shop_app/widgets/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
