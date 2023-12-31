import 'package:flutter/material.dart';
import '../../cores/utils/colors.dart';
import '../new_inbox/widgets/custom_app_bar.dart';
import '../home/widgets/custom_border.dart';
import '../home/widgets/custom_text.dart';

class StatusPage extends StatelessWidget {
  StatusPage({Key? key}) : super(key: key);
  List statusList = ['Inbox', 'Pending', 'In Progress', 'Completed'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Column(
        children: [
          CustomAppBar(title: 'Status', onTap: () {}),
          const SizedBox(
            height: 20,
          ),
          BorderShape(
            widget: Column(
              children: [
                _buildAddStatus(),
                Container(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildStatusListTile(index, statusList),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                      child: Divider(
                        height: 1,
                        color: kDividerColor,
                      ),
                    ),
                    itemCount: statusList.length,
                    shrinkWrap: true,
                  ),
                )
              ],
            ),
            valColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Visibility _buildAddStatus() {
    return Visibility(
      visible: true,
      child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: const Text(
                'Add Status',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color: kLightPrimaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Image(
                image: AssetImage('images/edit.png'),
              ),
              color: Colors.grey,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

ListTile buildStatusListTile(int index, List statusList) {
  return ListTile(
    onTap: () {},
    leading: Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.red),
    ),
    title: CustomText(
        statusList[index], 16, 'Poppins', kBlackColor, FontWeight.w400),
    trailing: IconButton(
      onPressed: () {},
      icon: Image.asset('images/check.png'),
    ),
  );
}
