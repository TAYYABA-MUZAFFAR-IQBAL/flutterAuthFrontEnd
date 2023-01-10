import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:profile/profile.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Profile(
        imageUrl:"",
            // "https://images.unsplash.com/photo-1598618356794-eb1720430eb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
        name: "Shamim Miah",
        website: "shamimmiah.com",
        designation: "Project Manager | Flutter & Blockchain Developer",
        email: "cse.shamimosmanpailot@gmail.com",
        phone_number: "01757736053",
      ),
    ));
  }

  Future<Object> postData(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.18.27:3000/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'connection': 'keep-alive',
        'Access-Control-Allow-Methods': 'POST'
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
      }),
    );
    if (response.statusCode == 200 ) {
      print(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AdminPage()),
      );
      Fluttertoast.showToast(
          msg: "Login Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 54, 244, 79),
          textColor: Colors.white,
          fontSize: 16.0);
      return response;
    } else {
      Fluttertoast.showToast(
          msg: "wrong email or password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 208, 49, 49),
          textColor: Colors.white,
          fontSize: 16.0);
       return response.statusCode;
    }
  }
}
