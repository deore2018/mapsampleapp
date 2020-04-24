import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:samplemap/constant/constant_class.dart';

TextStyle home_item_textstyle() => TextStyle(
    fontSize: 16,
    fontFamily: "Cocomat Light-trial",
    fontWeight: FontWeight.w500,
    color: Colors.white);

TextStyle inputTextStyle() =>
    TextStyle(fontSize: 16, color: R.color.dark_black);

InputDecoration inputImageDecoration({image: String, hintText: String}) =>
    InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Image.asset(
          image,
          color: Colors.blue,
          fit: BoxFit.none,
        ),
        focusedBorder: _borderTextField(),
        border: _borderTextField(),
        enabledBorder: _borderTextField(),
        hintText: hintText,
        hintStyle: hintStyle());

InputBorder _borderTextField() => OutlineInputBorder(
  borderRadius: BorderRadius.circular(200),
  borderSide: BorderSide(
      width: 0, style: BorderStyle.solid, color: R.color.dark_white),
);

TextStyle hintStyle() => TextStyle(fontSize: 16, color: R.color.gray);

GradientButton button(
    {text: String,
      Function onPressed,
      double height = 16,
      double width = 200}) =>
    GradientButton(
      increaseHeightBy: height,
      increaseWidthBy: width,
      child: Text(
        text,
      ),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      callback: onPressed,
      gradient: BlueGradient(),
      shadowColor: Colors.black,
    );

Gradient BlueGradient() => LinearGradient(
    colors: [R.color.blue, R.color.light_blue],
    begin: Alignment.bottomLeft,
    end: Alignment.centerRight);