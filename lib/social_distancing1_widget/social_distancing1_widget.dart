/*
*  social_distancing1_widget.dart
*  Draft_1
*
*  Created by Artem.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:exebit21_covid/statistics_widget/statistics_widget.dart';
import 'package:flutter/material.dart';
import 'package:exebit21_covid/values/values.dart';


class SocialDistancing1Widget extends StatelessWidget {
  
  void onViewPressed(BuildContext context) {Navigator.push(context, MaterialPageRoute(builder: (context) => StatisticsWidget()));
  
  }
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 6,
                    top: 87,
                    right: 63,
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 487,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 224, 247, 246),
                            border: Border.all(
                              width: 1,
                              color: Color.fromARGB(255, 112, 112, 112),
                            ),
                          ),
                          child: Container(),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 169,
                            child: Text(
                              "practice ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: "Arial",
                                fontWeight: FontWeight.w400,
                                fontSize: 41,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 100,
                    right: 0,
                    child: Image.asset(
                      "assets/images/undraw-social-distancing-2g0u-01-removebg.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 100, right: 0),
              child: Text(
                "Social Distancing",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "Arial Rounded MT Bold",
                  fontWeight: FontWeight.w400,
                  fontSize: 50,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 83,
                height: 83,
                margin: EdgeInsets.only(bottom: 10),
                child: FlatButton(
                  onPressed: () => this.onViewPressed(context),
                  color: Color.fromARGB(0, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                  textColor: Color.fromARGB(255, 0, 0, 0),
                  padding: EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/icon-ionic-ios-arrow-round-forward.png",),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}