import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BorderShape extends StatelessWidget {
  final Widget widget;
  final Color valColor;
  final Function()? onTap;
  const BorderShape(
      {Key? key, required this.widget, required this.valColor, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            color: valColor,
            borderRadius: const BorderRadius.all(Radius.circular(22))),
        child: widget,
      ),
    );
  }
}
