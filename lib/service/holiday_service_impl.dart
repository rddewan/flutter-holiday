import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday/data/remote/response/holiday_response.dart';
import 'package:holiday/repository/holiday_repository_impl.dart';
import 'package:holiday/service/holiday_service.dart';
import 'package:holiday/util/failure.dart';
import 'package:multiple_result/multiple_result.dart';


//provide a HolidayServiceImpl
final holidayServiceProvider = Provider<HolidayServiceImpl>((ref) {
  final repository = ref.watch(provideHolidayRepository);

  return HolidayServiceImpl(repository);
});

class HolidayServiceImpl implements HolidayService {
  HolidayServiceImpl(
    this._holidayRepositoryImpl,
  );

  final HolidayRepositoryImpl _holidayRepositoryImpl;

  @override
  Future<Result<Failure, HolidayResponse>> getHoliday() async {
    try {
      final holiday = await _holidayRepositoryImpl.getHoliday();
      return Success(holiday);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }
}
