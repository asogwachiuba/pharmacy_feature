import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/constants/custom_images.dart';
import 'package:pharmacy/data/models/product_model.dart';
import 'package:pharmacy/data/repositories_implementation/product_repository_implementation.dart';

void main() {
  group('Testing the [getAllProducts]method ', () {
    test('Testing if method returns the actual list', () {
      ProductRepositoryImplementation productRepImpl =
          ProductRepositoryImplementation();
      List<ProductModel> result = productRepImpl.getAllProducts();
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
            name: 'Emzor Paracetamol',
            amountOfGrams: '1.5g',
            productForm: 'Tablets',
            constituents: 'Paracetamol',
            dispenseMode: 'No idea',
            imgUrl: CustomImagesUrl.emzorParacetamol,
            manufacturerImgUrl: 'manufacturerImgUrl',
            manufacturerName: 'manufacturerName',
            price: 100,
            productId: '123',
            noOfTabletsPerColumn: 6,
            noOfTabletsPerRow: 10,
            category: Category.headache),
        ProductModel(
            name: 'Paracetamol R',
            amountOfGrams: '1000mg',
            productForm: 'Tablets',
            constituents: 'Paracetamol',
            dispenseMode: 'No idea',
            imgUrl: CustomImagesUrl.paracetamolR,
            manufacturerImgUrl: 'manufacturerImgUrl',
            manufacturerName: 'manufacturerName',
            price: 800,
            productId: '1293',
            noOfTabletsPerColumn: 6,
            noOfTabletsPerRow: 8,
            category: Category.headache),
        ProductModel(
            name: 'Panadol',
            amountOfGrams: '150mg',
            productForm: 'Tablets',
            constituents: 'Panadol',
            dispenseMode: 'No idea',
            imgUrl: CustomImagesUrl.panadolS,
            manufacturerImgUrl: 'manufacturerImgUrl',
            manufacturerName: 'manufacturerName',
            price: 5000,
            productId: '12983',
            noOfTabletsPerColumn: 6,
            noOfTabletsPerRow: 4,
            category: Category.headache),
        ProductModel(
            name: 'Doliprane',
            amountOfGrams: '1000mg',
            productForm: 'Capsule',
            constituents: 'Doliprane',
            dispenseMode: 'No idea',
            imgUrl: CustomImagesUrl.doliprane,
            manufacturerImgUrl: 'manufacturerImgUrl',
            manufacturerName: 'manufacturerName',
            price: 3500,
            productId: '1231',
            noOfTabletsPerColumn: 9,
            noOfTabletsPerRow: 10,
            category: Category.infants),
        ProductModel(
            name: 'Ibuprofen',
            amountOfGrams: '200mg',
            productForm: 'Capsule',
            constituents: 'Ibuprofen',
            dispenseMode: 'No idea',
            imgUrl: CustomImagesUrl.ibuprofen200,
            manufacturerImgUrl: 'manufacturerImgUrl',
            manufacturerName: 'manufacturerName',
            price: 1800,
            productId: '12312',
            noOfTabletsPerColumn: 9,
            noOfTabletsPerRow: 10,
            category: Category.supplements),
        ProductModel(
            name: 'Ibuprofen',
            amountOfGrams: '400mg',
            productForm: 'Capsule',
            constituents: 'Ibuprofen',
            dispenseMode: 'No idea',
            imgUrl: CustomImagesUrl.ibuprofen400,
            manufacturerImgUrl: 'manufacturerImgUrl',
            manufacturerName: 'manufacturerName',
            price: 1200,
            productId: '12312',
            noOfTabletsPerColumn: 9,
            noOfTabletsPerRow: 7,
            category: Category.supplements),
      ];

      expect(result, matcher);
    });

    test('Checks if it returns an empty list', () {
      ProductRepositoryImplementation productRepImpl =
          ProductRepositoryImplementation();
      List<ProductModel> result = productRepImpl.getAllProducts();
      List<ProductModel> matcher = [];

      expect(result, isNot(matcher));
    });
  });

  group('Testing the [getSelectedList]method', () {
    test('Testing method returning the lists of products in headache category',
        () {
      ProductRepositoryImplementation productRepImpl =
          ProductRepositoryImplementation();
      List<ProductModel> result =
          productRepImpl.getSelectedList(Category.headache);
      List<ProductModel> matcher = productRepImpl.listOfHeadacheProducts;

      expect(result, matcher);
    });

    test('Testing method returning the lists of products in cough category',
        () {
      ProductRepositoryImplementation productRepImpl =
          ProductRepositoryImplementation();
      List<ProductModel> result =
          productRepImpl.getSelectedList(Category.cough);
      List<ProductModel> matcher = productRepImpl.listOfCoughProducts;

      expect(result, matcher);
    });
    test(
        'Testing method returning the lists of products in supplement category',
        () {
      ProductRepositoryImplementation productRepImpl =
          ProductRepositoryImplementation();
      List<ProductModel> result =
          productRepImpl.getSelectedList(Category.supplements);
      List<ProductModel> matcher = productRepImpl.listOfSupplementsProducts;

      expect(result, matcher);
    });

    test('Testing method returning the lists of products in infants category',
        () {
      ProductRepositoryImplementation productRepImpl =
          ProductRepositoryImplementation();
      List<ProductModel> result =
          productRepImpl.getSelectedList(Category.infants);
      List<ProductModel> matcher = productRepImpl.listOfInfantsProducts;

      expect(result, matcher);
    });
  });

  group(
      'Testing the [searchForProduct]method in the [productImplementationClass]',
      () {
    test(
        'Checks if it returns a list of corresponding products from a complete search keyword',
        () {
      ProductRepositoryImplementation productRepImpl =
          ProductRepositoryImplementation();
      productRepImpl.updateSearchKeyword('paracetamol');
      List<ProductModel>? result =
          productRepImpl.searchResultForProduct();
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
            name: 'Emzor Paracetamol',
            amountOfGrams: '1.5g',
            productForm: 'Tablets',
            constituents: 'Paracetamol',
            dispenseMode: 'No idea',
            imgUrl: CustomImagesUrl.emzorParacetamol,
            manufacturerImgUrl: 'manufacturerImgUrl',
            manufacturerName: 'manufacturerName',
            price: 100,
            productId: '123',
            noOfTabletsPerColumn: 6,
            noOfTabletsPerRow: 10,
            category: Category.headache),
        ProductModel(
            name: 'Paracetamol R',
            amountOfGrams: '1000mg',
            productForm: 'Tablets',
            constituents: 'Paracetamol',
            dispenseMode: 'No idea',
            imgUrl: CustomImagesUrl.paracetamolR,
            manufacturerImgUrl: 'manufacturerImgUrl',
            manufacturerName: 'manufacturerName',
            price: 800,
            productId: '1293',
            noOfTabletsPerColumn: 6,
            noOfTabletsPerRow: 8,
            category: Category.headache),
      ];

      expect(result, matcher);
    });

    test(
        'Checks if it returns a list of products from an incomplete search keyword',
        () {
      ProductRepositoryImplementation productRepImpl =
          ProductRepositoryImplementation();
      productRepImpl.updateSearchKeyword('dol');
      List<ProductModel>? result = productRepImpl.searchResultForProduct();
      List<ProductModel> matcher = [
        ProductModel(
            name: 'Panadol',
            amountOfGrams: '150mg',
            productForm: 'Tablets',
            constituents: 'Panadol',
            dispenseMode: 'No idea',
            imgUrl: CustomImagesUrl.panadolS,
            manufacturerImgUrl: 'manufacturerImgUrl',
            manufacturerName: 'manufacturerName',
            price: 5000,
            productId: '12983',
            noOfTabletsPerColumn: 6,
            noOfTabletsPerRow: 4,
            category: Category.headache),
        ProductModel(
            name: 'Doliprane',
            amountOfGrams: '1000mg',
            productForm: 'Capsule',
            constituents: 'Doliprane',
            dispenseMode: 'No idea',
            imgUrl: CustomImagesUrl.doliprane,
            manufacturerImgUrl: 'manufacturerImgUrl',
            manufacturerName: 'manufacturerName',
            price: 3500,
            productId: '1231',
            noOfTabletsPerColumn: 9,
            noOfTabletsPerRow: 10,
            category: Category.infants),
      ];

      expect(result, matcher);
    });

    test(
        'Checks if it returns an empty list of products from an search keyword without corresponding products',
        () {
      ProductRepositoryImplementation productRepImpl =
          ProductRepositoryImplementation();
      productRepImpl.updateSearchKeyword('pharmacy');
      List<ProductModel>? result = productRepImpl.searchResultForProduct();
      List<ProductModel> matcher = [];

      expect(result, matcher);
    });
  });
}
