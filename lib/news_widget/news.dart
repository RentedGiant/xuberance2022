import 'dart:ui';

import 'package:exebit21_covid/blog/home.dart';
import 'package:exebit21_covid/values/values.dart';
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:exebit21_covid/statistics_widget/statistics_widget.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:exebit21_covid/statistics_widget/statistics_widget.dart';
import 'dart:convert';
import 'package:exebit21_covid/values/borders.dart';
import 'package:exebit21_covid/news1.dart';




class news extends StatefulWidget {
  @override
  _newsState createState() => _newsState();
}

class _newsState extends State<news> {
  List countryData;
  fetchCountryData() async {
    http.Response response =
    await http.get(Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases'));
    setState(() {
      countryData = json.decode(response.body);
    });
  }
  void initState(){
    fetchCountryData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(

        extendBody: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: FloatingNavbar(
            backgroundColor: Color.fromARGB(255, 109, 111, 197),
            width: 250,
            elevation: 0,
            borderRadius: 100.0,
            iconSize: 25,
            itemBorderRadius: 100,
            onTap: (int val) {
              if (val == 1) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => News_Feed()));
              }
              else if (val == 2) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => StatisticsWidget()));
              }
             // else if (val==4){
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => Maps()));
              //}
              else if (val==3){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              }
            },
            currentIndex: 0,
            items: [
              FloatingNavbarItem(icon: Icons.poll_outlined,title: "Stats"),
              FloatingNavbarItem(icon: Icons.copy_rounded, ),
              FloatingNavbarItem(icon: Icons.local_hospital_outlined,),
              FloatingNavbarItem(icon: Icons.mark_chat_read_outlined,),
            ],
          ),
        ),


          body: Column(
            children: [
              //Text('CONFIRMED:  '+ countryData[0]['cases'].toString(), style:TextStyle(fontWeight: FontWeight.w500,),),
              Container(
              //constraints: BoxConstraints.expand(),


      child: countryData==null? Center(child:CircularProgressIndicator(),):Flexible(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: countryData==null? 0:countryData.length,
          itemBuilder: (context, index) {
                return
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Card(
                        color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),),
                        elevation: 5.0,
                        child: Row(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left:4,top: 12, right:0 ,bottom: 4 ),
                                   child: Image.network(countryData[index]['countryInfo']['flag'],height: 50, width: 100, ),
                                 ),
                      Text(
                        countryData[index]['country'],
                        style: TextStyle(fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ),

                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:20.0,),
                                    child: Column(
                                      children: [
                                        Text('CONFIRMED:  '+ countryData[index]['cases'].toString(), style:TextStyle(fontWeight: FontWeight.w500,),),
                                        Text( 'ACTIVE:  '+ countryData[index]['active'].toString(), style:TextStyle(fontWeight: FontWeight.w500,)),
                                        Text('DEATHS:  '+ countryData[index]['deaths'].toString(),style:TextStyle(fontWeight: FontWeight.w500,)),
                                        Text('RECOVERED:  '+ countryData[index]['recovered'].toString(),style:TextStyle(fontWeight: FontWeight.w500,)),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
          },
        ),
      )
      ),
            ],
          )
      ),
    );
  }
}
