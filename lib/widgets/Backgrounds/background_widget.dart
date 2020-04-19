import 'package:flutter/material.dart';
import 'package:cityprog/animations/FadeAnimation.dart';

class BackgroundWidget extends StatelessWidget {
  final double width;
  final double heigth;
  final double top;
  final String imageUrl;

  BackgroundWidget({this.width, this.heigth, this.imageUrl, this.top});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
                  top: top,
                  height: heigth,
                  width: width,
                  child: FadeAnimation(0.7,Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.fill,     
                    )),
                  ),),
                );
  }
}