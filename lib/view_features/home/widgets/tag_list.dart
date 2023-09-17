import 'package:flutter/material.dart';
import '../../../cores/utils/colors.dart';
import 'custom_border.dart';
import 'custom_text.dart';

class TagGridList extends StatelessWidget {
  List tags = ['All Tags', '#Urgent', '#Military Egyptian', '#New'];

  TagGridList({super.key});

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) {
      return CustomText(
          'notFoundData', 14, 'Poppins', kDarkGreyColor, FontWeight.w400);
    }
    return BorderShape(
      widget: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (context, i) => _buildTagTile(tags[i], context),
        itemCount: tags.length,
      ),
      valColor: Colors.white,
    );
  }

  _buildTagTile(String tagList, BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: kLightGreyColor,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(
            child: CustomText(
                '${tagList}', 12, 'Poppins', kDarkGreyColor, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
