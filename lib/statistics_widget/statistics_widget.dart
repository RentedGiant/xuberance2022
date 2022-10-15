/*
*  statistics_widget.dart
*  Draft_1
*
*  Created by Artem.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'dart:convert';
import 'package:exebit21_covid/news_widget/news.dart';
import 'package:exebit21_covid/news1.dart';
import 'package:exebit21_covid/blog/home.dart';
import 'package:auto_size_text/auto_size_text.dart';
class StatisticsWidget extends StatefulWidget {
  @override
  _StatisticsWidgetState createState() => _StatisticsWidgetState();
}
class _StatisticsWidgetState extends State<StatisticsWidget> {
  String stringResponse;
  List listResponse;
  String pincode='700053';
  Map mapResponse;
  List countryData;
  Map mapRsponse;
  List Vaccinedata;
  final pincodeController = TextEditingController();

  fetchCountryData() async {
    http.Response response =
    await http.get(Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases'));
    setState(() {
      countryData = json.decode(response.body);
    });
  }
  fetchVaccineData() async {
    http.Response response =
    await http.get(Uri.parse('https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=$pincode&date=07-08-2021'));
    setState(() {
      mapResponse = json.decode(response.body);
      Vaccinedata = mapResponse['sessions'];

    });
  }
  void initState(){
    fetchVaccineData();
    fetchCountryData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(Text('lmao$Vaccinedata'));

    var size = MediaQuery.of(context).size;
    return Scaffold(

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
            if(val==1){
              Navigator.push(context, MaterialPageRoute(builder: (context) => News_Feed()));
            }
            else if(val==0){
              Navigator.push(context, MaterialPageRoute(builder: (context) => news()));
            }
            else if (val==3){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            }
           // else if (val==4){
            //  Navigator.push(context, MaterialPageRoute(builder: (context) => 'INSERT'()));
            //}
          },
          currentIndex: 2,
          items: [
            FloatingNavbarItem(icon: Icons.poll_outlined,),
            FloatingNavbarItem(icon: Icons.copy_rounded, ),
            FloatingNavbarItem(icon: Icons.local_hospital_outlined, title: 'Local'),
            FloatingNavbarItem(icon: Icons.mark_chat_read_outlined, ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:24.0, left: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Local Data',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),  ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top:5.0,bottom: 10),
            child: Row(
              children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          width: size.width/1.1,
          child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),),
          elevation: 5.0,
          child: countryData==null? Center(child:CircularProgressIndicator(),) :Row(
              children: [
                Container(
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left:4,top: 12, right:0 ,bottom: 4 ),
                        child: Image.network(countryData[1]['countryInfo']['flag'],height: 50, width: 100, ),
                      ),
                      Text(
                        countryData[1]['country'],
                        style: TextStyle(fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),

                Expanded(child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom:0.0,),
                    child: Column(
                      children: [
                        Text('TODAY CONFIRMED:  '+ countryData[1]['todayCases'].toString(), style:TextStyle(fontWeight: FontWeight.w500,),),
                        Text( 'CRITICAL:  '+ countryData[1]['critical'].toString(), style:TextStyle(fontWeight: FontWeight.w500,)),
                        Text('TODAY DEATHS:  '+ countryData[1]['todayDeaths'].toString(),style:TextStyle(fontWeight: FontWeight.w500,)),
                        Text('TODAY RECOVERED:  '+ countryData[1]['todayRecovered'].toString(),style:TextStyle(fontWeight: FontWeight.w500,)),

                      ],
                    ),
                  ),
                ))
              ],
          ),
      ),
        ),


                ]
            ),
          ),
          Container(

            child:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:16.0,top:8.0,bottom:8.0),
                  child: Row(
                    children: [
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),),
                        elevation: 5.0,
                        child:
                        Center(
                          child: Container(
                            height: 160,
                            width: size.width/1.1,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child:
                                      Column(
                                        children: [
                                          Text(
                                            'LIST OF A FEW VERIFIED HOSPITALS',
                                            style: TextStyle(fontWeight: FontWeight.bold,),),
                                          SizedBox(height:4),
                                          Container(
                                            child:  Vaccinedata==null? Center(child:CircularProgressIndicator(),) : Column(
                                              children: [
                                                Text(
                                                  'Name: Ruby General Hospital Ltd',
                                                  style: TextStyle(fontWeight: FontWeight.w400,),),
                                                Text(
                                                  'Address: E M Bypass East Kolkata Township',
                                                  style: TextStyle(fontWeight: FontWeight.w400,),),
                                                SizedBox(height:4),
                                                Text(
                                                  'Name: Bhagirathi Neotia Woman & Child Care Centre',
                                                  style: TextStyle(fontWeight: FontWeight.w400,),),
                                                Text(
                                                  'Address: Rawdon Street Circus Avenue',
                                                  style: TextStyle(fontWeight: FontWeight.w400,),),
                                                SizedBox(height:4),
                                                Text(
                                                  'Name: Nightingale Hospital',
                                                  style: TextStyle(fontWeight: FontWeight.w400,),),
                                                Text(
                                                  'Address: Shakespeare Sarani Midleton Row ',
                                                  style: TextStyle(fontWeight: FontWeight.w400,),),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height:4),
                                        ],
                                      ),





                                ),
                              ],
                            ),
                          ),
                        ),

                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: countryData==null? Center(child:CircularProgressIndicator(),) : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:16.0,top:8.0,bottom:8.0),
                  child: Row(
                    children: [
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),),
                        elevation: 5.0,
                        child:
                        Container(
                          height: 300,
                          width: size.width/1.1,
                          child: Column(
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(top: 12,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:30.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              children:
                                             [
                                                Text(
                                                  'NEAREST AVAILABLE VACCINE SESSION',
                                                  style: TextStyle(fontWeight: FontWeight.bold,),),
                                              ],
                                            ),
                                            SizedBox(height: 4,),
                                            Row(
                                              children: [
                                                Text(
                                                  'Name:  ' + Vaccinedata[0]["name"].toString(),
                                                  style: TextStyle(fontWeight: FontWeight.w400,),),
                                              ],
                                            ),
                                            SizedBox(height: 4,),
                                            Row(
                                              children: [
                                                Text(
                                                  'Address:  '+ Vaccinedata[0]["address"].toString(),
                                                    style: TextStyle(fontWeight: FontWeight.w400,),),
                                              ],
                                            ),
                                            SizedBox(height: 4,),
                                            Row(
                                              children: [
                                                Text(
                                                  'Available From:  '+Vaccinedata[0]["from"].toString(),
                                                  style: TextStyle(fontWeight: FontWeight.w400,),),
                                              ],
                                            ),
                                            SizedBox(height: 4,),
                                            Row(
                                              children: [
                                                Text(
                                                  'To:  '+Vaccinedata[0]["to"].toString(),
                                                  style: TextStyle(fontWeight: FontWeight.w400,),),
                                              ],
                                            ),
                                            SizedBox(height: 4,),
                                            Row(
                                              children: [
                                                Text(
                                                  'Number of Doses 1 Vaccines Left  '+Vaccinedata[0]["available_capacity_dose1"].toString(),
                                                  style: TextStyle(fontWeight: FontWeight.w400,),),
                                              ],
                                            ),
                                            SizedBox(height: 4,),
                                            Row(
                                              children: [
                                                Text(
                                                  'Number of Doses 2 Vaccines Left  '+Vaccinedata[0]["available_capacity_dose2"].toString(),
                                                  style: TextStyle(fontWeight: FontWeight.w400,),),
                                              ],
                                            ),
                                            SizedBox(height: 8,),
                                            Row(
                                              children: [
                                                Text(
                                                  'Name:  ' + Vaccinedata[2]["name"].toString(),
                                                  style: TextStyle(fontWeight: FontWeight.w400,),),
                                              ],
                                            ),
                                            SizedBox(height: 4,),


                                            AutoSizeText(
                                              'Address:  '+ Vaccinedata[2]["address"].toString(),
                                              style: TextStyle(fontWeight: FontWeight.w400,),
                                              maxLines: 2,
                                            ),


                                            SizedBox(height: 4,),
                                            Row(
                                              children: [
                                                Text(
                                                  'Available From:  '+Vaccinedata[2]["from"].toString(),
                                                  style: TextStyle(fontWeight: FontWeight.w400,),),
                                              ],
                                            ),
                                            SizedBox(height: 4,),
                                            Row(
                                              children: [
                                                Text(
                                                  'To:  '+Vaccinedata[2]["to"].toString(),
                                                  style: TextStyle(fontWeight: FontWeight.w400,),),
                                                ]),
                                            SizedBox(height: 4,),
                                            Row(
                                              children: [
                                                Text(
                                                  'Number of Doses 1 Vaccines Left  '+Vaccinedata[2]["available_capacity_dose1"].toString(),
                                                  style: TextStyle(fontWeight: FontWeight.w400,),),
                                              ],
                                            ),
                                            SizedBox(height: 4,),
                                            Row(
                                              children: [
                                                Text(
                                                  'Number of Doses 2 Vaccines Left  '+Vaccinedata[2]["available_capacity_dose2"].toString(),
                                                  style: TextStyle(fontWeight: FontWeight.w400,),),
                                              ],
                                            ),

                                          ],
                                        ),


                                        ),
                                        ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],



          ),);

  }
}


