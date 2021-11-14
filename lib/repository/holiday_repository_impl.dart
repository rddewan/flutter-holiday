import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday/data/remote/dio_provider.dart';
import 'package:holiday/data/remote/response/holiday_response.dart';
import 'package:holiday/repository/holiday_repository.dart';
import 'package:holiday/util/failure.dart';

//HolidayRepositoryImpl provider
final provideHolidayRepository = Provider<HolidayRepositoryImpl>((ref) {
  final dio = ref.watch(provideDio);

  return HolidayRepositoryImpl(dio);
});

class HolidayRepositoryImpl implements HolidayRepository {
  HolidayRepositoryImpl(this._dio);

  final Dio _dio;

  @override
  Future<HolidayResponse> getHoliday() async {
    try {
      final response = await _dio.get('json/holidays.json');
      final result = HolidayResponse.fromJson(response.data);

      return result;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw Failure(message: 'No internet connection');
      }

      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        code: e.response?.statusCode,
      );
    }
  }
}

