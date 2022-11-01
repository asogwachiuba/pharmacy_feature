import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';
import '../../constants/custom_fontSize.dart';

class ProductTile extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String productForm;
  final String amountOfGrams;
  final double price;
  final bool requiresPrescription;
  const ProductTile({
    required this.imgUrl, required this.productForm, required this.amountOfGrams, required this.price,
    Key? key, required this.name, required this.requiresPrescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15))),
                child: Image.asset(
                  imgUrl,
                  width: MediaQuery.of(context).size.width*0.4,
                  fit: BoxFit.fill,
                ),
              ),
            //
            // requiresPrescription == true ?  Positioned(
            //       bottom: 0,right: 0,left: 0,
            //       child: Opacity(
            //         opacity: 0.5,
            //         child: Container(
            //     width: 150,
            //     color: Colors.black,
            //     height: 20,
            //     child: Center(child: Text('Requires a prescription', style: TextStyle(color: Colors.white, fontSize: CustomFontSize.verySmall, fontWeight: FontWeight.bold),)),
            //   ),
            //       )) : Container(color: Colors.transparent,)
            ],
          ),
        ),
        Expanded(
          flex: 7,
          child: Card(
            margin: EdgeInsets.zero,
            color: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            elevation: 10,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              width: MediaQuery.of(context).size.width*0.4,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style:const TextStyle(fontSize: CustomFontSize.small,fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 5,
                    ),
                    Wrap(
                      children: [
                        Text(
                          '$productForm •',
                          style: TextStyle(
                              color: CustomColors.grey,
                              fontSize: CustomFontSize.small,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(amountOfGrams,
                            style: TextStyle(
                                color: CustomColors.grey,
                                fontSize: CustomFontSize.small,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('₦$price',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: CustomFontSize.normal)),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}