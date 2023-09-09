import 'package:flutter/material.dart';
import '../../../cores/utils/colors.dart';
import 'custom_text.dart';

class NGOsWidget extends StatelessWidget {
  List<String> ngosList = ['pal','reform','r','y','pal','reform','r','y','pal','reform','r','y'];
  NGOsWidget( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 1 ,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 16),
        itemBuilder: (BuildContext context, int index) {
          return Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Row(
                children: [
                  CustomText('NGOs', 20, 'Poppins', kBlackColor,
                      FontWeight.w600),
                  const SizedBox(width: 210,),
                  CustomText(
                      '${ngosList.length}',
                      12.0,
                      'Poppins',
                      kHintGreyColor,
                      FontWeight.w400),
                ],
              ),
              backgroundColor: Colors.transparent,
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: ngosList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(22))),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 9, left: 16, right: 14, top: 10),
                        child:
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          const Row(
                            children: [
                              // const Spacer(),
                              SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 37),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText('${ngosList[index]}', 14.0, 'Poppins', kLightBlackColor,
                                    FontWeight.w400),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                    );
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
