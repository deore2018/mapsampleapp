import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:samplemap/constant/constant_class.dart';
import 'package:samplemap/constant/constant_title.dart';
import 'dart:core';

import 'package:samplemap/utils/utils.dart';


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
  static Map<String, Object> sign_in_array = new HashMap();
}

class _SignInPageState extends State<SignInPage> {
  final _scaffoldKey = GlobalKey<FormState>();
  bool _autovalidate = false;
  ProgressDialog pr;
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  String usernamevalid,passwordvalid;
  String token1;
  String signature; // = "{{ app signature }}";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernamevalid = passwordvalid="";
    token1 = "";
  }

  _checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog('No internet', "You're not connected to a network");
    } else if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      //pr.show();
      //getphoneNumber();
      // Navigator.of(context).push(
      //   MaterialPageRoute(builder: (contextTrans) => CollegeConnectPrincipalProfile()),
      // );
    }
  }

  _showDialog(title, text) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            content: Text(text),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Ok',
                  style: TextStyle(color: R.color.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: true);
    pr.style(message: 'processing');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Form(
          key: _scaffoldKey,
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 180,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
//                      Image.asset(
//                        R.image.icon_logo,
//                        width: 250.0, //ScreenUtil.getInstance().setWidth(110),
//                        height:
//                        150.0, //ScreenUtil.getInstance().setHeight(110),
//                      ),
                    ],
                  ),
                  SizedBox(
                    height: 120.0,
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: Container(
                      child: TextFormField(
                        autovalidate: _autovalidate,
                        validator: (value) {
                          return value.isEmpty || value.length < 10
                              ? "Enter Valid username"
                              : null;
                        },
                        style: inputTextStyle(),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        obscureText: false,
                        controller: usernamecontroller,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        decoration: inputImageDecoration(
                          hintText: S.hint_input_mobile,
                          image: R.image.icon_call,
                        ),
                      ),
                      //margin: EdgeInsets.only(bottom: 20),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(usernamevalid,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        )),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: Container(
                      child: TextFormField(
                        autovalidate: _autovalidate,
                        validator: (value) {
                          return value.isEmpty || value.length < 8
                              ? "Enter valid password"
                              : null;
                        },
                        style: inputTextStyle(),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        obscureText: false,
                        controller: passwordcontroller,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        decoration: inputImageDecoration(
                          hintText: S.hint_input_pswd,
                          image: R.image.icon_call,
                        ),
                      ),
                      //margin: EdgeInsets.only(bottom: 20),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(passwordvalid,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
//                  Container(
//                    child: button(
//                        text: S.btn_sign_in.toUpperCase(),
//                        onPressed: () {
//                          SignInPage.sign_in_array['mobile_key'] =
//                              mobilenumbercontroller.text;
//
//                          validateForm();
//                        }),
//                    margin: EdgeInsets.only(top: 20, bottom: 20),
//                  ),



                  SizedBox(height: 20,),
                  Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        validateForm();
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Color(0xff374ABE), Color(0xff1BDCDE)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),




                  // button(
                  //     text: S.of(context).btn_sign_in_facebook.toUpperCase(),
                  //     onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onAlertButtonsPressed(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "REGISTER ALERT",
      desc: "You Are Not Registered",
      buttons: [
        // DialogButton(
        //   child: Text(
        //     "FLAT",
        //     style: TextStyle(color: Colors.white, fontSize: 20),
        //   ),
        //   onPressed: () => Navigator.pop(context),
        //   color: Color.fromRGBO(0, 179, 134, 1.0),
        // ),
        DialogButton(
          child: Text(
            "Register",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
//            Navigator.of(context).push(
//              MaterialPageRoute(builder: (contextTrans) => Category_Sign()),
//              // ModalRoute.withName(RouterName.MAIN),
//            );
          }, //=> Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }

  validateForm() {
    if (_scaffoldKey.currentState.validate()) {
      _checkInternetConnectivity();
      _scaffoldKey.currentState.save();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autovalidate = true;
      });
    }
  }

  @override
  void dispose() {
    usernamecontroller.dispose();
    super.dispose();
  }
}
