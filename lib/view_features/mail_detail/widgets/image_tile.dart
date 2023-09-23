import 'package:flutter/material.dart';
import '../../../cores/utils/colors.dart';
import '../../home/widgets/custom_text.dart';
import 'ImageCard.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: kRedColor,
          radius: 12,
          child: Image(
            image: AssetImage('images/delete.png'),
          ),
        ),
        const SizedBox(width: 16),
        ImageCard(
            'profiles/o7vKlSNQpAzfK6btul8S9hHmqWo7hUqcVaks5vrv.png', 32, 40),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Row(
                children: [
                  CustomText(
                      'Image', 16, 'Poppins', kBlackColor, FontWeight.w400),
                  const Spacer(),
                  const Image(
                    image: AssetImage('images/arrange.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(
                height: 2,
                color: kDividerColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
