import 'package:flutter/material.dart';
import '../../../cores/utils/colors.dart';
import 'custom_text.dart';

class MailTile extends StatelessWidget {
  String mailName = 'Hello';
  String status = 'Completed';
  String orgName = 'Organization Name';
  String createdAt = '12/3/6';
  String subject = 'Here we add the subject';
  String desc =
      'And here excerpt of the mail, can added to this location. And we can do more to this like ...';
  List tags = ['#Urgent', '#Egyptian Military'];
  List attachments = ['img', 'file'];

  MailTile(this.mailName, {Key? key}) : super(key: key);

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
          const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 16),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 7,
                ),
                // const Spacer(),
                const SizedBox(
                  width: 9,
                ),
                CustomText(
                    orgName, 18.0, 'Poppins', kBlackColor, FontWeight.w600),
                const Spacer(),
                CustomText('Today at ..', 12.0, 'Poppins', kHintGreyColor,
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
              margin: EdgeInsets.only(left: 37),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(subject, 14.0, 'Poppins', kLightBlackColor,
                      FontWeight.w400),
                  CustomText(
                      desc, 14.0, 'Poppins', kHintGreyColor, FontWeight.w400),
                  const SizedBox(
                    height: 8,
                  ),
                  Visibility(
                      visible: tags.isNotEmpty ? true : false,
                      child: _buildTagHorizontalList(tags)),
                  Visibility(
                    visible: attachments.isNotEmpty ? true : false,
                    child: SizedBox(
                      height: 36,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: attachments.length,
                        itemBuilder: (ctx, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 8),
                            child: Image(
                              image: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg'),
                            ),
                          );
                          // return ImageCard(
                          //     attachments[0], 36, 36);
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

  Widget _buildTagHorizontalList(List? tags) {
    return SizedBox(
      height: 27,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: tags!.length,
        itemBuilder: (ctx, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText('${tags[index]}', 14, 'Poppins', kLightPrimaryColor,
                  FontWeight.w600),
              // const SizedBox(
              //   height: 6,
              // )
            ],
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
}
