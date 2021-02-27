import 'dart:ui' as ui;
import 'package:WeatherAppFlutter/Model/MainWeatherModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../BLoC/WeatherBloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    weatherController.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    final mqw = MediaQuery.of(context).size.width;
    final mqh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder(
        stream: weatherController.weatherStream,
        builder: (ctx, AsyncSnapshot<MainWeatherModel> snapShot) {
          if (!snapShot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              width: mqw,
              height: mqh,
              child: Column(
                children: [
                  Container(
                    width: mqw,
                    height: mqh * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [],
                    ),
                  ),
                  Container(
                    width: mqw,
                    height: mqh * 0.4,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'lib/asset/images/mapblack.png',
                          color: Colors.white12,
                        ),
                        StreamBuilder(
                            stream: weatherController.weatherIConStream,
                            builder: (ctx, AsyncSnapshot<String> snapShot) {
                              if (snapShot.hasData) {
                                return SvgPicture.asset(
                                  snapShot.data,
                                  width: 270,
                                  height: 270,
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                        Positioned(
                          bottom: 40,
                          child: Text(
                            snapShot.data.weather.description.toUpperCase(),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    snapShot.data.dt.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: mqw,
                    height: mqh * 0.35,
                    child: Stack(
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: EdgeInsets.all(20),
                            child: Image.asset(
                              'lib/asset/images/background1.jfif',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Center(
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ui.ImageFilter.blur(
                                  sigmaX: 30.0, sigmaY: 30.0),
                              child: Container(
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white.withOpacity(0.1),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Percipation',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        Text('30%',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Text('Humidity',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        Text('30%',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        Image.network(
                                          "http://openweathermap.org/img/w/" +
                                              snapShot.data.weather.icon +
                                              ".png",
                                          width: 120,
                                          height: 120,
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 2,
                                      color: Colors.white,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 50),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Percipation',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        Text('30%',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Text('Humidity',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        Text('30%',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
