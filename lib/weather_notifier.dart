import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_application_riverpod/model/weather.dart';
import 'package:weather_application_riverpod/weather_repository.dart';

abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  const WeatherLoaded(this.weather);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is WeatherLoaded && o.weather == weather;
  }

  @override
  int get hashcode => weather.hashCode;
}

class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is WeatherError && o.message == message;
  }

  @override
  int get hashcode => message.hashCode;
}

class WeatherNotifier extends StateNotifier<WeatherState> {
  final WeatherRepository _weatherRepository;
  WeatherNotifier(this._weatherRepository) : super(WeatherInitial());
  Future<void> getWeather(String cityName) async {
    try {} on NetworkException {
      state = WeatherError("Couldn't fetch weather. Is the device online?");
    }

    state = WeatherLoading();
    final weather = await _weatherRepository.fetchWeather(cityName);
    state = WeatherLoaded(weather);
  }
}
