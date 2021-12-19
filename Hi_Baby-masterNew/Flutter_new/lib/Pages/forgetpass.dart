import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'changepass.dart';
import 'login2.dart';

class forgetpass extends StatefulWidget {
  const forgetpass({Key key}) : super(key: key);

  @override
  _forgetpassState createState() => _forgetpassState();
}

class _forgetpassState extends State<forgetpass> {
  TextEditingController _email = new TextEditingController();
  String validglobal(String val) {
    if (val.trim().isEmpty) {
      return (" field can be empty");
    }
  }

  @override
  Widget build(BuildContext context) {
    var wh = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            body: Stack(children: <Widget>[
          Image.asset(
            "assets/loginphoto.jpg",
            height: height,
            fit: BoxFit.fitHeight,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
          ),
          // poisition_top(wh),
          // positione_bottom(wh),
          //  BackgroundImage(),
          Container(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                    child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    "forget",
                    // showsignin ? "Login" : "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                  // margin: EdgeInsets.only(top: 20),
                )),
                build_top(),
                Padding(padding: EdgeInsets.only(top: 40)),
                build_form_signup(wh),
                Center(
                  child: Container(
                    // margin: EdgeInsets.only(top: 5),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 24,
                        ),
                        RaisedButton(
                          elevation: 8,
                          color: Colors.pinkAccent.withOpacity(0.5),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          onPressed: () {
                            signup(wh);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Reset My password",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ))
        ])));
  }

  AnimatedContainer build_top() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      height: 120,
      width: 120,
    );
  }

  Future signup(double wh) async {
    var data = {
      //"username": _username2.text,
      "email": _email.text,
      //"password": _pass2.text,
    };
    final uri = Uri.parse("http://192.168.232.2/Hi_Baby/resetpass.php");
    var request = await http.post(uri, body: data);
    var message = jsonDecode(request.body);
    print(message);
    if (message['status'] == "faild") {
      showloading(context, "wrong", " Email Not exists ");
      print('erorrr');
    } else {
      //String username = _username2.text;
      String email = _email.text;
      print('success');
      //passwordf(wh);
      //String pass = _pass2.text;
       Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  changepass(email: email),
            ));
    }
  }

  build_form_signup(double wh) {
    return Center(
        child: AnimatedContainer(
      duration: Duration(milliseconds: 400),
      height: 130,
      width: wh / 1.2,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
                color: Colors.blueGrey.withOpacity(0.5),
                spreadRadius: 0.1,
                blurRadius: 1,
                offset: Offset(0, 1))
          ]),
      child: Form(
          // key: formstate_signup,
          child: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(" Email",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  )),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: _email,
                  validator: validglobal,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(4),
                    hintText: "Enter your Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey[500],
                            style: BorderStyle.solid,
                            width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey[500],
                            style: BorderStyle.solid,
                            width: 1)),
                  ))
            ],
          ),
        ),
      )),
    ));
  }

  passwordf(double wh) {
    return Center(
        child: AnimatedContainer(
      duration: Duration(milliseconds: 400),
      height: 130,
      width: wh / 1.2,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
                color: Colors.blueGrey.withOpacity(0.5),
                spreadRadius: 0.1,
                blurRadius: 1,
                offset: Offset(0, 1))
          ]),
      child: Form(
          // key: formstate_signup,
          child: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(" password",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  )),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: _email,
                  validator: validglobal,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(4),
                    hintText: "Enter your new password",
                    prefixIcon: Icon(Icons.email_outlined),
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey[500],
                            style: BorderStyle.solid,
                            width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey[500],
                            style: BorderStyle.solid,
                            width: 1)),
                  ))
            ],
          ),
        ),
      )),
    ));
  }
}
