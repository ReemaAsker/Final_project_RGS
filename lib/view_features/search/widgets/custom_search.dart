import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/models/sender.dart';
import 'package:gsg_final_project_rgs/view_features/home/repositories/category_repo.dart';
import '../../../cores/utils/colors.dart';

class CustomSearch extends StatelessWidget {
  CustomSearch({
    Key? key,
  }) : super(key: key);
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onEditingComplete: () {
        print(_textEditingController.text);

        // CategoryRepo().fetchCategoriesList().then(
        //   (value) {
        //     // print('33333333333333333333');
        //     // print(value);
        //     // List<Sender>? senders = value![0].senders;
        //     // senders?.forEach((sender) {
        //     //   print('Sender Name: ${sender.name}');
        //     //   print('Sender Mobile: ${sender.mobile}');
        //     //   if (sender.address != null) {
        //     //     print('Sender Address: ${sender.address}');
        //     //   }
        //     //   //   print('');
        //     // });
        //     // print(
        //     //     '${value![0].senders}\n${value![1].name}\n${value![2].name}\n${value![3].name}');
        //   },
        // );
      },
      controller: _textEditingController,
      keyboardType: TextInputType.text,
      onSubmitted: (value) {},
      decoration: InputDecoration(
        fillColor: kLightGreyColor,
        filled: true,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 1, color: kGreyColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 1, color: Colors.transparent)),
        hintText: 'Search',
        hintStyle: const TextStyle(
            color: kHintGreyColor, fontSize: 12, fontFamily: 'Poppins'),
        prefixIcon: Image.asset('images/search.png'),
        suffixIcon: TextButton(
          // Button padding
          onPressed: () {
            _textEditingController.clear();
          },
          child: Icon(
            Icons.cancel,
            color: kDarkGreyColor3,
            size: 30,
          ),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ),
      ),
    );
  }
}
