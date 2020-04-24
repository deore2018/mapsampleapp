import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:samplemap/constant/constant_class.dart';
import 'package:samplemap/constant/constant_title.dart';
import 'package:samplemap/utils/utils.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  ProgressDialog pr;
  String signature;
  bool _autoValidate = false;
  bool permissiongranted = false;
  TextEditingController firstNamecontroller = TextEditingController();
  TextEditingController lastNamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController referralcodecontroller = TextEditingController();

  String firstnameValid, lastnameValid, emailValid, mobilevalid;

  bool validmail;
  String register_role;

  //final String Sign_Up_url = AllConstantLink.bseUrl + "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final formkey = GlobalKey<FormState>();

  String _currentAddress;
  static TextStyle textStyleWhite = const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'RobotoMono');
  var newresponsejson;
  int count;
  static TextStyle textStylered = const TextStyle(
      color: Colors.white,
      fontSize: 14,
      // backgroundColor: Colors.white,
      fontWeight: FontWeight.w500,
      fontFamily: 'RobotoMono');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstnameValid = lastnameValid = emailValid = mobilevalid = "";
    validmail = false;
    newresponsejson = "";

    count = 0;
  }



  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);

    pr.style(message: 'Processing..');

    return Scaffold(
      key: _scaffoldKey,
      // resizeToAvoidBottomInset: false,
      body: Form(
        key: formkey,
        child: SafeArea(
          // child: Stack(
          //   // fit: StackFit.expand,
          //   alignment: Alignment.center,
          //   children: <Widget>[
          // child:Center(
          child: Container(
            margin: EdgeInsets.only(left: 36, right: 36, bottom: 30),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    child: Text(
                      S.title_sign_up.toUpperCase(),
                      style:
                      TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                    margin: EdgeInsets.only(bottom: 30),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                        controller: firstNamecontroller,
                        autovalidate: _autoValidate,
                        textCapitalization: TextCapitalization.words,
                        style: inputTextStyle(),
                        validator: (String value) {
                          return value.isEmpty ? 'Could Not be Empty' : null;
                        },
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: inputImageDecoration(
                          hintText: S.hint_input_firstName,
                          image: R.image.ic_name,
                        ),
                        inputFormatters: [
                          WhitelistingTextInputFormatter(RegExp("[A-Za-z]")),
                        ]),
                    // margin: EdgeInsets.only(bottom: 20),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      controller: lastNamecontroller,
                      autovalidate: _autoValidate,
                      textCapitalization: TextCapitalization.words,
                      style: inputTextStyle(),
                      validator: (String value) {
                        return value.isEmpty ? 'Could Not be Empty' : null;
                      },
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: inputImageDecoration(
                        hintText: S.hint_input_lastName,
                        image: R.image.ic_name,
                      ),
                      inputFormatters: [
                        WhitelistingTextInputFormatter(RegExp("[A-Za-z]")),
                      ],
                    ),
                    //margin: EdgeInsets.only(bottom: 20),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      controller: emailcontroller,
                      autovalidate: _autoValidate,
                      textCapitalization: TextCapitalization.words,
                      style: inputTextStyle(),
                      validator: (String value) {
                        // return value.isEmpty ? 'Could Not be Empty' : null;
                        Pattern pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = new RegExp(pattern);
                        if (!regex.hasMatch(value))
                          return 'Enter Valid Email';
                        else
                          return null;
                      },
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: inputImageDecoration(
                        hintText: S.hint_input_email_id,
                        image: R.image.ic_emailid,
                      ),
                    ),
                    //margin: EdgeInsets.only(bottom: 20),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      controller: mobilecontroller,
                      autovalidate: _autoValidate,
                      style: inputTextStyle(),
                      validator: (String value) {
                        return value.isEmpty || value.length < 10
                            ? 'Enter Valid Mobile Number'
                            : null;
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      decoration: inputImageDecoration(
                        hintText: S.hint_input_mobile,
                        image: R.image.icon_call,
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        WhitelistingTextInputFormatter(RegExp("[0-9]")),
                      ],
                    ),
                    // margin: EdgeInsets.only(bottom: 20),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      controller: referralcodecontroller,
                      autovalidate: _autoValidate,
                      textCapitalization: TextCapitalization.words,
                      style: inputTextStyle(),
                      validator: (String value) {},
//                      onChanged: (value) {
//                        return value.length < 8
//                            ? " Enter Valid Referral Code"
//                            : getphoneNumber(value);
//                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      decoration: inputImageDecoration(
                        hintText: "Referral Code (Optional)",
                        image: R.image.ic_code,
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(8),
                        // WhitelistingTextInputFormatter(RegExp("[0-9]")),
                      ],
                    ),
                    // margin: EdgeInsets.only(bottom: 20),
                  ),

                  Container(
                    child: button(
                        text: S.btn_sign_up.toUpperCase(),
                        onPressed: () {
                          _validateInputs();
                          // if (validateForm()) {
                          //   pr.show();
                          //   signupApi();

                          //   // Navigator.of(context).push(MaterialPageRoute(
                          //   //     builder: (contextTrans) => DashBoard_Page()));
                          // }
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //       builder: (contextTrans) => SampleOtp()),
                          //   // ModalRoute.withName(RouterName.MAIN),
                          // );
                        }),
                    margin: EdgeInsets.only(top: 20, bottom: 20),
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
      // ],
      //),
      // ),
    );
  }

  void _validateInputs() {
    if (formkey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _asyncConfirmDialog(context);

      formkey.currentState.save();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  Future _asyncConfirmDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are You Sure Want To Submit'),
          actions: <Widget>[
            FlatButton(
              child: const Text('No', style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: const Text('Yes', style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    firstNamecontroller.dispose();
    lastNamecontroller.dispose();
    emailcontroller.dispose();
    mobilecontroller.dispose();
    super.dispose();
  }
}
