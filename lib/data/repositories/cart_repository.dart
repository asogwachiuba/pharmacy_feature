import '../models/product_model.dart';

abstract class CartRepository {

  List<ProductModel>? getList();

  void removeProductFromCart(String productId);

  void addProductToCart(ProductModel product);

  void updateProductItemCount(String productId,int numberOfItems);

  Future init();
  void close();
}