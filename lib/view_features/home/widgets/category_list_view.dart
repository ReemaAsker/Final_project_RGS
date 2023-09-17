import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/models/mail.dart';
import 'package:gsg_final_project_rgs/view_features/home/categories/models/Category.dart';

import '../../../cores/utils/colors.dart';
import 'custom_text.dart';

class CategoryListView extends StatelessWidget {
  // Map<CategoryModel,List<MailClass>> categoryMap;
  CategoryModel categoryModel;
  List<MailClass> mails;
  // Color color;

  CategoryListView({required this.categoryModel, required this.mails, Key? key})
      : super(key: key);
  // String orgName = 'Organization Name';
  // String subject = 'Here we add the subject';
  // String desc = 'And here excerpt of the mail, can added to this location. And we can do more to this like ...';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 16),
        itemBuilder: (BuildContext context, int index) {
          return Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: CustomText(categoryModel.name!, 20, 'Poppins', kBlackColor,
                  FontWeight.w600),
              backgroundColor: Colors.transparent,
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: mails.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(22))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 9, left: 16, right: 14, top: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Color(int.parse(
                                          mails[index].status!.color!)),
                                      radius: 10,
                                    ),
                                    // const Spacer(),
                                    const SizedBox(
                                      width: 9,
                                    ),
                                    CustomText(
                                        mails[index].sender!.name ??
                                            "no sender ",
                                        18.0,
                                        'Poppins',
                                        kBlackColor,
                                        FontWeight.w600),
                                    const Spacer(),

                                    const SizedBox(
                                      width: 8,
                                    ),
                                    // const Image(
                                    //   image: AssetImage('images/arrow_right.png'),
                                    // ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 28),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      CustomText(
                                          "Created At:  ${mails[index].createdAt!}",
                                          10,
                                          'Poppins',
                                          kHintGreyColor,
                                          FontWeight.w400),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      CustomText(
                                          mails[index].subject ?? "No subject",
                                          14.0,
                                          'Poppins',
                                          kLightBlackColor,
                                          FontWeight.w400),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      CustomText(
                                          mails[index].description ??
                                              "No description",
                                          14.0,
                                          'Poppins',
                                          kHintGreyColor,
                                          FontWeight.w400),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      thickness: 0,
                    );
                  },
                ),
              ],
            ),
          );
        });
  }
}
