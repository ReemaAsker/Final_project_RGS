class ApiResponse<T> {
  _Status status;
  T? data;
  String? message;

  ApiResponse.loading(this.message) : status = _Status.LOADING;
  ApiResponse.completed(this.data) : status = _Status.COMPLETED;
  ApiResponse.error(this.message) : status = _Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum _Status { LOADING, COMPLETED, ERROR }
