import 'package:flutter/material.dart';
import '../../cores/utils/colors.dart';
import '../home/widgets/custom_text.dart';
import '../new_inbox/widgets/custom_app_bar.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);
  List<String> categories = [
    'Official organization',
    'NGOs',
    'UnBorder',
    'Others'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Column(
          children: [
            CustomAppBar(title: 'Category', onTap: () {}),
            const SizedBox(
              height: 20,
            ),
            getCategoryListView(categories),
          ],
        ),
      ),
    );
  }

  Widget getCategoryListView(List categories) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => getCategoryTile(categories[index]),
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 15,
            child: Divider(
              height: 1,
              color: kDividerColor,
            ),
          );
        },
        itemCount: categories.length,
        shrinkWrap: true,
      ),
    );
  }

  getCategoryTile(String categories) {
    return ListTile(
        onTap: () {},
        title:
        CustomText(categories, 16, 'Poppins', kBlackColor, FontWeight.w400),
        trailing: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage('images/check.png'),
            )));
  }
}
