import 'package:flutter/material.dart';
import '../../../cores/utils/colors.dart';
import 'custom_text.dart';
import 'mail_tile_view.dart';

class MailListView extends StatelessWidget {
  String title;
  List<Map<String, dynamic>> listLength;

  MailListView(this.title, this.listLength, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(bottom: 16, top: 16),
        itemBuilder: (BuildContext context, int index) {
          return Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: CustomText(
                  title, 20, 'Poppins', kBlackColor, FontWeight.w600),
              backgroundColor: Colors.transparent,
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: listLength.length,
                  itemBuilder: (context, index) {
                    return MailTile('mailList[index][index]');
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      thickness: 0,
                    );
                  },
                ),
              ],
            ),
          );
        });
  }
}
