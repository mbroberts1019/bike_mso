import 'package:flutter/material.dart';
import 'package:bike_mso/components/safetyInfoWidget.dart';
import 'package:bike_mso/components/handSignalCard.dart';

class SafetyScreen extends StatefulWidget {
  @override
  _SafetyScreenState createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.repeat();

    controller.addListener(() {
      setState(() {});
      //print(controller.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safety 3rd!!!'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(
                        'assets/images/dumbHipster.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Opacity(
                  opacity: animation.value,
                  child: Center(
                      child: Icon(
                    Icons.do_not_disturb,
                    color: Colors.red,
                    size: 300,
                  )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Text(
                    'Dont be a dumb Hipster!!',
                    style: TextStyle(
                      fontFamily: 'Lora',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.lightGreenAccent,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Center(
                    child: Text(
                      'Always wear a helmet!',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lora',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(
                            color: Colors.white,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    'Use Hand Signals',
                    style: TextStyle(
                      fontFamily: 'Lora',
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      HandSignal('Left.png', 'Left'),
                      HandSignal('Right.png', 'Right'),
                      HandSignal('AltRight.png', 'Alt Right'),
                      HandSignal('Stop.png', 'Stop'),
                    ],
                  ),
                ],
              ),
            ),
            Center(
                child: Text(
              'Follow the:',
              style: TextStyle(fontSize: 20),
            )),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(4.0, 4.0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.orange,
                    border: Border.all(
                      color: Colors.deepOrange,
                      width: 5.0,
                    )),
                child: SafetyInfoWidget(
                    title: 'Rules of the Road',
                    body:
                        '1. Always ride with traffic. \n 2. Obey all traffic signs and lights.\n 3. Use hand signals when turning or changing lanes.\n 4. Ride with front and back lights at night.\n 5. Yield to pedestrians.'),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
