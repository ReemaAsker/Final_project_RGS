import 'package:flutter/material.dart';

import '../../../cores/utils/colors.dart';
import '../../../models/tag.dart';
import 'custom_border.dart';
import 'custom_text.dart';

class TagGridList extends StatelessWidget {
  List<Tag> tags;
  TagGridList({required this.tags, super.key});
  @override
  Widget build(BuildContext context) {
    //|| tags == null || tags.length == 0
    if (tags.length == 0) {
      return CustomText(
          'notFoundData', 14, 'Poppins', kDarkGreyColor, FontWeight.w400);
    } else {
      return BorderShape(
        widget: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 5 / 1.8,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12),
          itemBuilder: (context, i) {
            print(i);
            return _buildTagTile("#${tags[i].name}", context);
          },
          itemCount: tags.length,
        ),
        valColor: Colors.white,
      );
    }
  }

  _buildTagTile(String tagName, BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
            color: kLightGreyColor,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Center(
          child: CustomText(
              '${tagName}', 12, 'Poppins', kDarkGreyColor, FontWeight.w600),
        ),
      ),
    );
  }
}
