import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sagala/classes.dart';
import 'package:sagala/constant.dart';
import 'package:sagala/models/api_url.dart';
import 'package:sagala/size_config.dart';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String emailText = "";
  final _key = new GlobalKey<FormState>();

  Future<void> _submit() async {
    try {
      var response = await http.post(
        baseUrl + 'auth/password-reset/request',
        body: jsonEncode({
          "email": emailText,
        }),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 400) {
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse['message']);
        _showFailedDialog(context);
      } else if (response.statusCode == 201) {
        _showSuccessDialog();
      } else {
        print('Terjadi kesalahan sistem');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _showSuccessDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Icon(
          Icons.check_circle_outline,
          color: Colors.green[400],
          size: 40,
        ),
        content: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Text(
              'Silahkan periksa Email anda',
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
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/login'),
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
              'Email tidak tersedia di database',
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
            'Lupa Password',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
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
                              hintText: 'Masukkan Alamat Email',
                            ),
                            validator: (val) {
                              if (val.length == null) {
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
                      Center(
                        child: FlatButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              if (_key.currentState.validate()) {
                                _submit();
                              }
                              _key.currentState.save();
                            },
                            child: Ink(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: SizeConfig.screenWidth <= 360.0
                                      ? 60
                                      : 85),
                              decoration: BoxDecoration(
                                  gradient: cGradientColor,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Text(
                                'RESET PASSWORD',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
