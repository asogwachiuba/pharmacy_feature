import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy/data/models/product_model.dart';

import '../../constants/custom_colors.dart';
import '../../constants/custom_fontSize.dart';
import '../../constants/custom_images.dart';

class CartTile extends StatefulWidget {
  ProductModel cartProduct;
  CartTile({
    required this.cartProduct,
    Key? key}) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  List<int> noOfProducts = [
    1,2,3,4,5,6,7,8
  ];

  int dropdownValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              widget.cartProduct.imgUrl,
              height: 60,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.cartProduct.name, style: const TextStyle(fontSize: CustomFontSize.small,fontWeight: FontWeight.w500),),
                    Text(' ${widget.cartProduct.productForm} • ${widget.cartProduct.amountOfGrams}', style: TextStyle(fontSize: CustomFontSize.small,color: CustomColors.grey, fontWeight: FontWeight.bold),),
                    Text('₦${widget.cartProduct.price * dropdownValue}', style: const TextStyle(fontSize: CustomFontSize.small,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            const Spacer(flex: 1,),
            Container(
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 25,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), border: Border.all(color: CustomColors.lightPurple, width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: DropdownButton<int>(
                          icon: Icon(Icons.keyboard_arrow_down, color: CustomColors.darkPurple,),
                          value: dropdownValue,
                          items: noOfProducts.map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(value: value, child: Text(value.toString()),);
                          }).toList(),
                          onChanged: (int? newValue) {
                            setState(() {
                              dropdownValue = newValue ?? 1;
                            });
                          },
                        ),
                      )
                  ),
                  Row( crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(CustomImagesUrl.deleteIcon,),
                      const SizedBox(width: 10,),
                      Text('Remove', style: TextStyle(color: CustomColors.lightPurple, fontSize: CustomFontSize.small),)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Container(
          height: 2,
          width: MediaQuery.of(context).size.width,
          color: CustomColors.grey,
        )
      ],
    );
  }
}
