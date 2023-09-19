import 'package:flutter/material.dart';
import '../../cores/utils/colors.dart';
import '../home/widgets/custom_text.dart';
import '../new_inbox/widgets/custom_app_bar.dart';
import '../search/widgets/custom_search.dart';

class SenderPage extends StatelessWidget {
  SenderPage({Key? key}) : super(key: key);
  List senders = ['Sender 1', 'Sender 1'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightWhiteColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(title: 'Sender', onTap: () {}),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 8, right: 8, bottom: 16),
                          child: CustomSearch(),
                        )),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
                const Divider(
                  height: 0.5,
                  color: kDividerColor,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 16, bottom: 16),
                      child: CustomText('"Sport" ', 15, 'Poppins', kBlackColor,
                          FontWeight.w500),
                    ),
                  ],
                ),
                const Divider(
                  height: 0.5,
                  color: kDividerColor,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 24, bottom: 8),
                      child: CustomText('Official ORG', 13, 'Poppins',
                          kDarkGreyColor, FontWeight.w500),
                    ),
                    // Spacer(),
                  ],
                ),
                const Divider(
                  height: 0.5,
                  color: kDividerColor,
                ),
                getSenderListView(senders),
                const Divider(
                  height: 0.5,
                  color: kDividerColor,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 24, bottom: 8),
                      child: CustomText('Other', 13, 'Poppins', kDarkGreyColor,
                          FontWeight.w500),
                    ),
                    // Spacer(),
                  ],
                ),
                const Divider(
                  height: 0.5,
                  color: kDividerColor,
                ),
                getSenderListView(senders),
                const Divider(
                  height: 0.5,
                  color: kDividerColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getSenderListView(List senders) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => getSenderTile(senders[index]),
      separatorBuilder: (context, index) {
        return const Divider(
          height: 0.5,
          color: kDividerColor,
        );
      },
      itemCount: senders.length,
      shrinkWrap: true,
    );
  }

  getSenderTile(String senders) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Wrap(
        children: [
          const CircleAvatar(
            radius: 15,
            backgroundColor: kDarkGreyColor2,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          CustomText(senders, 16, 'Poppins', kBlackColor, FontWeight.w400),
        ],
      ),
      // title: CustomText(senders, 16, 'Poppins', kBlackColor, FontWeight.w400),
    );
    // return ListTile(
    //   onTap: () {},
    //   title: CustomText(senders, 16, 'Poppins', kBlackColor, FontWeight.w400),
    // );
  }
}
