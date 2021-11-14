

import 'package:holiday/data/remote/response/holiday_response.dart';

abstract class HolidayRepository {
  Future<HolidayResponse> getHoliday();
}