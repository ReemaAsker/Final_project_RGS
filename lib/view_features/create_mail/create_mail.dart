import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/cores/helpers/shared_pref.dart';
import 'package:gsg_final_project_rgs/models/activity.dart';
import 'package:gsg_final_project_rgs/models/mail.dart';
import 'package:gsg_final_project_rgs/models/status.dart';
import 'package:gsg_final_project_rgs/models/tag.dart';
import 'package:gsg_final_project_rgs/view_features/auth/model/auth_model.dart';
import 'package:gsg_final_project_rgs/view_features/auth/model/user.dart';
import 'package:gsg_final_project_rgs/view_features/create_mail/repo/create_mail_repo.dart';
import 'package:gsg_final_project_rgs/view_features/create_mail/widgets/custom_app_bar.dart';
import '../../cores/utils/colors.dart';
import '../home/widgets/custom_border.dart';
import '../home/widgets/custom_text.dart';

class NewInboxPage extends StatelessWidget {
  NewInboxPage({Key? key}) : super(key: key);

  final senderNameController = TextEditingController();
  final senderPhoneController = TextEditingController();
  final mailTitleController = TextEditingController();
  final mailDescriptionController = TextEditingController();
  final mailDateController = TextEditingController();
  final mailArchiveNoController = TextEditingController();
  final mailDecisionController = TextEditingController();
  final mailActivitiesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.95,
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
                title: 'New Inbox',
                onTap: () {
                  CreateMailRepository().create_mail(MailClass(
                      subject: "new_mail_from us",
                      description: " ",
                      senderId: "1",
                      archiveNumber: "3000",
                      archiveDate: "2023-9-9",
                      decision: "",
                      statusId: "1",
                      finalDecision: "",
                      tags: [
                        1,
                        3
                      ],
                      activities: [
                        Activity(
                            body: "the problem is in progress",
                            createdAt: "2023-2-2",
                            id: 20)
                      ]));
                }),
            _buildSenderWidget(),
            _buildMailDescriptionWidget(),
            _buildDateArchiveWidget(),
            _buildTagWidget(context),
            _buildMailStatusWidget(context),
            _buildDecisionWidget(),
            _buildImageWidget(),
            _buildActivityExpansion(context),
            _buildAddActivityBtn(),
          ],
        ),
      ),
    );
  }

  BorderShape _buildAddActivityBtn() {
    return BorderShape(
      widget: const Row(
        children: [
          CircleAvatar(
            radius: 12.0,
            backgroundImage: AssetImage('images/profile.png'),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            width: 9,
          ),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Add Activity',
                hintStyle: TextStyle(
                    color: kLightBlackColor,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Image(image: AssetImage('images/send.png')),
        ],
      ),
      valColor: kLightGreyColor2,
      onTap: () {},
    );
  }

  Widget _buildActivityExpansion(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title:
            CustomText('Activity', 20, 'Poppins', kBlackColor, FontWeight.w600),
        backgroundColor: Colors.transparent,
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Text('activity');
              // return ActivityTile('hello');
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 7,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMailStatusWidget(BuildContext context) {
    return BorderShape(
        widget: Row(
          children: [
            Image.asset('images/status.png'),
            const SizedBox(
              width: 12,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xfffa3a57),
                borderRadius: BorderRadius.all(
                  Radius.circular(22),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 13, right: 13),
                child: CustomText(
                    'Inbox', 16, 'Poppins', kBlackColor, FontWeight.w600),
              ),
            ),
            const Spacer(),
            const Image(image: AssetImage('images/arrow_right.png')),
          ],
        ),
        valColor: Colors.white,
        onTap: () {
          print('Hello');
          // _navigateToStatusPage(context);
        });
  }

  Widget _buildSenderWidget() {
    return BorderShape(
      widget: Column(
        children: [
          _buildCustomListTile(
              const Icon(
                Icons.person,
                color: kHintGreyColor,
              ),
              'Sender',
              Image.asset('images/info.png'),
              '',
              senderNameController),
          const Divider(),
          _buildCustomListTile(
              const Icon(
                Icons.phone_android,
                color: kHintGreyColor,
              ),
              'Phone',
              null,
              '',
              senderPhoneController),
          const Divider(),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                CustomText(
                    'Category', 14, 'Poppins', kBlackColor, FontWeight.w400),
                const Spacer(),
                CustomText(
                    'Other', 12, 'Poppins', kLightBlackColor, FontWeight.w400),
                Image.asset(
                  'images/arrow_right.png',
                  width: 14,
                  height: 12,
                ),
              ],
            ),
          ),
        ],
      ),
      valColor: Colors.white,
      onTap: () {},
    );
  }

  Widget _buildDateArchiveWidget() {
    return BorderShape(
      widget: Column(
        children: [
          _buildCustomListTile(
              const Icon(
                Icons.date_range,
                color: Colors.red,
              ),
              'Date',
              Image.asset('images/arrow_right.png'),
              'Tuesday, July 5, 2022',
              mailDateController),
          const Divider(),
          _buildCustomListTile(
              const Icon(
                Icons.archive_outlined,
                color: kHintGreyColor,
              ),
              'Archive Number',
              null,
              '2022/6019',
              mailArchiveNoController),
        ],
      ),
      valColor: Colors.white,
      onTap: () {},
    );
  }

  Widget _buildMailDescriptionWidget() {
    return BorderShape(
      widget: Column(
        children: [
          TextField(
            controller: mailTitleController,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                fontSize: 16,
                color: kBlackColor),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Title Mail',
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: kHintGreyColor),
            ),
          ),
          const Divider(),
          TextField(
            controller: mailDescriptionController,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                fontSize: 12,
                color: kBlackColor),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Description',
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: kHintGreyColor),
            ),
          ),
        ],
      ),
      valColor: Colors.white,
      onTap: () {},
    );
  }

  Widget _buildDecisionWidget() {
    return BorderShape(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Decision',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                fontSize: 16,
                color: kBlackColor),
          ),
          TextField(
            controller: mailDecisionController,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                fontSize: 12,
                color: kBlackColor),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Add Decision',
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: kHintGreyColor),
            ),
          ),
        ],
      ),
      valColor: Colors.white,
      onTap: () {},
    );
  }

  Widget _buildCustomListTile(Icon icon, String hint, Image? iconTrailing,
      String subTitle, TextEditingController controller) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              subTitle.isEmpty
                  ? TextField(
                      controller: controller,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: kBlackColor),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hint,
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: kHintGreyColor),
                      ),
                    )
                  : Text(
                      hint,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: kBlackColor),
                    ),
              subTitle.isNotEmpty
                  ? TextField(
                      controller: controller,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: kBlackColor),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: subTitle,
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: hint == 'Date'
                                ? kLightPrimaryColor
                                : kHintGreyColor),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        iconTrailing ?? Container()
      ],
    );
  }

  Widget _buildTagWidget(BuildContext context) {
    return BorderShape(
        widget: Row(
          children: [
            const Icon(
              Icons.tag,
              color: kDarkGreyColor,
            ),
            const SizedBox(
              width: 10,
            ),
            CustomText('Tags', 16, 'Poppins', kBlackColor, FontWeight.w600),
            const Spacer(),
            Image.asset('images/arrow_right.png')
          ],
        ),
        valColor: Colors.white,
        onTap: () {
          print('Hello');
          // _navigateToTagsPage(context);
        });
  }

  Widget _buildImageWidget() {
    return BorderShape(
      widget: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Image',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                fontSize: 16,
                color: kLightPrimaryColor),
          ),
        ],
      ),
      valColor: Colors.white,
      onTap: () {},
    );
  }
  // Future<void> _navigateToTagsPage(
  //     BuildContext context) async {
  //   final dynamic? result = await showModalBottomSheet<dynamic>(
  //     isScrollControlled: true,
  //     useRootNavigator: true,
  //     backgroundColor: kLightWhiteColor,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //     context: context,
  //     builder: (BuildContext context) {
  //       return FractionallySizedBox(heightFactor: 0.9, child: TagsPage());
  //     },
  //   );
  // }
  //
  // Future<void> _navigateToStatusPage(
  //     BuildContext context) async {
  //   final dynamic? result = await showModalBottomSheet<dynamic>(
  //     isScrollControlled: true,
  //     useRootNavigator: true,
  //     backgroundColor: kLightWhiteColor,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //     context: context,
  //     builder: (BuildContext context) {
  //       return FractionallySizedBox(heightFactor: 0.9, child: StatusPage());
  //     },
  //   );
  // }
}
