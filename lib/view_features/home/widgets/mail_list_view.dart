import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/models/mail.dart';

import '../../../cores/utils/colors.dart';
import 'custom_text.dart';
import 'mail_tile_view.dart';

class MailListView extends StatelessWidget {
  String title;
  List<MailClass> mailsList;
  MailListView(this.title, this.mailsList, {Key? key}) : super(key: key);

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
                  itemCount: mailsList.length,
                  itemBuilder: (context, index) {
                    return MailTile(mailsList[index]);
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
