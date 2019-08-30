import 'package:flutter/material.dart';
import 'package:bike_mso/components/safetyInfoWidget.dart';

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
      duration: Duration(seconds: 4),
      vsync: this,
    );

    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.forward();

    controller.addListener(() {
      setState(() {});
      //print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('Safety 3rd!!!'),
//      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 400,
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
            SafetyInfoWidget(
                title: 'Rules of the Road', body: 'This is a bunch of text')
          ],
        ),
      ),
    );
    ;
  }
}
