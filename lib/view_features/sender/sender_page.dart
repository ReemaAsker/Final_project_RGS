import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/cores/helpers/api_response.dart';
import 'package:gsg_final_project_rgs/models/sender.dart';
import 'package:gsg_final_project_rgs/view_features/home/providers/category_provider.dart';
import 'package:gsg_final_project_rgs/view_features/new_inbox/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../../cores/utils/colors.dart';
import '../home/widgets/custom_text.dart';
import '../search/widgets/custom_search.dart';

class SenderPage extends StatelessWidget {
  SenderPage({Key? key}) : super(key: key);
  List senders = ['Sender 1', 'Sender 1'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightWhiteColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 16),
          child: Column(
            children: [
              CustomAppBar(title: 'Sender', onTap: () {}),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 8, right: 8, bottom: 16),
                child: CustomSearch(),
              ),
              const SizedBox(
                width: 16,
              ),
              const Divider(
                height: 0.5,
                color: kDividerColor,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 16, bottom: 16),
                    child: CustomText('"Sport" ', 15, 'Poppins', kBlackColor,
                        FontWeight.w500),
                  ),
                ],
              ),
              Consumer<CategoryProvider>(
                builder: (_, categoryProvider, __) {
                  if (categoryProvider.categoryList.status ==
                      DataStatus.LOADING) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (categoryProvider.categoryList.status ==
                      DataStatus.ERROR) {
                    return Center(
                      child: Text('${categoryProvider.categoryList..message}'),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                        itemCount: categoryProvider.categoryList.data!.length,
                        itemBuilder: (context, index) {
                          final category =
                              categoryProvider.categoryList.data![index];
                          return Column(
                            children: [
                              const Divider(
                                height: 0.5,
                                color: kDividerColor,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 24, bottom: 8),
                                    child: CustomText(
                                        categoryProvider
                                            .categoryList.data![index].name
                                            .toString(),
                                        13,
                                        'Poppins',
                                        kDarkGreyColor,
                                        FontWeight.w500),
                                  ),
                                  // Spacer(),
                                ],
                              ),
                              const Divider(
                                height: 0.5,
                                color: kDividerColor,
                              ),
                              getSenderListView(category.senders!),
                              const Divider(
                                height: 0.5,
                                color: kDividerColor,
                              ),
                              // Row(
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(
                              //           left: 8, right: 8, top: 24, bottom: 8),
                              //       child: CustomText('Other', 13, 'Poppins', kDarkGreyColor,
                              //           FontWeight.w500),
                              //     ),
                              //     // Spacer(),
                              //   ],
                              // ),
                              // const Divider(
                              //   height: 0.5,
                              //   color: kDividerColor,
                              // ),
                              // getSenderListView(senders),
                              // const Divider(
                              //   height: 0.5,
                              //   color: kDividerColor,
                              // ),
                            ],
                          );
                        }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getSenderListView(List<Sender> senders) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>
          getSenderTile(senders[index].name.toString()),
      separatorBuilder: (context, index) {
        return const Divider(
          height: 0.5,
          color: kDividerColor,
        );
      },
      itemCount: senders.length,
      shrinkWrap: true,
    );
  }

  getSenderTile(String senders) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Wrap(
        children: [
          const CircleAvatar(
            radius: 15,
            backgroundColor: kDarkGreyColor2,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          CustomText(senders, 16, 'Poppins', kBlackColor, FontWeight.w400),
        ],
      ),
      // title: CustomText(senders, 16, 'Poppins', kBlackColor, FontWeight.w400),
    );
    // return ListTile(
    //   onTap: () {},
    //   title: CustomText(senders, 16, 'Poppins', kBlackColor, FontWeight.w400),
    // );
  }
// }
// class SenderPage extends StatelessWidget {
//   SenderPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kLightWhiteColor,
//       // appBar: CustomAppBar(title: 'Sender', onTap: () {}),
//       body: Consumer<CategoryProvider>(
//         builder: (_, categoryProvider, __) {
//           if (categoryProvider.categoryList.status == DataStatus.LOADING) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (categoryProvider.categoryList.status == DataStatus.ERROR) {
//             return Center(
//               child: Text('${categoryProvider.categoryList.message}'),
//             );
//           } else if (categoryProvider.categoryList.status ==
//               DataStatus.COMPLETED) {
//             return ListView.builder(
//               itemCount: categoryProvider.categoryList.data!.length,
//               itemBuilder: (context, index) {
//                 final category = categoryProvider.categoryList.data![index];
//                 return Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: CustomSearch(),
//                     ),
//                     const Divider(
//                       height: 0.5,
//                       color: kDividerColor,
//                     ),
//                     CustomText(
//                       category.name.toString(),
//                       13,
//                       'Poppins',
//                       kDarkGreyColor,
//                       FontWeight.w500,
//                     ),
//                     const Divider(
//                       height: 0.5,
//                       color: kDividerColor,
//                     ),
//                     getSenderListView(category.senders),
//                     const Divider(
//                       height: 0.5,
//                       color: kDividerColor,
//                     ),
//                   ],
//                 );
//               },
//             );
//           } else {
//             // Handle other status cases here.
//             return const SizedBox();
//           }
//         },
//       ),
//     );
//   }

//   Widget getSenderListView(List<Sender>? senders) {
//     return ListView.separated(
//       physics: const NeverScrollableScrollPhysics(),
//       itemBuilder: (context, index) => getSenderTile(senders![index]),
//       separatorBuilder: (context, index) {
//         return const Divider(
//           height: 0.5,
//           color: kDividerColor,
//         );
//       },
//       itemCount: senders!.length,
//       shrinkWrap: true,
//     );
//   }

//   Widget getSenderTile(Sender sender) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: Wrap(
//         children: [
//           const CircleAvatar(
//             radius: 15,
//             backgroundColor: kDarkGreyColor2,
//             child: Icon(
//               Icons.person,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(
//             width: 8,
//           ),
//           CustomText(
//             sender.name.toString(),
//             16,
//             'Poppins',
//             kBlackColor,
//             FontWeight.w400,
//           ),
//         ],
//       ),
//     );
//   }
// }
}
