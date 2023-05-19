import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class GetWeatherService {
//  Future<void> getCityByLocation(Position position) async {
//     final client =http. Client();
//     try {
//       String url =
//           'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey';
//       Uri uri = Uri.parse(url);
//       final apiJoop = await http. Client().get(uri);
//       final jsonData = apiJoop.body;
//       final jsonJoop = json.decode(jsonData) as Map<String, dynamic>;
//       cityName = jsonJoop['name'];
//       final kelvin = jsonJoop['main']['temp'];
//       temp = WeatherUtil.calculateKelvi(kelvin);
//       description = WeatherUtil.getDescription(double.parse(temp));
//       icon = WeatherUtil.getWeatherIcon(kelvin);
//       setState(() {});
//     } catch (e) {
//       Exception(e);
//       rethrow;
//     }

//     setState(() {});
//   }

  // Future<void> getWeatherByCityName(String typeCityname) async {
  //   final client = http.Client();
  //   try {
  //     String url =
  //         'https://api.openweathermap.org/data/2.5/weather?q=$typeCityname&appid=$apiKey';
  //     Uri uri = Uri.parse(url);
  //     final response = await client.get(uri);
  //     final jsonData = jsonDecode(response.body);
  //     cityName = jsonData['name'];
  //     final kelvin = jsonData['main']['temp'];
  //     temp = WeatherUtil.calculateKelvi(kelvin);
  //     description = WeatherUtil.getDescription(double.parse(temp));
  //     icon = WeatherUtil.getWeatherIcon(kelvin);
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
