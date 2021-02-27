import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../Repository/Repository.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final repo = Repository();

  @override
  void initState() {
    super.initState();
    repo.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    final mqw = MediaQuery.of(context).size.width;
    final mqh = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            width: mqw,
            height: mqh,
            child: Column(children: [
              SizedBox(
                height: 100,
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
                    Image.asset(
                      'lib/asset/images/cloud.png',
                      width: 260,
                      height: 260,
                    ),
                    Positioned(
                      bottom: 40,
                      child: Text(
                        'thunder',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                '13',
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
                          filter:
                              ui.ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                          child: Container(
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                            .bodyText1)
                                  ],
                                ),
                                Container(
                                  width: 2,
                                  color: Colors.white,
                                  margin: EdgeInsets.symmetric(vertical: 50),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                            .bodyText1)
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
              )
            ])));
  }

  Widget generateBluredImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/huxley-lsd.png'),
          fit: BoxFit.cover,
        ),
      ),
      //I blured the parent container to blur background image, you can get rid of this part
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Container(
          //you can change opacity with color here(I used black) for background.
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
        ),
      ),
    );
  }
}
