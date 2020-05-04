import 'package:flutter/material.dart';
import 'package:cityprog/widgets/database_widgets/stream_builder_health.dart';
import 'package:cityprog/strings/navigation_strings.dart';

// List all open appointment times in a GridView

class HealthReservation extends StatefulWidget {
  @override
  _HealthReservationState createState() => _HealthReservationState();
}

class _HealthReservationState extends State<HealthReservation> {
  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return SafeArea(
      bottom: false,
      child: Center(
        child: Container(
          height: 1000,
          width: 750,
          child: Scaffold(
            key: key,
            body: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        NavigationStrings.healthToLocalized(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(20.0)),
                    Expanded(
                      child: StreamBuilderHealth(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
