// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/cores/helpers/api_response.dart';
import 'package:gsg_final_project_rgs/view_features/home/repositories/status_repo.dart';

import '../../../models/status.dart';
// import '../repositories/status_repo.dart';

class StatusProvider extends ChangeNotifier {
  late StatusRepo _statusRepo;
  late ApiResponse<List<StatusElement>> _statusListWithMails;
  late ApiResponse<List<StatusElement>> _statusListWithoutMails;
  late ApiResponse<StatusElement> _status;

  ApiResponse<List<StatusElement>> get statusListWithMails =>
      _statusListWithMails;
  ApiResponse<List<StatusElement>> get statusListWithoutMails =>
      _statusListWithoutMails;
  ApiResponse<StatusElement>? get status => _status;

  StatusProvider() {
    _statusRepo = StatusRepo();
    fetchStatusList(true);
    fetchStatusList(false);
    // fetchStatusWithMails(statusId: 0);
  }

  fetchStatusList(bool withMail) async {
    if (withMail) {
      _statusListWithMails = ApiResponse.loading('Fetching Categories');
      notifyListeners();
      try {
        List<StatusElement>? statuses =
            await _statusRepo.fetchStatuses(withMail: withMail);
        _statusListWithMails = ApiResponse.completed(statuses);
        notifyListeners();
      } catch (e) {
        _statusListWithMails = ApiResponse.error(e.toString());
        notifyListeners();
        rethrow;
      }
    } else {
      _statusListWithoutMails = ApiResponse.loading('Fetching Statuses');
      notifyListeners();
      try {
        List<StatusElement>? statuses =
            await _statusRepo.fetchStatuses(withMail: withMail);
        _statusListWithoutMails = ApiResponse.completed(statuses);
        notifyListeners();
      } catch (e) {
        _statusListWithoutMails = ApiResponse.error(e.toString());
        notifyListeners();
        rethrow;
      }
    }
  }

  fetchStatusWithMails({required int statusId}) async {
    _status = ApiResponse.loading('Fetching Status Mails');
    notifyListeners();
    try {
      StatusElement? status =
          await _statusRepo.fetchOneStatusWithMails(statusId: statusId);
      _status = ApiResponse.completed(status);
      notifyListeners();
    } catch (e) {
      _status = ApiResponse.error(e.toString());
      notifyListeners();
      rethrow;
    }
  }
}
