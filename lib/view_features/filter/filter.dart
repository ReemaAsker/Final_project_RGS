import 'package:flutter/material.dart';
import '../../cores/utils/colors.dart';
import '../category/category.dart';
import '../home/widgets/custom_text.dart';
import '../satuts/status.dart';

class FilterPage extends StatelessWidget {
  List<String> categories = [
    'Official organization',
    'NGOs',
    'UnBorder',
    'Others'
  ];
  List statusList = ['Inbox', 'Pending', 'In Progress', 'Completed'];

  FilterPage({super.key});

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: CustomText('Cancel', 18, 'Poppins',
                          kLightPrimaryColor, FontWeight.w400)),
                  CustomText(
                      'Filters', 18, 'Poppins', kBlackColor, FontWeight.w600),
                  TextButton(
                      onPressed: () {},
                      child: CustomText('Done', 18, 'Poppins',
                          kLightPrimaryColor, FontWeight.w400)),
                ],
              ),
            ),
            //body
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CategoryPage().getCategoryListView(categories),
                  _getStatusListView(statusList),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      leading: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                        Image(image: AssetImage('images/datePicker.png')),
                      ),
                      title: CustomText(
                          'Date', 16, 'Poppins', kBlackColor, FontWeight.w400),
                      subtitle: Row(
                        children: [
                          CustomText('From: ', 12, 'Poppins', kDarkGreyColor,
                              FontWeight.w400),
                          CustomText('July 5, 2022', 12, 'Poppins',
                              kLightPrimaryColor, FontWeight.w400),
                          const SizedBox(
                            width: 20,
                          ),
                          CustomText('To: ', 12, 'Poppins', kDarkGreyColor,
                              FontWeight.w400),
                          CustomText('July 5, 2022', 12, 'Poppins',
                              kLightPrimaryColor, FontWeight.w400),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget _getStatusListView(List statusList) {
  return Container(
    margin: EdgeInsets.only(top: 16),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(30)),
    child: ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => buildStatusListTile(index, statusList),
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 15,
          child: Divider(
            height: 1,
            color: kDividerColor,
          ),
        );
      },
      itemCount: statusList.length,
      shrinkWrap: true,
    ),
  );
}
