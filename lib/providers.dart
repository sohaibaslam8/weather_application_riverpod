import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_application_riverpod/weather_notifier.dart';
import 'package:weather_application_riverpod/weather_repository.dart';

final weatherRepositoryProvider =
    Provider<WeatherRepository>((ref) => FakeWeatherRepository());

final weatherNotifierProvider =
    StateNotifierProvider<WeatherNotifier, WeatherState>(
  (ref) => WeatherNotifier(ref.watch(weatherRepositoryProvider)),
);
