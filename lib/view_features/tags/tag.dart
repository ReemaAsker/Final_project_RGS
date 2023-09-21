import 'package:gsg_final_project_rgs/cores/helpers/api_response.dart';
import 'package:gsg_final_project_rgs/custom_widgets/custom_snackbar.dart';
import 'package:gsg_final_project_rgs/models/tag.dart';
import 'package:gsg_final_project_rgs/view_features/home/providers/tags_provider.dart';
import 'package:gsg_final_project_rgs/view_features/home/repositories/tags_repo.dart';
import 'package:gsg_final_project_rgs/view_features/home/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../cores/utils/colors.dart';
import 'package:flutter/material.dart';
import '../new_inbox/widgets/custom_app_bar.dart';
import '../home/widgets/custom_border.dart';
import '../home/widgets/tag_list.dart';

class TagsPage extends StatefulWidget {
  TagsPage({Key? key}) : super(key: key);

  @override
  State<TagsPage> createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {
  TextEditingController addController = TextEditingController();
  late TagGridList tagList;
  List<Tag> selectedTags = [];

  // onEditingComplete() async {
  //   if (addController.text.isNotEmpty) {
  //     TagRepo()
  //         .create_Tag(Tag(
  //       name: addController.text,
  //       createdAt: DateTime.now().toString(),
  //       updatedAt: DateTime.now().toString(),
  //     ))
  //         .then((value) {
  //       My_snackBar.showSnackBar(
  //         context,
  //         '${value.data!["message"]} (${addController.text})',
  //         value.data == null ? Colors.red : Colors.green,
  //       );

  //       if (value.data != null) {
  //         Tag newTag = Tag.fromJson(value.data!["tag"]);
  //         // Navigator.pop(context, newTag);
  //         // Navigator.pop(context, x);

  //         selectedTags.add(newTag);
  //         setState(() {});
  //       }
  //     });
  //   }
  // }

//
  @override
  Widget build(BuildContext context) {
    List<Tag> tags = [
      Tag(
          name: '#new tag',
          createdAt: DateTime.now().toString(),
          id: 1,
          updatedAt: DateTime.now().toString()),
      Tag(name: '#secoundTag')
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            children: [
              CustomAppBar(
                  title: 'Tags',
                  onTap: () {
                    setState(() {});
                    Navigator.pop(context, selectedTags);
                  }),
              Consumer<TagsProvider>(
                builder: (_, tagProvider, __) {
                  tagList = TagGridList(
                      tags: tagProvider.allTagsList.data!); //new tag not work
                  selectedTags = tagList.getSelectedTag();
                  if (tagProvider.allTagsList.status == DataStatus.LOADING) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (tagProvider.allTagsList.status == DataStatus.ERROR) {
                    return Center(
                      child: Text('${tagProvider.allTagsList..message}'),
                    );
                  }

                  return Visibility(
                    visible: tagProvider.allTagsList.data!.isNotEmpty,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: CustomText('Tags', 20, 'Poppins', kBlackColor,
                              FontWeight.w600),
                        ),
                        // TagGridList tagList = TagGridList(tags: tagProvider.allTagsList.data!);
                        tagList
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(
                height: 20,
              ),
              Consumer<TagsProvider>(
                builder: (_, tagProvider, __) {
                  return BorderShape(
                      widget: TextField(
                        onEditingComplete: () {
                          if (addController.text.isNotEmpty) {
                            tagProvider
                                .createTag(name: addController.text)
                                .then((value) {
                              My_snackBar.showSnackBar(
                                context,
                                '${value.data!["message"]} (${addController.text})',
                                value.data == null ? Colors.red : Colors.green,
                              );

                              // if (value.data != null) {
                              //   Tag newTag = Tag.fromJson(value.data!["tag"]);
                              //   // Navigator.pop(context, newTag);
                              //   // Navigator.pop(context, x);

                              //   selectedTags.add(newTag);
                              //   setState(() {});
                              // }
                            });
                          }
                        },
                        controller: addController,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: kBlackColor),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add New Tag..',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: kHintGreyColor),
                        ),
                      ),
                      valColor: Colors.white,
                      onTap: () {});
                },
              ),
              // ElevatedButton(onPressed: createNewTag, child: Icon(Icons.tag))
            ],
          ),
        ),
      ),
    );
  }
}
