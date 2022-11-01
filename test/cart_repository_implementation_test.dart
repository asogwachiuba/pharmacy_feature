import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/constants/custom_images.dart';
import 'package:pharmacy/data/models/product_model.dart';
import 'package:pharmacy/data/repositories_implementation/cart_repository_implementation.dart';

void main() {
  group('Testing the [addProductToCart]method ', () {
    test('Testing if method returns the list of a newly added item', () {
      CartRepositoryImplementation cartRepImpl = CartRepositoryImplementation();
      cartRepImpl.addProductToCart(
        ProductModel(
            name: 'Paracetamol Red',
            amountOfGrams: '500mg',
            productForm: 'Tablets',
            constituents: 'Paracetamol',
            dispenseMode: 'No idea',
            imgUrl: CustomImagesUrl.paracetamol,
            manufacturerImgUrl: 'manufacturerImgUrl',
            manufacturerName: 'manufacturerName',
            price: 100.50,
            productId: '123456',
            noOfTabletsPerColumn: 8,
            noOfTabletsPerRow: 12,
            category: Category.headache),
      );
      List<ProductModel>? result = cartRepImpl.cartList;
      List<ProductModel> matcher = [
        ProductModel(
            name: 'Paracetamol Red',
            amountOfGrams: '500mg',
            productForm: 'Tablets',
            constituents: 'Paracetamol',
            dispenseMode: 'No idea',
            imgUrl: CustomImagesUrl.paracetamol,
            manufacturerImgUrl: 'manufacturerImgUrl',
            manufacturerName: 'manufacturerName',
            price: 100.50,
            productId: '123456',
            noOfTabletsPerColumn: 8,
            noOfTabletsPerRow: 12,
            category: Category.headache),
      ];

      expect(result, matcher);
    });

    test(
        'Testing if method returns the list of previous(from first test) and currently added item to the [cartList]',
        () {
      CartRepositoryImplementation cartRepImpl = CartRepositoryImplementation();
      cartRepImpl.addProductToCart(
        ProductModel(
            name: 'Panadol Emzor',
            amountOfGrams: '500mg',
            productForm: 'Tablets',
            constituents: 'Paracetamol',
            dispenseMode: 'No idea',
            imgUrl: CustomImagesUrl.paracetamol,
            manufacturerImgUrl: 'manufacturerImgUrl',
            manufacturerName: 'manufacturerName',
            price: 100.50,
            productId: '123456',
            noOfTabletsPerColumn: 8,
            noOfTabletsPerRow: 12,
            category: Category.headache),
      );
      List<ProductModel>? result = cartRepImpl.cartList;
      List<ProductModel> matcher = [
        ProductModel(
            name: 'Paracetamol Red',
            amountOfGrams: '500mg',
            productForm: 'Tablets',
            constituents: 'Paracetamol',
            dispenseMode: 'No idea',
            imgUrl: CustomImagesUrl.paracetamol,
            manufacturerImgUrl: 'manufacturerImgUrl',
            manufacturerName: 'manufacturerName',
            price: 100.50,
            productId: '123456',
            noOfTabletsPerColumn: 8,
            noOfTabletsPerRow: 12,
            category: Category.headache),
        ProductModel(
            name: 'Panadol Emzor',
            amountOfGrams: '500mg',
            productForm: 'Tablets',
            constituents: 'Paracetamol',
            dispenseMode: 'No idea',
            imgUrl: CustomImagesUrl.paracetamol,
            manufacturerImgUrl: 'manufacturerImgUrl',
            manufacturerName: 'manufacturerName',
            price: 100.50,
            productId: '123456',
            noOfTabletsPerColumn: 8,
            noOfTabletsPerRow: 12,
            category: Category.headache),
      ];

      expect(result, matcher);
    });
  });

  group('Testing the [removeProductFromCart]method ', () {
    test(
        'Testing if method removes items added from the previous test with same product Id from [cartList]',
        () {
      CartRepositoryImplementation cartRepImpl = CartRepositoryImplementation();
      cartRepImpl.removeProductFromCart('123456');
      List<ProductModel>? result = cartRepImpl.cartList;
      List<ProductModel> matcher = [];

      expect(result, matcher);
    });

    test('Checking methods behaviour if removing from an empty list', () {
      CartRepositoryImplementation cartRepImpl = CartRepositoryImplementation();
      cartRepImpl.removeProductFromCart('123456');
      List<ProductModel>? result = cartRepImpl.cartList;
      List<ProductModel> matcher = [];

      expect(result, matcher);
    });
  });

  test('Checking [getList] method if it returns cartList', () {
    CartRepositoryImplementation cartRepImpl = CartRepositoryImplementation();
    cartRepImpl.addProductToCart(ProductModel(
        name: 'Panadol Emzor',
        amountOfGrams: '500mg',
        productForm: 'Tablets',
        constituents: 'Paracetamol',
        dispenseMode: 'No idea',
        imgUrl: CustomImagesUrl.paracetamol,
        manufacturerImgUrl: 'manufacturerImgUrl',
        manufacturerName: 'manufacturerName',
        price: 100.50,
        productId: '123456',
        noOfTabletsPerColumn: 8,
        noOfTabletsPerRow: 12,
        category: Category.headache));

    List<ProductModel>? result = cartRepImpl.getList();
    List<ProductModel>? matcher = cartRepImpl.cartList;
    expect(result, matcher);
  });

  group('Testing the [updateProductItemCount] method ', () {
    test('Testing if method updates product number of items from [cartList]',
        () {
      CartRepositoryImplementation cartRepImpl = CartRepositoryImplementation();
      // cartRepImpl.addProductToCart(ProductModel(
      //     name: 'Panadol Emzor',
      //     amountOfGrams: '500mg',
      //     productForm: 'Tablets',
      //     constituents: 'Paracetamol',
      //     dispenseMode: 'No idea',
      //     imgUrl: CustomImagesUrl.paracetamol,
      //     manufacturerImgUrl: 'manufacturerImgUrl',
      //     manufacturerName: 'manufacturerName',
      //     price: 100.50,
      //     productId: '123456',
      //     noOfTabletsPerColumn: 8,
      //     noOfTabletsPerRow: 12,
      //     category: Category.headache));
      String productId = '123456';
      int? matcher = cartRepImpl.cartList
          ?.singleWhere((element) => element.productId == productId)
          .noOfItemsInCart;
      cartRepImpl.updateProductItemCount(productId, 5);
      int? result = cartRepImpl.cartList
          ?.singleWhere((element) => element.productId == productId)
          .noOfItemsInCart;

      expect(result, isNot(matcher));
    });

    test('Testing if method updates product number of items from [cartList]',
        () {
      CartRepositoryImplementation cartRepImpl = CartRepositoryImplementation();

      /// [cartList] is a static list so the previous item added from the previous test is still being used
      String productId = '123456';
      cartRepImpl.updateProductItemCount(productId, 8);
      int? result = cartRepImpl.cartList
          ?.singleWhere((element) => element.productId == productId)
          .noOfItemsInCart;

      int matcher = 8;
      cartRepImpl.removeProductFromCart(productId);
      expect(result, matcher);
    });
  });
}
