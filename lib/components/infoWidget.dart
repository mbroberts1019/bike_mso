import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String body;

  InfoWidget({this.title, this.body});

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
          expanded: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              body,
              softWrap: true,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'Merriweather',
              ),
            ),
          ),
          tapHeaderToExpand: true,
          hasIcon: true,
        ),
      ),
    );
  }
}
