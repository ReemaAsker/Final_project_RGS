import 'package:flutter/material.dart';
import '../../../cores/utils/colors.dart';
import '../../home/widgets/custom_border.dart';
import '../../home/widgets/custom_text.dart';

class ActivityTile extends StatelessWidget {
  List activities;

  ActivityTile(this.activities, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderShape(
      widget: Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 19, bottom: 13, right: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 18.0,
                backgroundImage: AssetImage('images/profile.png'),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(
                width: 9,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText('${activities[0]}', 16, 'Poppins',
                            kBlackColor, FontWeight.w600),
                        const Spacer(),
                        CustomText('Today, 11:00 AM', 12, 'Poppins',
                            kHintGreyColor, FontWeight.w600),
                      ],
                    ),
                    CustomText('${activities[1]}', 14, 'Poppins',
                        kLightBlackColor, FontWeight.w400),
                  ],
                ),
              )
            ],
          )),
      valColor: Colors.white,
      onTap: () {},
    );
  }
}
