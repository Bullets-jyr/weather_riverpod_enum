import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../models/current_weather/current_weather.dart';
import '../../../models/custom_error/custom_error.dart';

part 'weather_state.freezed.dart';

enum WeatherStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    required WeatherStatus status,
    required CurrentWeather? currentWeather,
    required CustomError error,
  }) = _WeatherState;

  factory WeatherState.initial() {
    return const WeatherState(
      status: WeatherStatus.initial,
      currentWeather: null,
      error: CustomError(),
    );
  }
}