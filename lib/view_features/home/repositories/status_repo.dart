import 'package:gsg_final_project_rgs/models/status.dart';

import '../../../cores/helpers/api_base_helper.dart';
import '../../../cores/helpers/token_helper.dart';
import '../../../cores/utils/constants.dart';

class StatusRepo {
  final ApiBaseHelper _helper = ApiBaseHelper();
  String? userToken = getToken()!.token;
  // String userToken = "265|ksxcuVB3yjlAc44e76tblGvsoae68HxNiyjuIW7O";

  Future<List<Status>?> fetchStatuses({required bool withMail}) async {
    String url = satatusUrl + "?mail=$withMail";
    // print("url ");
    final response = await _helper.get(url,
        {'Authorization': 'Bearer $userToken', 'Accept': 'application/json'});
    // print("In fetchStatusesWithMail//////////////////////////////////");
    // print(response);
    List<Status>? result = StatusResponse.fromJson(response).statuses;
    // print("000000000000000000000000");
    // print(result![2].name);
    return StatusResponse.fromJson(response).statuses;
  }

  // Future<List<Status>?> fetchStatusesWithMails() async {
  //   String url = satatusUrl + "?mail=true";
  //   final response = await _helper.get(url, {
  //     'Authorization': 'Bearer $userToken',
  //   });
  //   print("In fetchStatusesWithMail//////////////////////////////////");
  //   // print(response);
  //   List<Status>? statuses = StatusResponse.fromJson(response).statuses;
  //   // print("*************************************");
  //   // print(statuses![0].mailsCount);
  //   return statuses;
  // }

  Future<Status?> fetchOneStatusWithMails({required int statusId}) async {
    String url = satatusUrl + "/$statusId?mail=true";
    // print(
    //     "*****************************************************************fetchOneStatusWithMails");
    final response = await _helper.get(url, {
      'Authorization': 'Bearer $userToken',
    });

    Status? statuse = Status.fromJson(response['status']);

    return statuse;
  }

  // ممكن استغنى عنها واستخدم الدالةfetchStatusMails(int statusId)  ولما استخدمها اجيب طولها
  Future<int?> statusMailsCount(int statusId) async {
    await fetchOneStatusWithMails(statusId: statusId).then((value) {
      // print(value!.mailsCount);
      return value!.mailsCount;
    }).catchError(() {
      return null;
    });
  }
}
