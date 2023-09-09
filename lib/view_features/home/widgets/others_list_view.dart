import 'package:flutter/material.dart';
import '../../../cores/utils/colors.dart';
import 'custom_text.dart';

class OthersListView extends StatelessWidget {
  List<Map<String,dynamic>> listLength;
  Color color;

  OthersListView(this.listLength, this.color, {Key? key}) : super(key: key);
  String orgName = 'Organization Name';
  String subject = 'Here we add the subject';
  String desc = 'And here excerpt of the mail, can added to this location. And we can do more to this like ...';


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 1 ,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 16),
        itemBuilder: (BuildContext context, int index) {
          return Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: CustomText('Others', 20, 'Poppins', kBlackColor,
                  FontWeight.w600),
              backgroundColor: Colors.transparent,
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: listLength.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(22))),
                        child: Padding(
                          padding:
                          const EdgeInsets.only(bottom: 9, left: 16, right: 14, top: 10),
                          child:
                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: color,
                                  radius: 10,
                                ),
                                // const Spacer(),
                                const SizedBox(
                                  width: 9,
                                ),
                                CustomText(orgName, 18.0, 'Poppins', kBlackColor,
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
                                  image: AssetImage('images/arrow_right.png'),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 37),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(subject, 14.0, 'Poppins', kLightBlackColor,
                                      FontWeight.w400),
                                  CustomText(desc , 14.0, 'Poppins',
                                      kHintGreyColor, FontWeight.w400),
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
