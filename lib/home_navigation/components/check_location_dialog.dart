import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sagala/constant.dart';
import 'package:sagala/models/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CheckLocationDialog extends StatefulWidget {
  final Function onInit;

  const CheckLocationDialog({Key key, @required this.onInit}) : super(key: key);

  @override
  _CheckLocationDialogState createState() => _CheckLocationDialogState();
}

class _CheckLocationDialogState extends State<CheckLocationDialog> {
  List listCity = [];
  bool loadingList = true;
  String cityCode;
  String dropdownValueLocation;
  var name;
  String namaKota = '';
  String namaProvinsi = '';
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCityCode() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('location', cityCode);
    localStorage.setString('city', namaKota);
    localStorage.setString('province', namaProvinsi);
    Navigator.pop(context, true);
  }

  void _getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final coordinates = Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setState(() {
      namaKota = addresses.first.subAdminArea;
      namaProvinsi = addresses.first.adminArea;
    });
    _fetchCity();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  void _fetchCity() async {
    setState(() {
      loadingList = true;
      listCity = [];
    });

    try {
      var response = await http.get(
        baseUrl + 'region/district/supported-districts?maxResult=100&page=1',
        headers: {
          "Content-Type": "application/json",
        },
      );
      print('NAMA KOTA : $namaKota');
      print('PROVINSI : $namaProvinsi');

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        setState(() {
          listCity = jsonResponse['data'];
        });

        for (final index in listCity) {
          if (namaKota == (index['type'] + " " + index['name'])) {
            print('cocok');
            setState(() {
              cityCode = index['code'];
            });
            _getCityCode();
            widget.onInit();
            print(cityCode);
            break;
          } else {
            setState(() {
              loadingList = false;
            });
            print('gak cocok');
          }
        }
      } else {
        print('Terjadi kesalahan sistem');
      }
      // } else {
      //   print('Lokasi tidak ditemukan');
      // _determinePosition();
      // }
    } catch (e) {
      setState(() {
        loadingList = false;
      });
      print('Terjadi kesalahan sistem: $e');
    }
  }

  DropdownButton<String> _buildDropdownCity() {
    return DropdownButton<String>(
      value: dropdownValueLocation,
      hint: Text("Pilih lokasi anda"),
      onChanged: (String locationList) {
        setState(() {
          dropdownValueLocation = locationList;
        });
      },
      items: listCity.map((item) {
        return DropdownMenuItem(
          child: Text(item['type'] + ' ' + item['name']),
          value: item['id'].toString(),
          onTap: () {
            setState(() {
              cityCode = item['code'];
              namaKota = item['name'];
            });
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Column(
          children: [
            GestureDetector(
              onTap: () {
                _fetchCity();
              },
              child: Center(
                  child: Image.asset(
                'assets/images/logo_big.png',
                height: 60,
                width: 130,
              )),
            ),
            Text(
              'Hi, Selamat datang di Sagala.id',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        content: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // getText(['one', 'two', 'three', 'four']),
                loadingList
                    ? Container()
                    : Text(
                        'Silahkan memilih lokasi terlebih dahulu ya kak',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                loadingList
                    ? Transform.scale(
                        scale: 0.5,
                        child: CircularProgressIndicator(),
                      )
                    : _buildDropdownCity(),
                loadingList
                    ? Text('Checking your location...')
                    : Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: cGradientColorItem),
                          child: FlatButton(
                            disabledColor: Color(0xFFEFEFEF),
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onPressed: () {
                              _getCityCode();
                              if (widget.onInit != null) {
                                widget.onInit();
                              }
                            },
                            child: Text(
                              'LANJUTKAN',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
              ],
            ),
          ],
        ));
  }
}
