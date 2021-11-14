import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday/data/remote/response/holiday_response.dart';


@immutable
class HolidayState {
  final AsyncValue<HolidayResponse> holiday;

  const HolidayState({
    required this.holiday,
  });

  HolidayState copyWith({AsyncValue<HolidayResponse>? holiday}) {
    return HolidayState(holiday: holiday ?? this.holiday);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HolidayState && other.holiday == holiday;
  }

  @override
  int get hashCode {
    return holiday.hashCode;
  }
}
