import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/constants/custom_fontSize.dart';
import 'package:pharmacy/constants/custom_images.dart';
import 'package:pharmacy/data/repositories_implementation/cart_repository_implementation.dart';
import 'package:pharmacy/screens/app_widgets/cart_tile.dart';
import 'package:pharmacy/screens/app_widgets/custom_appbar/general_custom_appbar.dart';
import 'package:provider/provider.dart';

import '../constants/custom_colors.dart';
import '../data/models/product_model.dart';
import 'app_widgets/custom_button.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  List<int> noOfProducts = List<int>.generate(8, (index) => index+1);

  List<int> productTotalCost = [];

  @override
  Widget build(BuildContext context) {
    List<ProductModel>? _cartList = context.watch<CartRepositoryImplementation>().cartList;
    double totalPrice = context.watch<CartRepositoryImplementation>().totalPrice;

    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const GeneralCustomAppBar(),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        ListView.builder(
                          shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: _cartList?.length,
                            itemBuilder: (context, index) {
                            return Column(
                              children: [
                                const SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Image.asset(
                                      _cartList![index].imgUrl,
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
                                            Text(_cartList[index].name, style: const TextStyle(fontSize: CustomFontSize.small,fontWeight: FontWeight.w500),),
                                            Text(' ${_cartList[index].productForm} • ${_cartList[0].amountOfGrams}', style: TextStyle(fontSize: CustomFontSize.small,color: CustomColors.grey, fontWeight: FontWeight.bold),),
                                            Text('₦${_cartList[index].price * _cartList[index].noOfItemsInCart}', style: const TextStyle(fontSize: CustomFontSize.small,fontWeight: FontWeight.bold),),
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
                                                  value: _cartList[index].noOfItemsInCart,
                                                  items: noOfProducts.map<DropdownMenuItem<int>>((int value) {
                                                    return DropdownMenuItem<int>(value: value, child: Text(value.toString()),);
                                                  }).toList(),
                                                  onChanged: (int? newValue) {
                                                    Provider.of<CartRepositoryImplementation>(context, listen: false).updateProductItemCount(_cartList[index].productId, newValue ?? 1);
                                                  },
                                                ),
                                              )
                                          ),
                                          Row( crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    Provider.of<CartRepositoryImplementation>(context, listen: false).removeProductFromCart(_cartList[index].productId);
                                                  },
                                                  child: SvgPicture.asset(CustomImagesUrl.deleteIcon,)),
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
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  const Text(
                    'Total: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: CustomFontSize.small,
                    ),
                  ),
                  Text(
                    '₦:$totalPrice ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: CustomFontSize.small,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  CustomButton(buttonLength: MediaQuery.of(context).size.width * 0.5, buttonName: 'CHECKOUT',),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
