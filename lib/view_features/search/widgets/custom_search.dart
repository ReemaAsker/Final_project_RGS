import 'package:flutter/material.dart';

import '../../../cores/utils/colors.dart';
import '../search_repository.dart';

class CustomSearch extends StatelessWidget {
  CustomSearch({
    Key? key,
  }) : super(key: key);
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      keyboardType: TextInputType.text,
      onSubmitted: (value) {
        SearchRepo searchRepo = SearchRepo();
        searchRepo.search(searchQuery: "bbb");
      },
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
