
import 'package:flutter_test/flutter_test.dart';
import 'package:holiday/data/remote/response/holiday_response.dart';
import 'package:holiday/repository/holiday_repository_impl.dart';
import 'package:holiday/service/holiday_service_impl.dart';
import 'package:holiday/util/failure.dart';
import 'package:mocktail/mocktail.dart';

class MockHolidayRepository extends Mock implements HolidayRepositoryImpl {}

final HolidayResponse mockHolidaySuccess = HolidayResponse(
    totalDay: 15,
    totalDayLeft: 7,
    totalDayUsed: 8,
    leaveRequests: [
      LeaveRequests(status: 'approved', requestList: [
        RequestList(date: '2021-03-31', type: 'switch_holiday')
      ])
    ]);

final HolidayResponse mockHolidayFailed = HolidayResponse(
    totalDay: 15,
    totalDayLeft: 7,
    totalDayUsed: 8,
    leaveRequests: [
      LeaveRequests(status: 'canceled', requestList: [
        RequestList(date: '2021-03-31', type: 'switch_holiday')
      ])
    ]);

void main() {
  late HolidayRepositoryImpl mockHolidayRepository;

  setUp(() {
    mockHolidayRepository = MockHolidayRepository();
  });

  test(
      'given successful call when getting holiday response then return currect holiday',
      () async {
    when(() => mockHolidayRepository.getHoliday()).thenAnswer((invocation) {
      return Future.value(mockHolidaySuccess);
    });

    final holidayService = HolidayServiceImpl(mockHolidayRepository);

    final result = await holidayService.getHoliday();
    final holiday = result.getSuccess();

    expect(holiday, mockHolidaySuccess);
  });

  test('given failed call when getting holiday response then returnfailure',
      () async {
    when(() => mockHolidayRepository.getHoliday())
        .thenThrow(Failure(message: "no internet connection"));

    final holidayService = HolidayServiceImpl(mockHolidayRepository);

    final result = await holidayService.getHoliday();
    

    expect(result.getError()?.message, 'no internet connection');
  });
}
