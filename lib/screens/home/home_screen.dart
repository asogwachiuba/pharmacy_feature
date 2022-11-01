import 'package:flutter/material.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy/constants/custom_colors.dart';
import 'package:pharmacy/constants/custom_fontSize.dart';
import 'package:pharmacy/constants/custom_images.dart';
import 'package:pharmacy/data/models/product_model.dart';
import 'package:pharmacy/data/repositories_implementation/cart_repository_implementation.dart';
import 'package:pharmacy/data/repositories_implementation/product_repository_implementation.dart';
import 'package:pharmacy/screens/app_widgets/product_tile.dart';
import 'package:pharmacy/screens/home/general/all_product.dart';
import 'package:pharmacy/screens/home/search/search.dart';
import 'package:provider/provider.dart';

import '../app_widgets/category_tile.dart';
import '../app_widgets/custom_appbar/home_custom_appbar.dart';
import '../app_widgets/deliveryLocation.dart';
import 'general/cough.dart';
import 'general/headache.dart';
import 'general/infants.dart';
import 'general/suggestion.dart';
import 'general/supplements.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;
  int screenIndex = 0;
  bool isSearching = false;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: const Color.fromRGBO(217, 215, 219, 1),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color.fromRGBO(116, 11, 222, 1),
                                    Color.fromRGBO(143, 77, 209, 1)
                                  ]),
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(20))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Pharmacy',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: CustomFontSize.large,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SvgPicture.asset(
                                      CustomImagesUrl.pharmacyIcon,
                                      width: 30,
                                      height: 25,
                                      fit: BoxFit.fill,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20, top: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color:
                                                Colors.white.withOpacity(0.15)),
                                        child: TextFormField(
                                          onTap: () {
                                            setState(() {
                                              isSearching = !isSearching;
                                            });
                                          },
                                          onChanged: (searchKeyword) {
                                            // String? searchKeyword = _searchController.text;
                                            Provider.of<ProductRepositoryImplementation>(
                                                    context,
                                                    listen: false)
                                                .updateSearchKeyword(
                                                    searchKeyword);
                                            setState(() {
                                              isSearching = true;
                                            });
                                          },
                                          controller: _searchController,
                                          decoration: const InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.search,
                                                color: Colors.white,
                                                size: 25,
                                              ),
                                              border: InputBorder.none,
                                              prefixIconColor: Colors.white,
                                              hintText: 'Search',
                                              hintStyle: TextStyle(
                                                  fontSize:
                                                      CustomFontSize.normal,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.65,
                              color: Colors.transparent,
                              child: Image.asset(
                                CustomImagesUrl.lines,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const DeliveryLocation(),
                    const SizedBox(height: 15),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            isSearching == false ? const GeneralScreen() : search(context)
          ],
        ),
      ),
      floatingActionButton: isSearching == false
          ? Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        CustomColors.lightRed,
                        CustomColors.darkRed,
                      ]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Checkout',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.shopping_cart_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        // update with number of items on the list
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: CustomColors.golden,
                          child: Text(
                            Provider.of<CartRepositoryImplementation>(context)
                                .getLengthOfCartList()
                                .toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: CustomFontSize.small,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Material(
              elevation: 40,
              color: Colors.transparent,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [CustomColors.lightRed, CustomColors.darkRed])),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FlutterBadge(
                    icon: SvgPicture.asset(CustomImagesUrl.cartIcon),
                    itemCount:
                        Provider.of<CartRepositoryImplementation>(context).getLengthOfCartList(),
                    badgeColor: CustomColors.golden,
                  ),
                ),
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: CustomColors.lightPurple,
        unselectedItemColor: Colors.grey,
        backgroundColor: CustomColors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(CustomImagesUrl.homeIcon), label: 'Home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(CustomImagesUrl.doctorIcon),
              label: 'Doctor'),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: 25,
              ),
              label: 'Pharmacy'),
          BottomNavigationBarItem(
              // backgroundColor: CustomColors.darkPurple,
              icon: SvgPicture.asset(
                CustomImagesUrl.communityIcon,
              ),
              label: 'Community'),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                size: 25,
                color: Colors.grey,
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({Key? key}) : super(key: key);

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<ProductModel> suggestionList =
        Provider.of<ProductRepositoryImplementation>(context).getSuggestions();
    List<Widget> screens = [
      SuggestionWidget(suggestionList: suggestionList),
      headache(context),
      supplements(context),
      infants(context),
      cough(context),
      allProduct(context)
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'CATEGORIES',
                style: TextStyle(
                  fontSize: CustomFontSize.small,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(217, 215, 219, 1),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    screenIndex = 5;
                  });
                },
                child: const Text(
                  'VIEW ALL',
                  style: TextStyle(
                      color: Color.fromRGBO(143, 77, 209, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: CustomFontSize.small),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    screenIndex = 1;
                  });
                },
                child: const CategoryTile(
                  category: 'Headache',
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    screenIndex = 2;
                  });
                },
                child: const CategoryTile(
                  category: 'Supplement',
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    screenIndex = 3;
                  });
                },
                child: const CategoryTile(
                  category: 'Infants',
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    screenIndex = 4;
                  });
                },
                child: const CategoryTile(
                  category: 'Cough',
                ),
              ),
            ],
          ),
        ),
        screens[screenIndex],
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
