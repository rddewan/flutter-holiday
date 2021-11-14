import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday/data/remote/response/holiday_response.dart';
import 'package:holiday/service/holiday_service_impl.dart';
import 'package:holiday/state/holiday_state.dart';


//provider
final holidayControllerProvider =
    StateNotifierProvider.autoDispose<HolidayController, HolidayState>((ref) {
  var controller = HolidayController(
      HolidayState(holiday: AsyncValue.data(HolidayResponse.initial())),
      ref.watch(holidayServiceProvider));

  controller.getHoliday();
  return controller;
});

class HolidayController extends StateNotifier<HolidayState> {
  HolidayController(HolidayState state, this._holidayServiceImpl)
      : super(state);

  final HolidayServiceImpl _holidayServiceImpl;

  Future<void> getHoliday() async {
    state = state.copyWith(holiday: const AsyncValue.loading());
    final result = await _holidayServiceImpl.getHoliday();

    result.when((error) {
      state = state.copyWith(holiday: AsyncValue.error(error));
    }, (holiday) {
      state = state.copyWith(holiday: AsyncValue.data(holiday));
    });
  }
}
