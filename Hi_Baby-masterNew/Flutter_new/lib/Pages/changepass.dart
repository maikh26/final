import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login2.dart';

class changepass extends StatefulWidget {
  final String email;
  const changepass({Key key, this.email}) : super(key: key);

  @override
  _changepassState createState() => _changepassState();
}

class _changepassState extends State<changepass> {
  TextEditingController _password = new TextEditingController();
  TextEditingController _password2 = new TextEditingController();

  String validglobal(String val) {
    if (val.trim().isEmpty) {
      return (" field can be empty");
    }
  }

  @override
  Widget build(BuildContext context) {
    var wh = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
  String _email = widget.email;

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
                passwordf(wh),
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
                            signup(_email);
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

  Future signup(String _email) async {
    var data = {
      //"username": _username2.text,
      "email": _email,
      "password": _password.text,

      //"password": _pass2.text,
    };
    final uri = Uri.parse("http://192.168.232.2/Hi_Baby/updatepass.php");
    var request = await http.post(uri, body: data);
    var message = jsonDecode(request.body);
 if (message['status'] == "success") {
      showloading(context, "Done", " Password changed successfuly");
 Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  LOgin2(),
            ));    } 
            else {
      //String username = _username2.text;
     // String email = _email.text;
      print('faild');
      //passwordf(wh);
      //String pass = _pass2.text;
      
    }   
  }

  passwordf(double wh) {
    return Center(
        child: AnimatedContainer(
      duration: Duration(milliseconds: 400),
      height: 200,
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
              Text(" Password",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: _password,
                      obscureText: true,
                      validator: validglobal,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(4),
                        hintText: "Enter New password",
                        prefixIcon: Icon(Icons.lock),
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
                      )),
              Text(" Confirm Password",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: _password2,
                      obscureText: true,
                      validator: validglobal,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(4),
                        hintText: "Confirm password",
                        prefixIcon: Icon(Icons.lock),
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
