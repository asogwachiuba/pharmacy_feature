import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy/constants/custom_fontSize.dart';
import 'package:pharmacy/constants/custom_images.dart';
import 'package:pharmacy/data/models/product_model.dart';
import 'package:pharmacy/data/repositories_implementation/cart_repository_implementation.dart';
import 'package:pharmacy/data/repositories_implementation/product_repository_implementation.dart';
import 'package:pharmacy/screens/app_widgets/custom_appbar/general_custom_appbar.dart';
import 'package:pharmacy/screens/app_widgets/product_tile.dart';
import 'package:pharmacy/screens/cart.dart';
import 'package:provider/provider.dart';

import '../constants/custom_colors.dart';
import 'app_widgets/category_tile.dart';
import 'app_widgets/custom_button.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    ProductModel selectedProduct =
        context.watch<ProductRepositoryImplementation>().editProductInfo;
    List<ProductModel>? listOfSimilarProducts =
        Provider.of<ProductRepositoryImplementation>(context)
            .getSimilarProducts(selectedProduct.category);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const GeneralCustomAppBar(),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  selectedProduct.imgUrl,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                selectedProduct.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: CustomFontSize.small,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                children: [
                  Text(
                    '${selectedProduct.productForm}  •',
                    style: TextStyle(
                        color: CustomColors.grey,
                        fontSize: CustomFontSize.small,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(selectedProduct.amountOfGrams,
                      style: TextStyle(
                          color: CustomColors.grey,
                          fontSize: CustomFontSize.small,
                          fontWeight: FontWeight.bold))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          child:
                              Image.asset(selectedProduct.manufacturerImgUrl),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SOLD BY',
                              style: TextStyle(
                                  color: CustomColors.grey,
                                  fontSize: CustomFontSize.verySmall),
                            ),
                            Text(
                              selectedProduct.manufacturerName,
                              style: TextStyle(
                                  color: CustomColors.lightBlue,
                                  fontSize: CustomFontSize.verySmall),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          color: Colors.purpleAccent.withOpacity(0.2),
                         // child: Icon(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: CustomColors.grey, width: 2)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  Provider.of<ProductRepositoryImplementation>(
                                          context,
                                          listen: false)
                                      .decreasesProductQuantity();
                                },
                                child: const Text(
                                  '-',
                                  style: TextStyle(
                                      fontSize: CustomFontSize.small,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                selectedProduct.noOfItemsInCart.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: CustomFontSize.small),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  Provider.of<ProductRepositoryImplementation>(
                                          context,
                                          listen: false)
                                      .increaseProductQuantity();
                                },
                                child: const Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: CustomFontSize.small,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Pack(s)',
                          style: TextStyle(
                              color: CustomColors.grey,
                              fontSize: CustomFontSize.verySmall,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '₦',
                                  style: TextStyle(
                                      fontSize: CustomFontSize.small,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  selectedProduct.price.toString().substring(
                                      0,
                                      selectedProduct.price.toString().length -
                                          2),
                                  style: const TextStyle(
                                      fontSize: CustomFontSize.large,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              selectedProduct.price.toString().substring(
                                  selectedProduct.price.toString().length - 2,
                                  selectedProduct.price.toString().length),
                              style: const TextStyle(
                                  fontSize: CustomFontSize.small,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'PRODUCT DETAILS',
                          style: TextStyle(
                              color: CustomColors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: CustomFontSize.small),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  CustomImagesUrl.packSizeIcon,
                                  height: 25,
                                  width: 25,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('PACK SIZE',
                                        style: TextStyle(
                                            fontSize: CustomFontSize.verySmall,
                                            color: CustomColors.grey,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      '${selectedProduct.packetSize} tablets',
                                      style: TextStyle(
                                          fontSize: CustomFontSize.small,
                                          color: CustomColors.lightBlue,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  CustomImagesUrl.packSizeIcon,
                                  height: 25,
                                  width: 25,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('PRODUCT ID',
                                        style: TextStyle(
                                            fontSize: CustomFontSize.verySmall,
                                            color: CustomColors.grey,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      selectedProduct.productId,
                                      style: TextStyle(
                                          fontSize: CustomFontSize.small,
                                          color: CustomColors.lightBlue,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  CustomImagesUrl.constituentsIcon,
                                  height: 25,
                                  width: 25,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('CONSTITUENTS',
                                        style: TextStyle(
                                            fontSize: CustomFontSize.verySmall,
                                            color: CustomColors.grey,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      selectedProduct.constituents,
                                      style: TextStyle(
                                          fontSize: CustomFontSize.small,
                                          color: CustomColors.lightBlue,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  CustomImagesUrl.dispensedInIcon,
                                  height: 25,
                                  width: 25,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('DISPENSED IN',
                                        style: TextStyle(
                                            fontSize: CustomFontSize.verySmall,
                                            color: CustomColors.grey,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      selectedProduct.dispenseMode,
                                      style: TextStyle(
                                          fontSize: CustomFontSize.small,
                                          color: CustomColors.lightBlue,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width),
                        child: Text(
                          selectedProduct.productSummary,
                          style: TextStyle(
                              color: CustomColors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: CustomFontSize.small),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Similar Products',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: CustomFontSize.small),
                        )),
                    SizedBox(
                      height: 250,
                      child: listOfSimilarProducts != null
                          ? ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: listOfSimilarProducts
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: InkWell(
                                          onTap: () {
                                            Provider.of<ProductRepositoryImplementation>(context).saveProductInfo(e);
                                            setState(() {});
                                          },
                                          child: ProductTile(
                                              imgUrl: e.imgUrl,
                                              productForm: e.productForm,
                                              amountOfGrams: e.amountOfGrams,
                                              price: e.price,
                                              name: e.name,
                                              requiresPrescription:
                                                  e.requiresPrescription),
                                        ),
                                      ))
                                  .toList(),
                            )
                          : Center(
                              child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width),
                                  child: Text(
                                    'NO SIMILAR PRODUCTS AVAILABLE',
                                    style: TextStyle(
                                        color: CustomColors.lightBlue,
                                        fontSize: CustomFontSize.normal,
                                        fontStyle: FontStyle.italic),
                                  )),
                            ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                      onTap: () {
                        Provider.of<CartRepositoryImplementation>(context,
                                listen: false)
                            .addProductToCart(selectedProduct);
                        //context.go('/cart');
                        openDialog(context);
                      },
                      child: CustomButton(
                        buttonLength: MediaQuery.of(context).size.width,
                        buttonName: 'ADD TO CART',
                        buttonIcon: Icons.shopping_cart_outlined,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future openDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              '${Provider.of<ProductRepositoryImplementation>(context).editProductInfo.name} has been successfully added to cart!',
              style: const TextStyle(fontSize: CustomFontSize.small, fontWeight: FontWeight.w500),textAlign: TextAlign.center,
            ),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context.go('/cart');
                    },
                    child: CustomButton(
                        buttonLength: MediaQuery.of(context).size.width * 0.6,
                        buttonName: 'VIEW CART'),
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      context.go('/pharmacy');
                    },
                    child: CustomButton(
                        buttonLength: MediaQuery.of(context).size.width * 0.6,
                        buttonName: 'CONTINUE SHOPPING', isColored: false,),
                  ),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          ));
}
