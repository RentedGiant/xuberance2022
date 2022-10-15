/*
*  bitch_boy_ayaan_widget.dart
*  Draft_1
*
*  Created by Artem.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:exebit21_covid/social_distancing1_widget/social_distancing1_widget.dart';
import 'package:exebit21_covid/values/values.dart';
import 'package:exebit21_covid/values/borders.dart';


class BitchBoyAyaanWidget extends StatelessWidget {
  
  void onViewPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => SocialDistancing1Widget()));
  
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
              margin: EdgeInsets.only(bottom: 0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 420,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBackground1,
                        border: Border.fromBorderSide(Borders.primaryBorder),
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    left: 51,
                    right: 51,
                    bottom: 0,
                    child: Image.asset(
                      "assets/images/undraw-medical-care-movn-01-removebg-preview-01.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:60.0,bottom: 20.0),
              child: Container(
                height: 111,
                margin: EdgeInsets.only(left: 29, right: 29,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 56,
                      child: Text(
                        "Wear a mask-\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primaryText1,
                          fontFamily: "Arial",
                          fontWeight: FontWeight.w400,
                          fontSize: 48,
                          letterSpacing: 0.0096,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 42, right: 56),
                      child: Text(
                        "save lives",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primaryText1,
                          fontFamily: "Arial Rounded MT Bold",
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                          letterSpacing: 0.01,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 83,
                  height: 83,
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