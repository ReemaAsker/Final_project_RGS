// import '../../cores/utils/colors.dart';
// import 'package:flutter/material.dart';
// import '../new_inbox/widgets/custom_app_bar.dart';
// import '../home/widgets/custom_border.dart';
// import '../home/widgets/tag_list.dart';

// class TagsPage extends StatelessWidget {
//   TagsPage({Key? key}) : super(key: key);
//   TextEditingController addController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     List tags = ['a','b'];

//     return Container(
//       padding: const EdgeInsets.only(right: 16, left: 16),
//       child: Column(
//         children: [
//           CustomAppBar(
//               title: 'Tags',
//               onTap: () {
//               }),
//           TagGridList(),
//           const SizedBox(
//             height: 20,
//           ),
//           BorderShape(
//               widget: TextField(
//                 controller: addController,
//                 style: const TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontFamily: 'Poppins',
//                     fontSize: 12,
//                     color: kBlackColor),
//                 decoration: const InputDecoration(
//                   border: InputBorder.none,
//                   hintText: 'Add New Tag..',
//                   hintStyle: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontFamily: 'Poppins',
//                       fontSize: 16,
//                       color: kHintGreyColor),
//                 ),
//               ),
//               valColor: Colors.white,
//               onTap: () {
//               }),
//         ],
//       ),
//     );
//   }
// }

