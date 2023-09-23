import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/view_features/search/search_repository.dart';

import '../../cores/utils/colors.dart';
import '../../models/mail.dart';
import '../home/widgets/custom_text.dart';
import '../home/widgets/mail_tile_view.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // get orgName => "org name";
  late TextEditingController _textEditingController;
  final _formKey = GlobalKey<FormState>();
  Future<List<MailClass>?>? searchResponse;

  late String searchQuery;
  updateUI() {
    setState(() {
      searchResponse = search();
    });
  }

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<List<MailClass>?> search() async {
    Map<String, dynamic> body = {'name': searchQuery};
    return SearchRepo().search(searchQuery: searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightWhiteColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 16),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      const Image(image: AssetImage('images/arrow_left.png')),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomText('Home', 18, 'Poppins', kLightPrimaryColor,
                          FontWeight.w400),
                    ],
                    //),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.search),
                    ),
                    controller: _textEditingController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                        searchResponse = search();
                        updateUI();
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  width: 100,
                ),
                FutureBuilder(
                  future: searchResponse,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        // scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return MailTile(snapshot.data![index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 30,
                          );
                        },
                      );
                    }
                    return Center(
                      child: Text("no data"),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class MyFilterWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () async {
//           await showModalBottomSheet<void>(
//             context: context,
//             isScrollControlled: true,
//             shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//             builder: (BuildContext context) {
//               return FractionallySizedBox(
//                 heightFactor: 0.9,
//                 child: FilterPage(),
//               );
//             },
//           );
//         },
//         child: const Image(image: AssetImage('images/filter.png')));
//   }
// }
