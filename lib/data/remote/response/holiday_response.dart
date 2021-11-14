class HolidayResponse {
  HolidayResponse({
    required this.totalDay,
    required this.totalDayLeft,
    required this.totalDayUsed,
    required this.leaveRequests,
  });
  late final int totalDay;
  late final int totalDayLeft;
  late final int totalDayUsed;
  late final List<LeaveRequests> leaveRequests;

  HolidayResponse.initial()
      : totalDay = 0,
        totalDayLeft = 0,
        totalDayUsed = 0,
        leaveRequests = [];

  HolidayResponse.fromJson(Map<String, dynamic> json) {
    totalDay = json['total_day'];
    totalDayLeft = json['total_day_left'];
    totalDayUsed = json['total_day_used'];
    leaveRequests = List.from(json['leave_requests'])
        .map((e) => LeaveRequests.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total_day'] = totalDay;
    _data['total_day_left'] = totalDayLeft;
    _data['total_day_used'] = totalDayUsed;
    _data['leave_requests'] = leaveRequests.map((e) => e.toJson()).toList();
    return _data;
  }
}

class LeaveRequests {
  LeaveRequests({
    required this.status,
    required this.requestList,
  });
  late final String status;
  late final List<RequestList> requestList;

  LeaveRequests.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    requestList = List.from(json['request_list'])
        .map((e) => RequestList.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['request_list'] = requestList.map((e) => e.toJson()).toList();
    return _data;
  }
}

class RequestList {
  RequestList({
    required this.date,
    required this.type,
  });
  late final String date;
  late final String type;

  RequestList.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['type'] = type;
    return _data;
  }
}
