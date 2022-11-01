import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy/constants/custom_colors.dart';
import 'package:pharmacy/constants/custom_fontSize.dart';
import 'package:pharmacy/constants/custom_images.dart';

class GeneralCustomAppBar extends StatelessWidget {
  const GeneralCustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    CustomColors.darkPurple,
                    CustomColors.lightPurple
                  ]),
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          context.go('/pharmacy');
                        },
                        child: Icon(Icons.arrow_back_ios, color: CustomColors.grey,)),
                    const SizedBox(width: 5,),
                    const Text(
                      'Pharmacy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: CustomFontSize.large,
                          fontWeight: FontWeight.w700),
                    ),
                    const Spacer(flex: 1,),
                    SvgPicture.asset(
                      CustomImagesUrl.realCartIcon,
                      width: 30,
                      height: 35,
                      fit: BoxFit.fill,
                    ),
                  ],
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
              child: Image.asset(CustomImagesUrl.smallLines, fit: BoxFit.cover,),
            )),
      ],
    );
  }
}

// SvgPicture.asset(
// 'assets/cart_icon.svg',
// fit: BoxFit.cover,
// )