import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/cores/helpers/api_response.dart';
import 'package:gsg_final_project_rgs/cores/helpers/shared_pref.dart';
import 'package:gsg_final_project_rgs/custom_widgets/custom_snackbar.dart';
import 'package:gsg_final_project_rgs/models/activity.dart';
import 'package:gsg_final_project_rgs/models/attachment.dart';
import 'package:gsg_final_project_rgs/models/mail.dart';
import 'package:gsg_final_project_rgs/models/pivot.dart';
import 'package:gsg_final_project_rgs/models/sender.dart';
import 'package:gsg_final_project_rgs/models/status.dart';
import 'package:gsg_final_project_rgs/models/tag.dart';
import 'package:gsg_final_project_rgs/view_features/auth/model/auth_model.dart';
import 'package:gsg_final_project_rgs/view_features/auth/model/user.dart';
import 'package:gsg_final_project_rgs/view_features/new_inbox/repo/create_mail_repo.dart';
import 'package:gsg_final_project_rgs/view_features/new_inbox/widgets/custom_app_bar.dart';
import 'package:gsg_final_project_rgs/view_features/home/categories/models/Category.dart';
import '../../cores/utils/colors.dart';
import '../home/widgets/custom_border.dart';
import '../home/widgets/custom_text.dart';

class NewInboxPage extends StatefulWidget {
  NewInboxPage({Key? key}) : super(key: key);

  @override
  State<NewInboxPage> createState() => _NewInboxPageState();
}

class _NewInboxPageState extends State<NewInboxPage> {
  final _formKey = GlobalKey<FormState>();

  final senderNameController = TextEditingController();

  final senderPhoneController = TextEditingController();

  final mailTitleController = TextEditingController();

  final mailDescriptionController = TextEditingController();

  final mailDateController = TextEditingController();

  final mailArchiveNoController = TextEditingController();

  final mailDecisionController = TextEditingController();

  final mailActivitiesController = TextEditingController();

  void submit(ApiResponse value, BuildContext cont) {
    print(value.status);
    if (value.status == DataStatus.COMPLETED) {
      My_snackBar.showSnackBar(cont, "mail created", Colors.green);
      // Navigator.pushNamed(context, Hello.id),
      Navigator.pop(
        context,
      );
    } else {
      My_snackBar.showSnackBar(cont, "error", Colors.red);
      Navigator.pop(
        context,
      );
    }
  }

  MailClass getBody() {
    MailClass mailBody = MailClass(
        subject: mailTitleController.text,
        archiveNumber: mailArchiveNoController.text,
        archiveDate: mailDateController.text,
        createdAt: DateTime.now().toString(),
        // activities: [],
        tags: [2, 4],
        // attachments: [],
        decision: mailDecisionController.text,
        description: mailDescriptionController.text,
        // finalDecision: "",
        senderId: "1",
        // statusId: 1,
        updatedAt: DateTime.now().toString());

    return mailBody;
  }

  void create_mail_UI() {
    // if (_formKey.currentState!.validate())
    CreateMailRepository()
        .create_mail(getBody())
        .then((value) => {submit(value, context)}); //
    // else {
    // My_snackBar.showSnackBar(
    // context, "password not equal confirmpassword", Colors.red);
  }

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
                  create_mail_UI();
                  // CreateMailRepository mRepo = CreateMailRepository();
                  // CreateMailRepository()
                  //     .create_Tag(Tag(
                  //         createdAt: DateTime.now().toString(),
                  //         id: "1",
                  //         name: "population tag",
                  //         pivot: Pivot(mailId: "1", tagId: "25"),
                  //         updatedAt: DateTime.now().toString()))
                  //     .then((value) => print(value.name));

                  // Sender sender = Sender();
                  // mRepo
                  //     .create_sender(
                  //       Sender(
                  //           address: "",
                  //           categoryId: "1",
                  //           createdAt: "",
                  //           id: "100",
                  //           mobile: "25866756326",
                  //           name: "test25",
                  //           updatedAt: ""),
                  //     )
                  //     .then((value) => sender = value);

                  // CreateMailRepository()
                  //     .create_mail(MailClass(
                  //   // statusId: 4,
                  //   decision: "not yet",
                  //   senderId: '81',
                  //   finalDecision: "",
                  //   activities: [
                  //     Activity(
                  //         body: "hello",
                  //         createdAt: DateTime.now().toString(),
                  //         id: 2,
                  //         mailId: "5",
                  //         sendDate: DateTime.now().toString(),
                  //         sendDestination: DateTime.now().toString(),
                  //         sendNumber: "25",
                  //         updatedAt: DateTime.now().toString(),
                  //         userId: "5")
                  //   ],
                  //   subject: "population",
                  //   description: "water population",
                  //   archiveNumber: "/4000",
                  //   archiveDate: DateTime.now().toString(),
                  //   attachments: [
                  //     Attachment(
                  //         createdAt: DateTime.now().toString(),
                  //         id: 5,
                  //         image: "",
                  //         mailId: "5",
                  //         title: "efd",
                  //         updatedAt: DateTime.now().toString()),
                  //     Attachment(
                  //         createdAt: DateTime.now().toString(),
                  //         id: 5,
                  //         image: "",
                  //         mailId: "5",
                  //         title: "efd",
                  //         updatedAt: DateTime.now().toString())
                  //   ],
                  //   createdAt: DateTime.now().toString(),
                  //   updatedAt: DateTime.now().toString(),

                  //   // id: 1,
                  //   status: Status(statuses: [StatusElement(id: 1)]),
                  //   tags: [1, 2],
                  // ))
                  //     .then((value) {
                  //   print(value.data!["message"]);
                  // });
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
      widget: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildCustomListTile(
                const Icon(
                  Icons.person,
                  color: kHintGreyColor,
                ),
                'Sender',
                Image.asset('images/info.png'),
                '',
                senderNameController,
                AutofillHints.username),
            const Divider(),
            _buildCustomListTile(
                const Icon(
                  Icons.phone_android,
                  color: kHintGreyColor,
                ),
                'Phone',
                null,
                '',
                senderPhoneController,
                AutofillHints.telephoneNumber),
            const Divider(),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  CustomText(
                      'Category', 14, 'Poppins', kBlackColor, FontWeight.w400),
                  const Spacer(),
                  CustomText('Other', 12, 'Poppins', kLightBlackColor,
                      FontWeight.w400),
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
              mailDateController,
              AutofillHints.birthdayDay),
          const Divider(),
          _buildCustomListTile(
              const Icon(
                Icons.archive_outlined,
                color: kHintGreyColor,
              ),
              'Archive Number',
              null,
              '2022/6019',
              mailArchiveNoController,
              AutofillHints.nickname),
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
      String subTitle, TextEditingController controller, String autoFillJints) {
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
                  ? TextFormField(
                      controller: controller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter the $hint';
                        }
                        return null;
                      },
                      autofillHints: [autoFillJints],
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
}
