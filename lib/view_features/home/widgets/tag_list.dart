import 'package:flutter/material.dart';

import '../../../cores/utils/colors.dart';
import '../../../models/tag.dart';
import 'custom_border.dart';
import 'custom_text.dart';

class TagGridList extends StatefulWidget {
  List<Tag> tags;
  final ValueChanged<List<Tag>> onTagsSelected;

  TagGridList({required this.tags, required this.onTagsSelected, Key? key})
      : super(key: key);

  @override
  State<TagGridList> createState() => _TagGridListState();
}

class _TagGridListState extends State<TagGridList> {
  List<Tag> selectedTags = [];
  @override
  Widget build(BuildContext context) {
    //|| tags == null || tags.length == 0
    if (widget.tags.length == 0) {
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
            // print(tags[i].id);
            return _buildTagTile(widget.tags[i], context);
          },
          itemCount: widget.tags.length,
        ),
        valColor: Colors.white,
      );
    }
  }

  _buildTagTile(Tag tag, BuildContext context) {
    var isSelected = selectedTags.contains(tag);

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected ? selectedTags.remove(tag) : selectedTags.add(tag);
          widget.onTagsSelected(selectedTags);
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? kLightPrimaryColor : kLightGreyColor,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Center(
          child: CustomText("#${tag.name}", 12, 'Poppins',
              isSelected ? Colors.white : kDarkGreyColor, FontWeight.w600),
        ),
      ),
    );
  }
}
