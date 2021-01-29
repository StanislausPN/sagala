import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sagala/classes.dart';
import 'package:sagala/constant.dart';
import 'package:sagala/models/api_url.dart';
import 'package:sagala/size_config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loadingSubmit = false;
  String emailText = "";
  String passText = '';
  bool isVisible = true;
  final _key = new GlobalKey<FormState>();

  void _showHide() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  Future<void> _submit() async {
    setState(() {
      loadingSubmit = true;
    });

    try {
      var response = await http.post(
        baseUrl + 'auth/login',
        body: jsonEncode({
          "email": emailText,
          "password": passText,
        }),
        headers: {"Content-Type": "application/json"},
      );

      setState(() {
        loadingSubmit = false;
      });

      if (response.statusCode == 404) {
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse['message']);
        _showFailedDialog(context);
      } else if (response.statusCode == 200) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        var jsonResponse = jsonDecode(response.body);
        localStorage.setString('token', jsonResponse['data']['token']['value']);
        localStorage.setString('id', jsonResponse['data']['user']['id']);
        localStorage.setString('name', jsonResponse['data']['user']['name']);
        localStorage.setString('email', jsonResponse['data']['user']['email']);
        Navigator.pushReplacementNamed(context, '/');
        print(jsonResponse['data']['token']['value']);
        print(jsonResponse['data']['user']['email']);
        print(jsonResponse['data']['user']['name']);
      } else {
        print('Terjadi kesalahan sistem');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _showFailedDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Icon(
          Icons.remove_circle_outline,
          color: Colors.red[800],
          size: 40,
        ),
        content: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Text(
              'Login gagal, pastikan email dan pass anda benar!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () => Navigator.pop(context),
                  child: Ink(
                    padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal:
                            SizeConfig.screenWidth <= 360.0 ? 100 : 120),
                    decoration: BoxDecoration(
                        gradient: cGradientColor,
                        borderRadius: BorderRadius.circular(40)),
                    child: Text(
                      'OK',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/svg_icons/icon_arrow_back.svg',
              color: Colors.grey,
              fit: BoxFit.scaleDown,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Login',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Form(
              key: _key,
              // key: GlobalPubKey.keyLogin,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Text(
                      'Silahkan login atau daftar terlebih dahulu untuk melanjutkan.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey[300]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                border: InputBorder.none,
                                hintText: 'Email',
                              ),
                              validator: (val) {
                                if (val.length == 0) {
                                  return "Email tidak boleh kosong";
                                } else if (!val.contains("@")) {
                                  return "Email is not a valid email";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (text) {
                                setState(() {
                                  emailText = text;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey[300]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              obscureText: isVisible ? true : false,
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () => _showHide(),
                                  child: Icon(
                                    isVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: isVisible
                                        ? Colors.grey
                                        : Colors.green[300],
                                  ),
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: 15, top: 15),
                                border: InputBorder.none,
                                hintText: 'Password',
                              ),
                              validator: (val) {
                                if (val.length == 0) {
                                  return "Password tidak boleh kosong";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (text) {
                                setState(() {
                                  passText = text;
                                });
                              },
                            ),
                          ),
                        ),
                        Center(
                          child: FlatButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () async {
                                if (_key.currentState.validate()) {
                                  _submit();
                                }
                                _key.currentState.save();
                              },
                              child: Ink(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: SizeConfig.screenWidth <= 360.0
                                        ? 100
                                        : 126),
                                decoration: BoxDecoration(
                                    gradient: cGradientColor,
                                    borderRadius: BorderRadius.circular(40)),
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Lupa Password? ',
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                            text: 'Klik Disini',
                            style: TextStyle(color: Color(0xFF2EB61F)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                    context, '/forgot-password');
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Belum Punya Account ?'),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/register'),
                            child: Text('REGISTER',
                                style: TextStyle(color: Color(0xFF2EB61F))),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
