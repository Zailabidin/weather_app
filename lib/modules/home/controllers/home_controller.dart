import 'dart:convert';
import 'package:rxdart/rxdart.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/constants/api_key.dart';
import 'package:weather_app/data/local/weather_local_data.dart';
import 'package:weather_app/modules/home/services/get_position_service.dart';

class HomeController extends GetxController {
  RxString cityName = 'Shaar kele jatat'.obs;
  RxString temp = ''.obs;
  RxString description = ''.obs;
  RxString icon = ''.obs;
  @override
  void onInit() {
    showLocation();
    super.onInit();
  }

  void showLocation() async {
    final position = await getCurrentPosition();
    await getCityByLocation(position);
  }

  Future<void> getCityByLocation(Position position) async {
    final client = http.Client();
    try {
      String url =
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey';
      Uri uri = Uri.parse(url);
      final apiJoop = await client.get(uri);
      final jsonData = apiJoop.body;
      final jsonJoop = json.decode(jsonData);
      cityName.value = jsonJoop['name'];
      final kelvin = jsonJoop['main']['temp'];
      temp.value = WeatherLocalData.calculateKelvi(kelvin) as String;
      description.value =
          WeatherLocalData.getDescription(double.parse(temp.value));
      icon.value = WeatherLocalData.getWeatherIcon(kelvin);
    } catch (e) {
      throw Exception(e);
    }

    // setState(() {});
  }

  Future<void> getWeatherByCityName(String typeCityname) async {
    final client = http.Client();
    try {
      String url =
          'https://api.openweathermap.org/data/2.5/weather?q=$typeCityname&appid=$apiKey';
      Uri uri = Uri.parse(url);
      final response = await client.get(uri);
      final jsonData = jsonDecode(response.body);
      cityName.value = jsonData['name'];
      final kelvin = jsonData['main']['temp'];
      temp.value = WeatherLocalData.calculateKelvi(kelvin).toString();
      description.value =
          WeatherLocalData.getDescription(double.parse(temp.value));
      icon.value = WeatherLocalData.getWeatherIcon(kelvin);
    } catch (e) {
      throw e;
    }
  }

  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
