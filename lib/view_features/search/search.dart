import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/models/mail.dart';
import 'package:gsg_final_project_rgs/view_features/search/widgets/custom_search.dart';
import '../../cores/utils/colors.dart';
import '../filter/filter.dart';
import '../home/widgets/custom_text.dart';
import '../home/widgets/mail_tile_view.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  String? orgName = 'Organization Name';
  String? subject = 'Here we add the subject';
  String? desc =
      'And here excerpt of the mail, can added to this location. And we can do more to this like ...';

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
                SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      const Image(image: AssetImage('images/arrow_left.png')),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomText('Home', 18, 'Poppins', kLightPrimaryColor,
                          FontWeight.w400),
                    ],
                    //),
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: CustomSearch()),
                    const SizedBox(
                      width: 17,
                    ),
                    // MyFilterWidget(),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 0, top: 16, bottom: 8),
                      child: CustomText('25 Completed ', 13, 'Poppins',
                          kDarkGreyColor, FontWeight.w400),
                    ),
                    Spacer(),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.only(left: 24)),
                      ),
                      child: CustomText('Show ', 13, 'Poppins',
                          kLightPrimaryColor, FontWeight.w400),
                      onPressed: () {},
                    ),
                  ],
                ),
                const Divider(
                  height: 0.5,
                  color: kDividerColor,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          leading: CustomText('Official Organization', 20,
                              'Poppins', kDarkGreyColor, FontWeight.w400),
                          backgroundColor: Colors.transparent,
                          title: Text(''),
                          trailing: CustomText('1 Found', 13, 'Poppins',
                              kHintGreyColor, FontWeight.w400),
                          children: [
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return MailTile(MailClass(
                                    subject: "test in search page",
                                    archiveNumber: "000/000",
                                    archiveDate: "2023/2022"));
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(
                                  thickness: 0,
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    }),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          leading: CustomText('Others', 20, 'Poppins',
                              kDarkGreyColor, FontWeight.w400),
                          backgroundColor: Colors.transparent,
                          title: Text(''),
                          trailing: CustomText('2 Found', 13, 'Poppins',
                              kHintGreyColor, FontWeight.w400),
                          children: [
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => {},
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(22))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 9,
                                          left: 16,
                                          right: 14,
                                          top: 10),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const CircleAvatar(
                                                  backgroundColor: Colors.green,
                                                  radius: 7,
                                                ),
                                                // const Spacer(),
                                                const SizedBox(
                                                  width: 9,
                                                ),
                                                CustomText(
                                                    orgName!,
                                                    18.0,
                                                    'Poppins',
                                                    kBlackColor,
                                                    FontWeight.w600),
                                                const Spacer(),
                                                CustomText(
                                                    'Today at ..',
                                                    12.0,
                                                    'Poppins',
                                                    kHintGreyColor,
                                                    FontWeight.w400),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                const Image(
                                                  image: AssetImage(
                                                      'images/arrow_right.png'),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 37),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                      subject!,
                                                      14.0,
                                                      'Poppins',
                                                      kLightBlackColor,
                                                      FontWeight.w400),
                                                  CustomText(
                                                      desc!,
                                                      14.0,
                                                      'Poppins',
                                                      kHintGreyColor,
                                                      FontWeight.w400),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ]),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(
                                  thickness: 0,
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyFilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          await showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            builder: (BuildContext context) {
              return FractionallySizedBox(
                heightFactor: 0.9,
                child: FilterPage(),
              );
            },
          );
        },
        child: const Image(image: AssetImage('images/filter.png')));
  }
}
