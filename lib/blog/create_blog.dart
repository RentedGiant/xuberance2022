import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:exebit21_covid/values/colors.dart';
import 'package:http/http.dart' as http;

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  final controllerTo = TextEditingController();
  final controllerSubject = TextEditingController();
  final controllerMessage = TextEditingController();
  final controllerName = TextEditingController();

  Future sendEmail({
   String name,
    String email,
    String subject,
    String message,
}) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
    headers: {
      'origin':'https://localhost',
      'Content-Type':'application/json',
    },
    body: json.encode({
      "user_id": "user_vjou9fDeBCQfzEy8mh6Ny",
      "service_id": "service_pfoy8hb",
      "template_id": "template_8pbs47j",
      'template_params':{
        'user_name':name,
        'user_email':email,
        "user_subject":subject,
        "user_message":message,
      },
    }),

    );
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Request Sent')));
        controllerSubject.clear();
        controllerName.clear();
        controllerMessage.clear();
  }
  @override
  Widget build(BuildContext context) {
    var maxLines;
    Widget buildTextFeild({
      String title,
      TextEditingController controller,
      int maxLines =1,
    })=> Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
        const SizedBox(height:8),
        TextField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        )
      ],
    );
    returnScaffold(
        body: SingleChi ldScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextFeild(title: 'Name', controller: controllerName),
            SizedBox(height: 10,),
            buildTextFeild(title: 'Title', controller: controllerSubject),
            SizedBox(height: 10,),
            buildTextFeild(title: 'Message', controller: controllerMessage),
            SizedBox(height: 20,),
            Text('*Your Blog Will be added pending review*',style: TextStyle(color: Colors.red, fontSize: 5)),
            SizedBox(height: 2,),
            Text('*This method of submission is used to tackle spam*',style: TextStyle(color: Colors.red, fontSize: 5)),
            //maxLines: null,
       ElevatedButton(
           style: ElevatedButton.styleFrom(primary: AppColors.primaryElement),

           onPressed: () => sendEmail(
             email:controllerTo.text,
             subject:controllerSubject.text,
             message:controllerMessage.text,
             name: controllerName.text,

    ),
           child: Icon(Icons.send_sharp, ))

          ],
        ),
      ),
    );
  }

}
