import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../constants/custom_fontSize.dart';
import '../../../data/models/product_model.dart';
import '../../../data/repositories_implementation/product_repository_implementation.dart';
import '../../app_widgets/category_tile.dart';
import '../../app_widgets/product_tile.dart';

Widget headache(BuildContext context) {
  List<ProductModel> headacheListOfProducts =
  Provider.of<ProductRepositoryImplementation>(context).getSelectedList(Category.headache);
  return Padding(
    padding: const EdgeInsets.only(
      left: 15.0,
      right: 15.0,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            'HEADACHE',
            style: TextStyle(
              fontSize: CustomFontSize.small,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(217, 215, 219, 1),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 250,
                crossAxisSpacing: 7.5,
                mainAxisSpacing: 15),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: headacheListOfProducts.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Provider.of<ProductRepositoryImplementation>(context, listen: false).saveProductInfo(headacheListOfProducts[index]);
                  context.go('/productInfo');
                },
                child: ProductTile(
                  imgUrl: headacheListOfProducts[index].imgUrl,
                  productForm: headacheListOfProducts[index].productForm,
                  amountOfGrams: headacheListOfProducts[index].amountOfGrams,
                  price: headacheListOfProducts[index].price,
                  name: headacheListOfProducts[index].name,
                  requiresPrescription:
                  headacheListOfProducts[index].requiresPrescription,
                ),
              );
            })
      ],
    ),
  );
}