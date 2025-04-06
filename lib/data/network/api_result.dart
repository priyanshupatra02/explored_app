class APIResult<T> {
  String status;
  T recordList;

  APIResult({
    required this.status,
    required this.recordList,
  });

  factory APIResult.fromJson(Map<String, dynamic> json, T recordList) => APIResult(
        status: json["status"].toString(),
        recordList: recordList,
      );
}
