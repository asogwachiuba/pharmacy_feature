import 'package:flutter/material.dart';
import 'package:pharmacy/constants/custom_images.dart';
import 'package:pharmacy/data/repositories/product_repository.dart';

import '../models/product_model.dart';

class ProductRepositoryImplementation extends ProductRepository
    with ChangeNotifier {
  /// Creates a single instance of the list of various categories of product
  static final _listOfHeadacheProducts = <ProductModel>[
    ProductModel(
        name: 'Paracetamol Red',
        amountOfGrams: '500mg',
        productForm: 'Tablets',
        constituents: 'Paracetamol',
        dispenseMode: 'No idea',
        imgUrl: CustomImagesUrl.paracetamol,
        manufacturerImgUrl: CustomImagesUrl.emzorParacetamol,
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
        manufacturerImgUrl: CustomImagesUrl.emzorParacetamol,
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
        manufacturerImgUrl: CustomImagesUrl.emzorParacetamol,
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
        manufacturerImgUrl: CustomImagesUrl.panadolS,
        manufacturerName: 'manufacturerName',
        price: 5000,
        productId: '12983',
        noOfTabletsPerColumn: 6,
        noOfTabletsPerRow: 4,
        category: Category.headache),
  ];
  static final _listOfSupplementsProducts = <ProductModel>[
    ProductModel(
        name: 'Ibuprofen',
        amountOfGrams: '200mg',
        productForm: 'Capsule',
        constituents: 'Ibuprofen',
        dispenseMode: 'No idea',
        imgUrl: CustomImagesUrl.ibuprofen200,
        manufacturerImgUrl: CustomImagesUrl.ibuprofen400,
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
        manufacturerImgUrl: CustomImagesUrl.panadolS,
        manufacturerName: 'manufacturerName',
        price: 1200,
        productId: '12312',
        noOfTabletsPerColumn: 9,
        noOfTabletsPerRow: 7,
        category: Category.supplements),
  ];
  static final _listOfInfantsProducts = <ProductModel>[
    ProductModel(
        name: 'Doliprane',
        amountOfGrams: '1000mg',
        productForm: 'Capsule',
        constituents: 'Doliprane',
        dispenseMode: 'No idea',
        imgUrl: CustomImagesUrl.doliprane,
        manufacturerImgUrl: CustomImagesUrl.doliprane,
        manufacturerName: 'manufacturerName',
        price: 3500,
        productId: '1231',
        noOfTabletsPerColumn: 9,
        noOfTabletsPerRow: 10,
        category: Category.infants,
        requiresPrescription: true),
  ];
  static final _listOfCoughProducts = <ProductModel>[];

  List<ProductModel> get listOfHeadacheProducts =>
      List.unmodifiable(_listOfHeadacheProducts);

  List<ProductModel> get listOfSupplementsProducts =>
      List.unmodifiable(_listOfSupplementsProducts);

  List<ProductModel> get listOfInfantsProducts =>
      List.unmodifiable(_listOfInfantsProducts);

  List<ProductModel> get listOfCoughProducts =>
      List.unmodifiable(_listOfCoughProducts);

  /// Product to be viewed in the [ProductInfo] screen
  late ProductModel editProductInfo;

  String? _searchKeyword;
  String? get searchKeyword => _searchKeyword;

  /// Provides the product name to be searched for by [searchResultForProduct]
  updateSearchKeyword(String searchKeyword) {
    _searchKeyword = searchKeyword;
  }

  /// Provides all the products in all the categories
  @override
  List<ProductModel> getAllProducts() {
    List<ProductModel> combinedList = listOfCoughProducts +
        listOfHeadacheProducts +
        listOfInfantsProducts +
        listOfSupplementsProducts;
    return combinedList;
  }

  /// Increases quantity of product
  increaseProductQuantity() {
    editProductInfo.noOfItemsInCart++;
    notifyListeners();
  }

  /// Decreases quantity of product
  decreasesProductQuantity() {
    editProductInfo.noOfItemsInCart--;
    notifyListeners();
  }

  /// Provides similar products i.e products from same category
  List<ProductModel>? getSimilarProducts(Category category) {
    final combinedList = _listOfCoughProducts +
        _listOfInfantsProducts +
        _listOfSupplementsProducts +
        _listOfHeadacheProducts;
    List<ProductModel>? similarList =
        combinedList.where((element) => element.category == category).toList();
    similarList.shuffle();
    if (similarList.isEmpty || similarList.length == 1) return null;
    int listLength;
    similarList.length > 5
        ? listLength = 5
        : listLength = similarList.length - 1;
    return similarList.getRange(0, listLength).toList();
  }

  /// Provides all the product in a specific category
  @override
  List<ProductModel> getSelectedList(Category category) {
    switch (category) {
      case Category.cough:
        return listOfCoughProducts;
      case Category.headache:
        return listOfHeadacheProducts;
      case Category.infants:
        return listOfInfantsProducts;
      default:
        return listOfSupplementsProducts;
    }
  }

  /// Searches for a certain product in all the categories
  @override
  List<ProductModel>? searchResultForProduct() {
    String? searchKeyword = _searchKeyword?.toLowerCase();
    List<ProductModel> combinedList = getAllProducts();
    List<ProductModel>? searchResult = combinedList
        .where((element) => element.name.toLowerCase().contains(searchKeyword ?? ''))
        .toList();
    return searchResult;
  }

  /// Provides suggestions of products from all categories randomly
  @override
  List<ProductModel> getSuggestions() {
    List<ProductModel> combinedList = getAllProducts();
    combinedList.shuffle();
    return combinedList.getRange(0, 3).toList();
  }

  /// Receives selected product from list of products
  saveProductInfo(ProductModel selectedProduct) {
    editProductInfo = selectedProduct;
    notifyListeners();
  }

  @override
  void close() {}

  @override
  Future init() {
    return Future.value(null);
  }
}
