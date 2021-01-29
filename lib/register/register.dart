import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sagala/constant.dart';
import 'package:sagala/models/api_url.dart';
import 'package:sagala/size_config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool loadingSubmit = false;
  String nameText = "";
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
        baseUrl + 'auth/register',
        body: jsonEncode({
          "name": nameText,
          "email": emailText,
          "password": passText,
        }),
        headers: {"Content-Type": "application/json"},
      );

      setState(() {
        loadingSubmit = false;
      });

      if (response.statusCode == 400) {
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse['message']);
      } else if (response.statusCode == 201) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        var jsonResponse = jsonDecode(response.body);

        localStorage.setString('token', jsonResponse['data']['token']['value']);
        _showSuccesDialog(context);
      } else {
        print('Terjadi kesalahan sistem');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _showSuccesDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Icon(
          Icons.check_circle_outline,
          color: Colors.green[300],
          size: 40,
        ),
        content: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Text(
              'Pendaftaran berhasil!',
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
            'Register',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Form(
              key: _key,
              child: Column(
                children: <Widget>[
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
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: false, signed: false),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                border: InputBorder.none,
                                hintText: 'Nomor Hp.',
                              ),
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
                                } else if (val.length <= 6) {
                                  return "Password is too short (minimum is 6 characters)";
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
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey[300]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                border: InputBorder.none,
                                hintText: 'Name',
                              ),
                              validator: (val) {
                                if (val.length == 0) {
                                  return "Nama tidak boleh kosong!";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (text) {
                                setState(() {
                                  nameText = text;
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
                        // Padding(
                        //   padding: EdgeInsets.only(bottom: 20),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       border: Border.all(color: Colors.grey[300]),
                        //       borderRadius: BorderRadius.circular(5),
                        //     ),
                        //     child: TextField(
                        //       decoration: InputDecoration(
                        //         contentPadding:
                        //             EdgeInsets.symmetric(horizontal: 15),
                        //         border: InputBorder.none,
                        //         hintText: 'Kota Tinggal',
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(bottom: 20),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       border: Border.all(color: Colors.grey[300]),
                        //       borderRadius: BorderRadius.circular(5),
                        //     ),
                        //     child: TextField(
                        //       maxLines: 4,
                        //       decoration: InputDecoration(
                        //         contentPadding: EdgeInsets.symmetric(
                        //             horizontal: 15, vertical: 10),
                        //         border: InputBorder.none,
                        //         hintText: 'Alamat Pengiriman',
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
                                        : 120),
                                decoration: BoxDecoration(
                                    gradient: cGradientColor,
                                    borderRadius: BorderRadius.circular(40)),
                                child: Text(
                                  'DAFTAR',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Sudah Punya Account ?'),
                            GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, '/login'),
                              child: Text('LOGIN',
                                  style: TextStyle(color: Color(0xFF2EB61F))),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
