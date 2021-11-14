
import 'package:holiday/data/remote/response/holiday_response.dart';
import 'package:holiday/util/failure.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class HolidayService {
  Future<Result<Failure, HolidayResponse>> getHoliday();
}
