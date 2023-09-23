import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/view_features/mail_detail/widgets/empty_container_outline.dart';
import '../../cores/utils/colors.dart';
import '../home/widgets/custom_text.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: CustomText('Title of mail', 18, 'Poppins', kBlackColor,
                      FontWeight.w400),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.cancel,
                    color: kDarkGreyColor3,
                    size: 30,
                  ),
                ),
              ],
              //),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EmptyContainer(
                  widget: const Icon(
                    Icons.archive,
                    color: kDarkGreyColor,
                    size: 50,
                  ),
                  text: CustomText('Archive', 14, 'Poppins', kDarkGreyColor,
                      FontWeight.w400),
                  onTap: () {},
                ),
                EmptyContainer(
                  widget: const Icon(
                    Icons.ios_share,
                    color: kLightPrimaryColor,
                    size: 50,
                  ),
                  text: CustomText('Share', 14, 'Poppins', kLightPrimaryColor,
                      FontWeight.w400),
                  onTap: () {},
                ),
                EmptyContainer(
                  widget: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 50,
                  ),
                  text: CustomText(
                      'Delete', 14, 'Poppins', Colors.red, FontWeight.w400),
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
