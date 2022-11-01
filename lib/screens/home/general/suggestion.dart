import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy/data/repositories_implementation/product_repository_implementation.dart';
import 'package:provider/provider.dart';

import '../../../constants/custom_fontSize.dart';
import '../../../data/models/product_model.dart';
import '../../app_widgets/category_tile.dart';
import '../../app_widgets/product_tile.dart';

class SuggestionWidget extends StatelessWidget {
  final List<ProductModel> suggestionList;

  const SuggestionWidget({
    required this.suggestionList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              'SUGGESTIONS',
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
                  mainAxisExtent: 220,
                  crossAxisSpacing: 7.5,
                  mainAxisSpacing: 15),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: suggestionList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Provider.of<ProductRepositoryImplementation>(context, listen: false).saveProductInfo(suggestionList[index]);
                    context.go('/productInfo');
                  },
                  child: ProductTile(
                    imgUrl: suggestionList[index].imgUrl,
                    productForm: suggestionList[index].productForm,
                    amountOfGrams: suggestionList[index].amountOfGrams,
                    price: suggestionList[index].price,
                    name: suggestionList[index].name,
                    requiresPrescription:
                    suggestionList[index].requiresPrescription,
                  ),
                );
              })
        ],
      ),
    );
  }
}