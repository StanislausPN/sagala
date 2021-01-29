import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sagala/delivery_area/components/card_location.dart';
import 'package:sagala/size_config.dart';

class DeliveryArea extends StatefulWidget {
  @override
  _DeliveryAreaState createState() => _DeliveryAreaState();
}

class _DeliveryAreaState extends State<DeliveryArea> {
  List<City> jakartaCityList = <City>[
    City(1, 'JAKARTA BARAT'),
    City(2, 'JAKARTA SELATAN'),
    City(3, 'JAKARTA TIMUR'),
    City(4, 'JAKARTA UTARA'),
  ];
  List<City> bandungCityList = <City>[
    City(1, 'KAB. BANDUNG'),
    City(2, 'KOTA BANDUNG'),
    City(3, 'KAB. BOGOR'),
    City(4, 'KOTA. SUKABUMI'),
    City(4, 'KAB. SUKABUMI'),
    City(4, 'KAB. BEKASI'),
    City(4, 'KOTA BEKASI'),
    City(4, 'KAB. GARUT'),
    City(4, 'PURWAKARTA'),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.grey,
              ),
              onPressed: () => Navigator.pop(context))
        ],
        title: Padding(
          padding: EdgeInsets.only(top: 30.0, left: 10),
          child: Text(
            'Area Pengiriman',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.0, top: 10, right: 20),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF9FAF9),
                border: Border.all(color: Colors.grey[300]),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15),
                    hintText: 'Ketikan kabupaten/kota kamu berada...',
                    border: InputBorder.none,
                    prefixIcon: SvgPicture.asset(
                      'assets/svg_icons/search_icon.svg',
                      fit: BoxFit.scaleDown,
                    )),
              ),
            ),
            CardLocation(),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Icon(Icons.location_on),
                    ),
                    Text('Jakarta'),
                  ],
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 30),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: jakartaCityList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            jakartaCityList[index].selected =
                                !jakartaCityList[index].selected;
                            print(jakartaCityList[index].selected);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                jakartaCityList[index].cityName,
                                style: TextStyle(
                                    height: 2,
                                    color: (jakartaCityList[index].selected ==
                                            false)
                                        ? Colors.black
                                        : Color(0xFF2EB61F)),
                              ),
                              (jakartaCityList[index].selected == false)
                                  ? Container()
                                  : Icon(
                                      Icons.check_circle_outline,
                                      color: Color(0xFF2EB61F),
                                    )
                            ],
                          ),
                        );
                      }),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Icon(Icons.location_on),
                    ),
                    Text('Bandung'),
                  ],
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 30),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: bandungCityList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            bandungCityList[index].selected =
                                !bandungCityList[index].selected;
                            print(bandungCityList[index].selected);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                bandungCityList[index].cityName,
                                style: TextStyle(
                                    height: 2,
                                    color: (bandungCityList[index].selected ==
                                            false)
                                        ? Colors.black
                                        : Color(0xFF2EB61F)),
                              ),
                              (bandungCityList[index].selected == false)
                                  ? Container()
                                  : Icon(
                                      Icons.check_circle_outline,
                                      color: Color(0xFF2EB61F),
                                    )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class City {
  final int id;
  final String cityName;
  bool selected = false;

  City(
    this.id,
    this.cityName,
  );
}
