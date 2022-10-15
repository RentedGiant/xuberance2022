/*
*  benched_widget.dart
*  Draft_1
*
*  Created by Artem.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:exebit21_covid/bitch_boy_ayaan_widget/bitch_boy_ayaan_widget.dart';
import 'package:exebit21_covid/values/values.dart';
import 'package:ndialog/ndialog.dart';


class BenchedWidget extends StatelessWidget {

  void onViewPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => BitchBoyAyaanWidget()));


  @override
  Widget build(BuildContext context) {


    return Scaffold(


    body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 500,
              margin: EdgeInsets.only(bottom: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBackground1,
                      ),
                      child: Container(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, ),
                    child: Stack(
                      children: [Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Image.asset(
                          "assets/images/undraw-wash-hands-nwl2-01.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 100,
              margin: EdgeInsets.only(left: 20, bottom: 3,top: 10),
              child: Text(
                "20 seconds",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.primaryText1,
                  fontFamily: "Arial Rounded MT Bold",
                  fontWeight: FontWeight.w400,
                  fontSize: 50,
                ),
              ),
            ),
            Container(
              height: 91,
              margin: EdgeInsets.only(left: 0, right: 0,),
              child: Text(
                "That could save your life",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryText1,
                  fontFamily: "Arial Rounded MT Bold",
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 83,
                height: 83,
                margin: EdgeInsets.only(bottom: 15),
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