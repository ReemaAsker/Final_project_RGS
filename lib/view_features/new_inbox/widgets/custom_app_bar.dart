import 'package:flutter/material.dart';

import '../../../cores/utils/colors.dart';
import '../../home/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  Function() onTap;
  CustomAppBar({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, bottom: 16),
      child: Row(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: CustomText('Cancel', 18, 'Poppins', kLightPrimaryColor,
                  FontWeight.w400)),
          const Spacer(),
          CustomText(title, 18, 'Poppins', kBlackColor, FontWeight.w600),
          const Spacer(),
          TextButton(
              onPressed: onTap,
              child: CustomText(
                  'Done', 18, 'Poppins', kLightPrimaryColor, FontWeight.w400)),
        ],
      ),
    );
  }
}
