import 'package:flutter/material.dart';
import '../../../cores/utils/colors.dart';
import 'custom_text.dart';

class StatusTile extends StatelessWidget {
  var status;
  Color color;

  StatusTile(this.status, this.color);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0),
          ),
          color: Colors.white,
          elevation: 1,
          child: Container(
            width: 161,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8, left: 16, right: 16, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: color,
                        radius: 10,
                      ),
                      const Spacer(),
                      CustomText(
                          '9', 20.0, 'Poppins', kBlackColor, FontWeight.w600),
                    ],
                  ),
                  const SizedBox(height: 14),
                  CustomText('$status', 18.0, 'Poppins', kHintGreyColor,
                      FontWeight.w600)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
