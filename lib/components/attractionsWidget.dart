import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class AttractionsWidget extends StatelessWidget {
  final String title;
  final String body;
  final List markers;

  AttractionsWidget({this.title, this.body, this.markers});

  buildExpanded() {
    print(markers);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: markers.length,
      itemBuilder: (BuildContext context, int index) {
        return MarkerCard(markers[index]['infoWindow']['title'],
            markers[index]['infoWindow']['snippet']);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: false,
        child: ExpandablePanel(
          header: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoMono',
              ),
            ),
          ),
          collapsed: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              body,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'Merriweather',
              ),
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          expanded: Column(
            children: [
              buildExpanded(),
            ],
          ),
          tapHeaderToExpand: true,
          hasIcon: true,
        ),
      ),
    );
  }
}

class MarkerCard extends StatelessWidget {
  MarkerCard(this.title, this.snippet);

  final String snippet;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white30),
            borderRadius: BorderRadius.circular(3.0),
            color: Colors.purpleAccent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  snippet,
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
