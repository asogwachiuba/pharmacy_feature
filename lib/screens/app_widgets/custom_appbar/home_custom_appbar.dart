import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy/constants/custom_fontSize.dart';
import 'package:pharmacy/constants/custom_images.dart';

class HomeCustomAppBar extends StatelessWidget {
  const HomeCustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pharmacy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: CustomFontSize.large,
                          fontWeight: FontWeight.w700),
                    ),
                    SvgPicture.asset(
                      CustomImagesUrl.cartIcon,
                      width: 30,
                      height: 25,
                      fit: BoxFit.fill,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.15)),
                  child: TextFormField(
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
                            fontSize: CustomFontSize.normal,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  ),
                ),
              ),
              const SizedBox(height: 20,)
            ],
          ),
        ),
        Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 250, color: Colors.transparent,
              child: Image.asset(CustomImagesUrl.lines, fit: BoxFit.cover,),
            )),
      ],
    );
  }
}

// SvgPicture.asset(
// 'assets/cart_icon.svg',
// fit: BoxFit.cover,
// )