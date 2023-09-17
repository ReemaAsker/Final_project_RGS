// import 'package:flutter/cupertino.dart';
// import 'package:gsg_final_project_rgs/cores/helpers/api_response.dart';

// import '../../../models/status.dart';
// import '../repositories/status_repo.dart';

// class StatusProvider extends ChangeNotifier {
//   late StatusRepo _statusRepo;
//   late ApiResponse<List<Status>> _statusListWithMails;
//   late ApiResponse<List<Status>> _statusListWithoutMails;
//   late ApiResponse<Status> _status;

//   ApiResponse<List<Status>> get statusListWithMails => _statusListWithMails;
//   ApiResponse<List<Status>> get statusListWithoutMails =>
//       _statusListWithoutMails;
//   ApiResponse<Status> get status => _status;

//   StatusProvider() {
//     _statusRepo = StatusRepo();
//     fetchStatusList(true);
//     fetchStatusList(false);
//   }

//   fetchStatusList(bool withMail) async {
//     if (withMail) {
//       _statusListWithMails = ApiResponse.loading('Fetching Categories');
//       notifyListeners();
//       try {
//         List<Status>? statuses =
//             await _statusRepo.fetchStatuses(withMail: withMail);
//         _statusListWithMails = ApiResponse.completed(statuses);
//         notifyListeners();
//       } catch (e) {
//         _statusListWithMails = ApiResponse.error(e.toString());
//         notifyListeners();
//       }
//     } else {
//       _statusListWithoutMails = ApiResponse.loading('Fetching Categories');
//       notifyListeners();
//       try {
//         List<Status>? statuses =
//             await _statusRepo.fetchStatuses(withMail: withMail);
//         _statusListWithoutMails = ApiResponse.completed(statuses);
//         notifyListeners();
//       } catch (e) {
//         _statusListWithoutMails = ApiResponse.error(e.toString());
//         notifyListeners();
//       }
//     }
//   }

//   fetchStatusWithMails({required int statusId}) async {
//     _status = ApiResponse.loading('Fetching Status Mails');
//     notifyListeners();
//     try {
//       Status? status =
//           await _statusRepo.fetchOneStatusWithMails(statusId: statusId);
//       _status = ApiResponse.completed(status);
//       notifyListeners();
//     } catch (e) {
//       _status = ApiResponse.error(e.toString());
//       notifyListeners();
//     }
//   }
// }
