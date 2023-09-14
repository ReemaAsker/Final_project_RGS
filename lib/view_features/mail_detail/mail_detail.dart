import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/view_features/mail_detail/widgets/activity_tile.dart';
import 'package:gsg_final_project_rgs/view_features/mail_detail/widgets/image_tile.dart';
import '../../cores/utils/colors.dart';
import '../home/widgets/custom_border.dart';
import '../home/widgets/custom_text.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightWhiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 16, left: 16),
              height: 60,
              child: Row(
                children: [
                  const Image(image: AssetImage('images/arrow_left.png')),
                  const SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: CustomText('Home', 18, 'Poppins', kLightPrimaryColor,
                        FontWeight.w600),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Image(
                        image: AssetImage('images/more.png'),
                      ))
                  // const Image(image: AssetImage('images/more.png')),
                ],
                //),
              ),
            ),
            const DetailsWidget(),
          ],
        ),
      ),
    );
  }
}

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({
    super.key,
  });

  @override
  State<DetailsWidget> createState() => DetailsWidgetState();
}

class DetailsWidgetState extends State<DetailsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BorderShape(
                widget: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Image(
                          image: AssetImage('images/user.png'),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 18,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomText('Sport Ministry', 16, 'Poppins',
                                        kBlackColor, FontWeight.w600),
                                    const Spacer(),
                                    CustomText('Today, 11:00 AM', 12, 'Poppins',
                                        kHintGreyColor, FontWeight.w600),
                                  ],
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                        'Official Organization',
                                        12,
                                        'Poppins',
                                        kHintGreyColor,
                                        FontWeight.w400),
                                    const Spacer(),
                                    CustomText('Arch 2022/1032', 12, 'Poppins',
                                        kHintGreyColor, FontWeight.w400),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: kDividerColor,
                      thickness: 0.5,
                    ),
                    ExpandablePanel(
                      theme: const ExpandableThemeData(
                          iconColor: kLightPrimaryColor,
                          headerAlignment:
                          ExpandablePanelHeaderAlignment.center),
                      header: CustomText('Title of mail', 20, 'Poppins',
                          kBlackColor, FontWeight.w600),
                      collapsed: const Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                        softWrap: false,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: kHintGreyColor, fontWeight: FontWeight.w600),
                      ),
                      expanded: const Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                        softWrap: true,
                        style: TextStyle(
                            color: kHintGreyColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                valColor: Colors.white,
              ),
              const SizedBox(
                height: 12,
              ),
              //tags
              GestureDetector(
                onTap: () => {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => TagsPage(),
                  //   ),
                  // )
                },
                child: BorderShape(
                    widget: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText('#', 20, 'Poppins', kDarkGreyColor2,
                            FontWeight.w600),
                        const SizedBox(
                          width: 12,
                        ),
                        CustomText('#Urgent', 14, 'Poppins', kHintGreyColor,
                            FontWeight.w400),
                        const SizedBox(
                          width: 12,
                        ),
                        CustomText('#Egyptian Military', 14, 'Poppins',
                            kHintGreyColor, FontWeight.w400),
                        const Spacer(),
                        const Image(image: AssetImage('images/arrow_right.png'))
                      ],
                    ),
                    valColor: Colors.white),
              ),
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () => {},
                child: BorderShape(
                  widget: Row(
                    children: [
                      const Image(image: AssetImage('images/status.png')),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.all(
                            Radius.circular(22),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 13, right: 13),
                          child: CustomText('Pending', 16, 'Poppins',
                              kBlackColor, FontWeight.w600),
                        ),
                      ),
                      const Spacer(),
                      const Image(image: AssetImage('images/arrow_right.png')),
                    ],
                  ),
                  valColor: Colors.white,
                ),
              ),
              //   }),
              //),
              const SizedBox(
                height: 12,
              ),
              Visibility(
                child: BorderShape(
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText('Decision', 18, 'Poppins', kBlackColor,
                          FontWeight.w600),
                      CustomText(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                          14,
                          'Poppins',
                          kBlackColor,
                          FontWeight.w400),
                    ],
                  ),
                  valColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              BorderShape(
                  widget: Padding(
                    padding: const EdgeInsets.only(
                        left: 19, right: 14, top: 20, bottom: 23),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText('Add Image', 16, 'Poppins',
                            kLightPrimaryColor, FontWeight.w400),
                        const SizedBox(
                          height: 20,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: 2,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int idx) {
                            return const ImageTile();
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 24,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  valColor: Colors.white),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: CustomText(
                      'Activity', 20, 'Poppins', kBlackColor, FontWeight.w600),
                  backgroundColor: Colors.transparent,
                  children: [
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return ActivityTile(const [
                          'Hussam',
                          'The issue is transferred to AAAA',
                          'Ali'
                        ]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 7,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const BorderShape(
                  widget: Row(
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
                          // style: Theme.of(context).textTheme.bodySmall,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add new Activity …',
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
                  valColor: kLightGreyColor2),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
        //      ],
        //  ),
      ),
    );
  }
}