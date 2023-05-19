import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/constants/api_key.dart';
import 'package:weather_app/modules/home/controllers/home_controller.dart';
import 'package:weather_app/utils/weather_util.dart';
import 'package:weather_app/modules/search/view/search_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  HomeController _homeController = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height * 1,
          width: size.width * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/weather.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.location_on,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              Positioned(
                right: 0,
                child: TextButton(
                  onPressed: () async {
                    final weatherResult = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchView(),
                      ),
                    );
                    await _homeController.getWeatherByCityName(weatherResult);
                  },
                  child: Icon(
                    Icons.location_city,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: 20,
                child: Obx(
                  () => Text(
                    '${_homeController.temp.value}℃ ',
                    style: TextStyle(fontSize: 50, color: Colors.black),
                  ),
                ),
              ),
              Positioned(
                top: 350,
                left: 5,
                child: Obx(
                  () => Text(
                    '''${_homeController.description.value}''',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 170,
                child: Obx(() => Text(
                      '${_homeController.icon.value}',
                      style: TextStyle(fontSize: 70, color: Colors.yellow),
                    )),
              ),
              Positioned(
                bottom: 50,
                left: 50,
                child: Obx(() => Text(
                      _homeController.cityName.value,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
