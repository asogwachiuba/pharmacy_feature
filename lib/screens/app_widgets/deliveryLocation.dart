import 'package:flutter/material.dart';

import '../../constants/custom_fontSize.dart';

class DeliveryLocation extends StatelessWidget {
  const DeliveryLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.location_on_outlined,
          color: Colors.black,
          size: 20,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          'Delivery in ',
          style: TextStyle(fontSize: CustomFontSize.small, fontWeight: FontWeight.w400),
        ),
        Text(
          'Lagos, NG',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: CustomFontSize.small),
        )
      ],
    );
  }
}
