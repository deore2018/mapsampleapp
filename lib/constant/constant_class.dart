import 'dart:ui';

import 'package:flutter/material.dart';

class R {
  static final image = _Images();
  static final color = _Color();
}

class _Images {
  final image_dashboard = 'assets/images/interiorone.jpg';
  final image_dashboard_one = 'assets/images/backgroundone.jpg';
  final image_dashboard_two = 'assets/images/backgroundtwo.jpg';
  final image_dashboard_three = 'assets/images/backgroundthree.jpg';
  final image_dashboard_four= 'assets/images/backgroundfour.jpg';
  final image_dashboard_five= 'assets/images/backgroundfive.jpg';
  final image_dashboard_six= 'assets/images/backgroundsix.jpg';
  final image_dashboard_seven= 'assets/images/backgroundseven.jpg';
  final image_dashboard_eight= 'assets/images/backgroundeight.jpg';
  final icon_logo = 'assets/images/logo.png';
  final icon_call= 'assets/images/phone.png';
  final ic_name = 'assets/images/user.png';
  final ic_emailid = 'assets/images/e-mail-envelope.png';
  final ic_code = 'assets/images/binary-code.png';


}

class _Color {
  final gray = Color(0xFF969696);
  final grey = Color(0xFF696969);
  final black = Color(0xFF131313);
  final white = Color(0xFFFFFFFF);
  final dark_black = Color(0xFF000000);
  final blue = Color(0xFF4B66EA);
  final light_blue = Color(0xFF82A0F6);
  final dark_blue = Color(0xFF4F6DE6);
  final dark_white = Color(0xFFE5E5E5);
}

class RouterName {
  static const SIGN_IN = 'sign_in';
  static const SIGN_UP = 'sign_up';
  static const FORGOT_PASSWORD = 'forgot_password';
  static const CREATE_ACCOUNT = 'create_account';
  static const MAIN = 'main';
  static const FIND_DOCTOR = 'find_doctor';
  static const FIND_HOSPITAL = 'find_hospital';
  static const CREATE_APPOINTMENT = 'create_appointment';
  static const APPOINTMENT_CALENDAR = "appointment_calendar";
  static const PRICE_SERVICE = 'price_service';
  static const APPOINTMENT_DETAIL = "appointment_detail";
  static const NOTIFICATION = "notification";
  static const CHAT_DOCTOR = "chat_doctor";
  static const DOCTORS_PROFILES = "doctors_profiles";
  static const CALLING_DOCTOR = "calling_doctor";
  static const MAP_DOCTORS = "map_doctors";
  static const INFORMATION_DOCTOR = "information_doctor";
  static const WORD_ADDRESS_DOCTOR = "word_address_doctor";
  static const REVIEW_DOCTOR = "review_doctor";
  static const BOOK_APPOINTMENT = "book_appointment";
  static const TEST_INDICATORS = "test_indicators";
  static const SETTING_TEST_INDICATORS = "setting_test_indicators";
  static const DETAIL_TEST_INDICATOR = "detail_test_indicator";
  static const SET_GOAL = "set_goal";
  static const GOAL_SETTING = "goal_setting";
  static const DOCTOR_FAVORITES = "doctor_favorites";
  static const INSURRANCE = "insurrance";
  static const ADD_DRUGS = "add_drugs";
  static const DRUGS_LIST = "drugs_list";
  static const DRUGS_DETAIL = "drugs_detail";
  static const DRUGS_SHOP = "drugs_shop";
  static const NEWS = "news";
  static const NEWS_BOOKMARK = "news_bookmark";
  static const NEWS_DETAIL = "news_detail";
  static const NEWS_COMMENT = "news_comment";
  static const RESULT_FIND_DOCTOR = "result_find_doctor";
  static const CREATE_ACCOUNT_BIRTHDAY = "create_account_birthday";
  static const CREATE_ACCOUNT_GENDER = "create_account_gender";
  static const CREATE_ACCOUNT_FULLNAME = "create_account_fullname";
  static const CREATE_ACCOUNT_HEIGHT = "create_account_height";
  static const CREATE_ACCOUNT_WEIGHT = "create_account_weight";
  static const DOCTOR_LIST = "doctor_list";
  static const HOSPITAL_LIST = "hospital_list";
  static const INPUT_TEST_INDICATORS = 'input_test_indicators';
}
