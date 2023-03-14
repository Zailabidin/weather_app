import 'package:flutter/material.dart';
import 'package:weather_app/views/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchView(),
                      ),
                    );
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
                child: Text(
                  '8℃ ',
                  style: TextStyle(fontSize: 50, color: Colors.yellowAccent),
                ),
              ),
              Positioned(
                top: 350,
                left: 100,
                child: Text(
                  '''Сизге кол кап

                  \n керек болот''',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              Positioned(
                top: 120,
                left: 170,
                child: Text(
                  '⛅',
                  style: TextStyle(fontSize: 70, color: Colors.yellow),
                ),
              ),
              Positioned(
                top: 430,
                right: 0,
                child: Text(
                  '🧣 🧤',
                  style: TextStyle(fontSize: 60, color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 100,
                child: Text(
                  'Bishkek',
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
