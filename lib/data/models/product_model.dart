import 'package:equatable/equatable.dart';

enum Category { headache, supplements, infants, cough }

class ProductModel extends Equatable {
  final String name;
  final String productForm;
  final String amountOfGrams;
  final double price;
  final String manufacturerName;
  final String manufacturerImgUrl;
  final String productId;
  final String dispenseMode;
  final String constituents;
  final String imgUrl;
  final int noOfTabletsPerColumn;
  final int noOfTabletsPerRow;
  final Category category;
  bool requiresPrescription;
  int noOfItemsInCart;

  ProductModel({
    required this.name,
    required this.amountOfGrams,
    required this.productForm,
    required this.constituents,
    required this.dispenseMode,
    required this.imgUrl,
    required this.manufacturerImgUrl,
    required this.manufacturerName,
    required this.price,
    required this.productId,
    required this.noOfTabletsPerColumn,
    required this.noOfTabletsPerRow,
    required this.category,
    this.requiresPrescription = false,
    this.noOfItemsInCart = 1,
  })  : totalPrice = price * noOfItemsInCart,
        packetSize =
            '$noOfTabletsPerRow X $noOfTabletsPerColumn (${noOfTabletsPerRow * noOfTabletsPerColumn})',
        productSummary =
            '1 pack of $name ($amountOfGrams) contains $noOfTabletsPerRow units of $noOfTabletsPerColumn tablets';
  double totalPrice;
  String packetSize;
  String productSummary;

  double? getTotalPrice() {
    return price * noOfItemsInCart;
  }

  @override
  List<Object?> get props => [
        name,
    productForm,
    category,
    productId,
    manufacturerName,
    amountOfGrams,
    constituents,
    dispenseMode
      ];
}
