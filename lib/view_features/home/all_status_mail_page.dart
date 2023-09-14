import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/models/status.dart';
import 'package:gsg_final_project_rgs/view_features/home/providers/status_provider.dart';
import 'package:gsg_final_project_rgs/view_features/home/widgets/mail_tile_view.dart';
import 'package:provider/provider.dart';

import '../../cores/helpers/api_response.dart';

class StatusMailsPage extends StatefulWidget {
  final Status status;
  const StatusMailsPage({super.key, required this.status});

  @override
  State<StatusMailsPage> createState() => _StatusMailsPageState();
}

class _StatusMailsPageState extends State<StatusMailsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<StatusProvider>(context)
    //     .fetchStatusWithMails(statusId: widget.status.id!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("${widget.status.name} "),
      ),
      body: SafeArea(
        child: Consumer<StatusProvider>(builder: (_, statusProvider, __) {
          if (statusProvider.status!.status == DataStatus.LOADING) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (statusProvider.status!.status == DataStatus.ERROR) {
            return Center(
              child: Text('${statusProvider.status!.message}'),
            );
          }
          return ListView.separated(
            shrinkWrap: false,
            itemBuilder: (context, index) {
              // print("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");
              // print(statusProvider.status!.data!.mails![index].subject);
              return Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: MailTile(statusProvider.status!.data!.mails![index]),
                // child: ListTile(
                //   title: Text("Sally $index"),
                // ),

                /// MailTile
                //   child: MailTile(
                //       statusProvider.status!.data!.mails![index].mail!),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 1,
              );
            },
            itemCount: int.parse(statusProvider.status!.data!.mailsCount!),
          );
        }),
      ),
    );
  }
}
