import 'package:flutter/material.dart';

import '../../../cores/utils/colors.dart';
import '../../../models/mail.dart';
import 'custom_text.dart';

class MailTile extends StatelessWidget {
  // String mailName = 'Hello';
  // String status = 'Completed';
  // String orgName = 'Organization Name';
  // String createdAt = '12/3/6';
  // String subject = 'Here we add the subject';
  // String desc = 'And here excerpt of the mail, can added to this location. And we can do more to this like ...';
  // List tags = ['#Urgent', '#Egyptian Military'];
  // List attachments = ['img','file'];
  late MailClass myMail;

  MailTile(this.myMail, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        // Navigator.push(
        // context,
        // MaterialPageRoute(builder: (context) => DetailsPage()),
        // )
      },
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
                  backgroundColor: Color(int.parse(myMail.status!.color!)),
                  radius: 10,
                ),
                // const Spacer(),
                const SizedBox(
                  width: 9,
                ),
                CustomText(myMail.senderId!, 18.0, 'Poppins', kBlackColor,
                    FontWeight.w600),
                const Spacer(),
                CustomText(myMail.createdAt!, 12.0, 'Poppins', kHintGreyColor,
                    FontWeight.w400),
                const SizedBox(
                  width: 8,
                ),
                // const Image(
                //   image: AssetImage('images/arrow_right.png'),
                // ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 37),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(myMail.subject ?? "no subject", 14.0, 'Poppins',
                      kLightBlackColor, FontWeight.w400),
                  CustomText(myMail.description ?? "no descr", 14.0, 'Poppins',
                      kHintGreyColor, FontWeight.w400),
                  const SizedBox(
                    height: 8,
                  ),
                  Visibility(
                      ////////////////////////////null check
                      visible: myMail.tags!.isNotEmpty ? true : false,
                      child: buildTagHorizontalList(myMail)),
                  Visibility(
                    visible: myMail.attachments!.isNotEmpty ? true : false,
                    child: SizedBox(
                      height: 36,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: myMail.attachments!.length,
                        itemBuilder: (ctx, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.green,

                              borderRadius: BorderRadius.circular(20),
                              // image: DecorationImage(
                              //     image: NetworkImage(
                            ), //         "https://palmail.gsgtt.tech/storage/${myMail.attachments![index]['image']}"))),
                            child: Image(
                              image: NetworkImage(
                                "https://palmail.gsgtt.tech/storage/${myMail.attachments![index]['image']}",
                              ),
                              fit: BoxFit.fill,
                            ),
                          );
                          // );
                          // return ImageCard(
                          //     attachments[0], 36, 36);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 10,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

Widget buildTagHorizontalList(MailClass mailClass) {
  return SizedBox(
    height: 27,
    child: ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: mailClass.tags!.length,
      itemBuilder: (ctx, index) {
        print(mailClass.tags![index].name);
        return Chip(
          backgroundColor: kLightPrimaryColor,
          label: CustomText('#${mailClass.tags![index].name}', 14, 'Poppins',
              Colors.white, FontWeight.w600),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 8,
        );
      },
    ),
  );
}
