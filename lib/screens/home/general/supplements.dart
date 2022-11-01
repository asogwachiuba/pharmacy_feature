import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../constants/custom_fontSize.dart';
import '../../../data/models/product_model.dart';
import '../../../data/repositories_implementation/product_repository_implementation.dart';
import '../../app_widgets/category_tile.dart';
import '../../app_widgets/product_tile.dart';

Widget supplements(BuildContext context) {
  List<ProductModel> supplementsListOfProducts =
  Provider.of<ProductRepositoryImplementation>(context).getSelectedList(Category.supplements);
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
            'SUPPLEMENTS',
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
            itemCount: supplementsListOfProducts.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Provider.of<ProductRepositoryImplementation>(context, listen: false).saveProductInfo(supplementsListOfProducts[index]);
                  context.go('/productInfo');
                },
                child: ProductTile(
                  imgUrl: supplementsListOfProducts[index].imgUrl,
                  productForm: supplementsListOfProducts[index].productForm,
                  amountOfGrams: supplementsListOfProducts[index].amountOfGrams,
                  price: supplementsListOfProducts[index].price,
                  name: supplementsListOfProducts[index].name,
                  requiresPrescription:
                  supplementsListOfProducts[index].requiresPrescription,
                ),
              );
            })
      ],
    ),
  );
}