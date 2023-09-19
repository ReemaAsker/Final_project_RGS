// import 'package:gsg_final_project_rgs/models/status.dart';

import 'package:gsg_final_project_rgs/models/status.dart';

import '../../../cores/helpers/api_base_helper.dart';
import '../../../cores/helpers/token_helper.dart';
import '../../../cores/utils/constants.dart';

class StatusRepo {
  final ApiBaseHelper _helper = ApiBaseHelper();
  String? userToken = getToken()!.token;
  // String userToken = "265|ksxcuVB3yjlAc44e76tblGvsoae68HxNiyjuIW7O";

  Future<List<StatusElement>?> fetchStatuses({required bool withMail}) async {
    String url = satatusUrl + "?mail=$withMail";
    // print("url ");
    final response = await _helper.get(url,
        {'Authorization': 'Bearer $userToken', 'Accept': 'application/json'});
    // List<StatusElement>? result = Status.fromJson(response).statuses;

    return Status.fromJson(response).statuses;
  }

  Future<StatusElement?> fetchOneStatusWithMails(
      {required int statusId}) async {
    String url = satatusUrl + "/$statusId?mail=true";

    final response = await _helper.get(url, {
      'Authorization': 'Bearer $userToken',
    });

//     Status? statuse = Status.fromJson(response['status']);

//     return statuse;
//   }

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
}
