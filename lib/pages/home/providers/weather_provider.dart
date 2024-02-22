import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/current_weather/current_weather.dart';
import '../../../models/custom_error/custom_error.dart';
import '../../../repositories/providers/weather_repository_provider.dart';
import 'weather_state.dart';

part 'weather_provider.g.dart';

@riverpod
class Weather extends _$Weather {
  @override
  WeatherState build() {
    return WeatherState.initial();
  }

  Future<void> fetchWeather(String city) async {
    state = state.copyWith(status: WeatherStatus.loading);

    try {
      final CurrentWeather currentWeather =
      await ref.read(weatherRepositoryProvider).fetchWeather(city);

      state = state.copyWith(
        status: WeatherStatus.success,
        currentWeather: currentWeather,
      );
    } on CustomError catch (error) {
      state = state.copyWith(
        status: WeatherStatus.failure,
        error: error,
      );
    }
  }
}