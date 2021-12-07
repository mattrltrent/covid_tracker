import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class QTile extends StatelessWidget {

  final String alertTitle;
  final String alertMessage;
  final String tileTitle;

  QTile({@required this.alertTitle, @required this.alertMessage, @required this.tileTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 15),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => Center(
              child: SingleChildScrollView(
                child: AlertDialog(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                  backgroundColor: Colors.indigoAccent,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          '$alertTitle',
                          textScaleFactor: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Baloo',
                              fontSize: 35,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 2,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          '$alertMessage',
                          textScaleFactor: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Baloo',
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                      FlatButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Ok', textScaleFactor: 1,),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        child: Container(
          width: 145,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Text(
                  '$tileTitle',
                  textScaleFactor: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Baloo', fontSize: 20),
                  maxLines: 3,
                ),
              ),
              Expanded(child: SizedBox()),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(
                  Icons.add,
                  size: 55,
                  color: Colors.indigoAccent, // change to indigoAccent if I want to make said icon appear (was transparent)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
