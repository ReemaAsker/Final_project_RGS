import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/view_features/Profile/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../cores/helpers/token_helper.dart';
import '../../cores/utils/colors.dart';
import '../../cores/utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController userNameCtr;
  @override
  void initState() {
    userNameCtr = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile Page"),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,

            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                      useSafeArea: true,
                      // isScrollControlled: true,
                      backgroundColor: kLightWhiteColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(22),
                            topRight: Radius.circular(22)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        // return NewInboxPage();
                        return ProfilePictureImagePicker();
                      });
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 10),
                      borderRadius: BorderRadius.circular(22)),
                  child: Image.network(
                    getToken()!.user!.image == null
                        ? "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png"
                        : "https://palmail.gsgtt.tech/storage/${getToken()!.user!.image}",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                child: TextFormField(
                  controller: userNameCtr,
                  // initialValue: ,
                  decoration:
                      InputDecoration(hintText: "@${getToken()!.user!.name}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<int> uploadImage(File file, mailId) async {
  String token = await getToken()!.token;
  var request = http.MultipartRequest("POST", Uri.parse(attachmentUrl));
//create multipart using filepath, string or bytes
  var pic = await http.MultipartFile.fromPath('image', file.path);
  request.fields['mail_id'] = mailId.toString();
  request.fields['title'] = 'image_${DateTime.now()}';
//add multipart to request
  request.files.add(pic);
  request.headers
      .addAll({'Accept': 'application/json', 'Authorization': 'Bearer $token'});
  var response = await request.send();

//Get the response from the server
  var responseData = await response.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);
  print(responseString);
  return response.statusCode;
}

/////////////////////////////////////////////////////////////
