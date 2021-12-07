import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleTile extends StatelessWidget {
  final bool addBotLine;
  final String title;
  final String desc;
  final String url;

  ArticleTile(
      {@required this.title, @required this.addBotLine, @required this.desc, @required this.url});

  launchURL() async {
    var launchUrl = url;
    if (await canLaunch(launchUrl)) {
      await launch(launchUrl);
    } else {
      throw 'Could not launch $launchUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Divider(
              thickness: 2,
              color: Colors.black,
            ),
          ),
          Center(
            child: Text(
              title == null ? '' : '$title',
              textScaleFactor: 1,
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Baloo', fontSize: 30, color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                desc == null ? '' : '$desc',
                textScaleFactor: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Baloo', fontSize: 15, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10, top: 15),
            child: Center(
              child: FlatButton(
                color: Colors.indigoAccent,
                onPressed: () {
                  launchURL();
                },
                child: Text(
                  'Visit Article',
                  textScaleFactor: 1,
                  style: TextStyle(color: Colors.white, fontFamily: 'Baloo'),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ),
          addBotLine == false
              ? Container()
              : Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                ),
        ],
      ),
    );
  }
}
