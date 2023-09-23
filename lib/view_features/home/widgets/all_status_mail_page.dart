import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/models/status.dart';
import 'package:gsg_final_project_rgs/view_features/home/providers/status_provider.dart';
import 'package:gsg_final_project_rgs/view_features/home/widgets/custom_text.dart';
import 'package:gsg_final_project_rgs/view_features/home/widgets/mail_tile_view.dart';
import 'package:provider/provider.dart';

import '../../../cores/helpers/api_response.dart';
import '../../../cores/utils/colors.dart';

class StatusMailsPage extends StatefulWidget {
  final StatusElement status;
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SafeArea(
          child: Consumer<StatusProvider>(builder: (_, statusProvider, __) {
            if (widget.status.mailsCount == 0) {
              return Center(
                child: Text(
                  'No ${widget.status.name} mails',
                  style: TextStyle(color: Colors.black),
                ),
              );
            }
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
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // print("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");
                // print(statusProvider.status!.data!.mails![index].subject);
                // return Theme(
                //   data: Theme.of(context)
                //       .copyWith(dividerColor: Colors.transparent),
                //   child: MailTile(statusProvider.status!.data!.mails![index]),
                //   // child: ListTile(
                //   //   title: Text("Sally $index"),
                //   // ),
                //
                //   /// MailTile
                //   //   child: MailTile(
                //   //       statusProvider.status!.data!.mails![index].mail!),
                // );
                return GestureDetector(
                  onTap: () => {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(22))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 9, left: 16, right: 14, top: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Color(int.parse(widget.status.color!)),
                                  radius: 10,
                                ),
                                // const Spacer(),
                                const SizedBox(
                                  width: 9,
                                ),
                                CustomText(
                                    widget.status.mails?[index].sender!.name ??
                                        "no sender ",
                                    18.0,
                                    'Poppins',
                                    kBlackColor,
                                    FontWeight.w600),
                                const Spacer(),

                                const SizedBox(
                                  width: 8,
                                ),
                                // const Image(
                                //   image: AssetImage('images/arrow_right.png'),
                                // ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 28),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CustomText(
                                      "Created At:  ${widget.status.mails![index].createdAt!}",
                                      10,
                                      'Poppins',
                                      kHintGreyColor,
                                      FontWeight.w400),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CustomText(
                                      widget.status.mails![index].subject ??
                                          "No subject",
                                      14.0,
                                      'Poppins',
                                      kLightBlackColor,
                                      FontWeight.w400),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomText(
                                      widget.status.mails![index].description ??
                                          "No description",
                                      14.0,
                                      'Poppins',
                                      kHintGreyColor,
                                      FontWeight.w400),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Visibility(
                                    ////////////////////////////null check
                                    visible: widget.status.mails![index].tags!
                                            .isNotEmpty
                                        ? true
                                        : false,
                                    child: buildTagHorizontalList(
                                        widget.status.mails![index]),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Visibility(
                                    visible: widget.status.mails![index]
                                            .attachments!.isNotEmpty
                                        ? true
                                        : false,
                                    child: SizedBox(
                                      height: 36,
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: widget.status.mails![index]
                                            .attachments!.length,
                                        itemBuilder: (ctx, i) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: Colors.green,

                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              // image: DecorationImage(
                                              //     image: NetworkImage(
                                            ), //         "https://palmail.gsgtt.tech/storage/${myMail.attachments![index]['image']}"))),
                                            child: Image(
                                              image: NetworkImage(
                                                "https://palmail.gsgtt.tech/storage/${widget.status.mails![index].attachments![i].image}",
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          );
                                          // );
                                          // return ImageCard(
                                          //     attachments[0], 36, 36);
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            width: 10,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1,
                );
              },
              itemCount: 10,
              //int.parse(statusProvider.status!.data!.mailsCount!)
              //!.data!.mailsCount!
            );
          }),
        ),
      ),
    );
  }
}
