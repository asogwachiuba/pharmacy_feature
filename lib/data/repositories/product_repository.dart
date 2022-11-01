import '../models/product_model.dart';

abstract class ProductRepository {

  List<ProductModel> getAllProducts();

  List<ProductModel> getSelectedList(Category category);

  List<ProductModel>? searchResultForProduct();

  List<ProductModel> getSuggestions();

  Future init();
  void close();
}