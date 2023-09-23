import 'package:flutter/material.dart';
import '../../home/widgets/custom_text.dart';

class EmptyContainer extends StatelessWidget {
  final Widget widget;
  final CustomText text;
  final Function()? onTap;

  const EmptyContainer({
    required this.widget,
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.0),
      ),
      color: Colors.white,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  widget,
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                    child: text,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
