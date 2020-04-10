       import 'package:flutter/material.dart';
       
       class ButtonRowThree extends StatelessWidget {
                
         @override
         Widget build(BuildContext context) {
           return Container(
             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Text('Nappi'),
                    onPressed: () {
                      print('Blip');
                    },
                  ),
                  FlatButton(
                    child: Text('Nappi'),
                    onPressed: () {
                      print('Blip');
                    },
                  ),
                  FlatButton(
                    child: Text('Nappi'),
                    onPressed: () {
                      print('Blip');
                    },
                  ),
                ],
              ),
           );
         }
       }     
            
              