import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  double height;
  double width;
  String image;

  ImageCard(
      this.image,
      this.height,
      this.width,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
        margin: const EdgeInsets.only(right: 8),
        child: Image.network(
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
