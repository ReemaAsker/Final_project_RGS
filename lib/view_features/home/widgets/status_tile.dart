import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/models/status.dart';
import 'package:gsg_final_project_rgs/view_features/home/all_status_mail_page.dart';
import 'package:provider/provider.dart';

import '../../../cores/utils/colors.dart';
import '../providers/status_provider.dart';
import 'custom_text.dart';

class StatusTile extends StatelessWidget {
  StatusElement status;
  String color;
  StatusTile(this.status, this.color);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<StatusProvider>(context, listen: false)
            .fetchStatusWithMails(statusId: status.id!);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return StatusMailsPage(
            status: status,
          );
        }));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
        ),
        color: Colors.white,
        elevation: 1,
        child: Container(
          constraints: BoxConstraints(maxHeight: 1, maxWidth: 10),
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(int.parse(color)),
                    radius: 10,
                  ),
                  const Spacer(),
                  CustomText(status.mailsCount ?? '0', 20.0, 'Poppins',
                      kBlackColor, FontWeight.w600),
                ],
              ),
              const SizedBox(height: 14),
              CustomText('${status.name}', 18.0, 'Poppins', kHintGreyColor,
                  FontWeight.w600)
            ],
          ),
        ),
      ),
    );
  }
}
