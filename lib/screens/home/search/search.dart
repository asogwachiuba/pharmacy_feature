import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy/constants/custom_colors.dart';
import 'package:pharmacy/constants/custom_images.dart';
import 'package:provider/provider.dart';

import '../../../../constants/custom_fontSize.dart';
import '../../../../data/models/product_model.dart';
import '../../../data/repositories_implementation/product_repository_implementation.dart';
import '../../app_widgets/product_tile.dart';


Widget search(BuildContext context) {
  List<ProductModel>? searchResult =
  Provider.of<ProductRepositoryImplementation>(context)
      .searchResultForProduct();
  String? searchKeyword =
      Provider.of<ProductRepositoryImplementation>(context, listen: true)
          .searchKeyword;
  return Padding(
    padding: const EdgeInsets.only(
      left: 15.0,
      right: 15.0,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        if (searchResult?.length != 0)
          GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 220,
                  crossAxisSpacing: 7.5,
                  mainAxisSpacing: 15),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: searchResult?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Provider.of<ProductRepositoryImplementation>(context)
                          .saveProductInfo(searchResult[index]);
                      context.go('/productInfo');
                    },
                    child: ProductTile(
                      imgUrl: searchResult![index].imgUrl,
                      productForm: searchResult[index].productForm,
                      amountOfGrams: searchResult[index].amountOfGrams,
                      price: searchResult[index].price,
                      name: searchResult[index].name,
                      requiresPrescription:
                      searchResult[index].requiresPrescription,
                    )

                );
              })
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                CustomImagesUrl.noResult,
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.45,
                fit: BoxFit.fill,
              ),
              Text(
                'No result found for "$searchKeyword "',
                style: TextStyle(
                    color: CustomColors.grey,
                    fontSize: CustomFontSize.normal,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
      ],
    ),
  );
}
