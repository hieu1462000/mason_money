class ListModelResponse<T> {
  final int status;
  final String? message;
  final List<T>? data;

  ListModelResponse({
    required this.status,
    this.message,
    this.data,
  });

  factory ListModelResponse.fromMap(
      Map<String, dynamic> map,
      Function(Map<String, dynamic> map) fromMap,
      ) {
    return ListModelResponse(
      status: map['status']?.toInt() ?? 0,
      message: map.containsKey("message") ? map['message'] : null,
      data: map.containsKey("data") && map["data"] != null
          ? List<T>.from(map['data']?.map((x) => fromMap(x)))
          : null,
    );
  }

  @override
  String toString() {
    return 'StoreResponse(status: $status, message: $message, data: $data)';
  }
}