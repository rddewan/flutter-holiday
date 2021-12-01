import 'package:holiday/data/remote/response/holiday_response.dart';
import 'package:holiday/repository/holiday_repository_impl.dart';

class StubHolidayRepository implements HolidayRepositoryImpl {
  @override
  Future<HolidayResponse> getHoliday() {
    return Future.value(HolidayResponse(
        totalDay: 15,
        totalDayLeft: 8,
        totalDayUsed: 7,
        leaveRequests: [
          LeaveRequests(
              status: 'pending',
              requestList: [RequestList(date: '2021-03-30', type: 'remote'),
              RequestList(date: '2021-03-29', type: 'personal_leave'),
              RequestList(date: '2021-03-28', type: 'personal_leave')
              ])
        ]));
  }
}
