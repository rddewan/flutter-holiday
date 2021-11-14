import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final provideDio = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    baseUrl: "https://maqe.github.io/",
    )
  );
});
