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
  FocusNode _textFieldFocus = FocusNode();
  List<Tag> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            children: [
              CustomAppBar(
                  title: 'Tags',
                  onTap: () {
                    Navigator.pop(context, selectedTags);
                  }),
              Consumer<TagsProvider>(
                builder: (_, tagProvider, __) {
                  if (tagProvider.allTagsList.status == DataStatus.LOADING) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (tagProvider.allTagsList.status ==
                      DataStatus.ERROR) {
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
                        TagGridList(
                          tags: tagProvider.allTagsList.data!,
                          onTagsSelected: (tags) {
                            setState(() {
                              selectedTags = tags;
                            });
                          },
                        )
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
                        focusNode: _textFieldFocus,
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
                              _textFieldFocus.unfocus();

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
