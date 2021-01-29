import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class GlobalPubKey {
  static final keyLogin = GlobalKey<FormState>();
  static final keyRegister = GlobalKey<FormState>();
  static final keyForgotPassword = GlobalKey<FormState>();
  // static final riKey3 = const Key('__RIKEY3__');
}

class SharedPref {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}