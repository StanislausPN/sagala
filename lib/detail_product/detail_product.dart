import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sagala/constant.dart';
import 'package:sagala/models/api_url.dart';
import 'package:sagala/models/product_modal.dart';
import 'package:sagala/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'components/search_result_list.dart';

class DetailProduct extends StatefulWidget {
  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  bool active = false;
  int _countItem = 0;
  int _currentview = 0;
  int price = 0;
  int afterDisc = 0;
  String discText;
  DateTime backbuttonpressedTime;
  bool loadingData = true;
  var detailProduct;

  void itemCounterAdd() {
    setState(() {
      _countItem++;
    });
  }

  void itemCounterRemove() {
    setState(() {
      _countItem--;
    });
  }

  List<Widget> _pages() => [
        _searchView(),
        _searchResult(),
      ];

  Future<bool> _onWillPop() async {
    DateTime currentTime = DateTime.now();

    bool backButton = backbuttonpressedTime == null ||
        currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);

    if (_currentview == 1) {
      setState(() {
        _currentview = 0;
      });
    } else if (backButton) {
      backbuttonpressedTime = currentTime;
      setState(() {
        active = false;
      });
      print(active);
      return false;
    }
    return true;
  }

  Widget _searchView() {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
                padding: EdgeInsets.all(10),
                width: SizeConfig.screenWidth * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Semua hasil Pencarian',
                        style: TextStyle(color: Colors.black)),
                    Text('Buah Segar',
                        style: TextStyle(
                          color: Color(0xFF2EB61F),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentview = 1;
                          });
                        },
                        child: Icon(Icons.chevron_right))
                  ],
                )),
          ),
          SearchResultList()
        ],
      ),
    );
  }

  Widget _searchResult() {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hasil pencarian "Buah Segar" 30 item',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 20,
            ),
            width: SizeConfig.screenWidth * 0.9,
            height: SizeConfig.screenHeight * 0.79,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 12,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: SizeConfig.screenWidth <= 360.0
                    ? SizeConfig.screenWidth / (SizeConfig.screenHeight * 1.2)
                    : SizeConfig.screenWidth / (SizeConfig.screenHeight * 1.1),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: SizeConfig.screenWidth * 0.43,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.asset(
                          'assets/images/buah_apel.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Apel manis Has Bali BY Zahra Zain Cibadak',
                                style: TextStyle(
                                  fontSize: 13,
                                )),
                            Text(
                              'Rp50.000 ',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'Rp68.000',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 12,
                                    color: Colors.grey,
                                    height: 1.5),
                              ),
                              TextSpan(
                                text: '  10%',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    height: 1.5),
                              )
                            ])),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: double.infinity,
                              height: 30,
                              child: OutlineButton(
                                onPressed: () {},
                                child: Text(
                                  'Beli',
                                  style: TextStyle(
                                      color: Color(0xFF3BBB2D),
                                      fontWeight: FontWeight.bold),
                                ),
                                focusColor: Color(0xFF3BBB2D),
                                splashColor: Color(0xFF3BBB2D),
                                highlightedBorderColor: Color(0xFF3BBB2D),
                                color: Color(0xFF3BBB2D),
                                borderSide: BorderSide(
                                  color: Color(0xFF3BBB2D),
                                ),
                                shape: StadiumBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: cGradientColor,
        ),
      ),
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: SvgPicture.asset(
          'assets/svg_icons/icon_arrow_back.svg',
          fit: BoxFit.scaleDown,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            right: 20,
          ),
          child: Container(
            width: SizeConfig.screenWidth * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: TextField(
              onTap: () {
                setState(() {
                  active = true;
                });
              },
              decoration: InputDecoration(
                  hintText: 'Search....',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      _fetchProductDetail();
    });
  }

  void _fetchProductDetail() async {
    final ProductModal args = ModalRoute.of(context).settings.arguments;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var locationCode = localStorage.getString('location');

    setState(() {
      loadingData = true;
    });

    try {
      var response = await http.get(
        baseUrl +
            'product/' +
            args.productId +
            '?district_code=' +
            locationCode,
        headers: {
          "Content-Type": "application/json",
        },
      );

      setState(() {
        loadingData = false;
      });
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        setState(() {
          detailProduct = jsonResponse['data'];
          price = detailProduct['price']['amount'];
          afterDisc = detailProduct['price']['amountWithDiscount'];
        });

        double discount = 100 - ((afterDisc / price) * 100);
        discText = discount.floor().toString();
      } else {
        print('Terjadi kesalahan sistem');
      }
    } catch (e) {
      print('Terjadi kesalahan sistem: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final List<Widget> pages = _pages();

    // int price = detailProduct != null ?  : 0;
    // int afterDisc = detailProduct != null
    //     ?
    //     : 0;

    return Scaffold(
      persistentFooterButtons:
          active == false ? null : <Widget>[pages[_currentview]],
      appBar: _buildAppBar(context),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/buah_pisang.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.only(left: 20),
                  //   height: SizeConfig.screenHeight * 0.08,
                  //   child: ListView.builder(
                  //       shrinkWrap: true,
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (context, index) {
                  //         return Padding(
                  //           padding: EdgeInsets.only(right: 8),
                  //           child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(10),
                  //               child: Image.asset(
                  //                 'assets/images/buah_pisang.png',
                  //                 fit: BoxFit.cover,
                  //               )),
                  //         );
                  //       }),
                  // ),
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                              detailProduct != null
                                  ? detailProduct['name']
                                  : '',
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5)),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: detailProduct != null
                                  ? 'Rp. ${detailProduct['price']['amountWithDiscount'].toString()}   '
                                  : '',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  height: 2),
                            ),
                            TextSpan(
                                text: detailProduct != null
                                    ? 'Rp. ${detailProduct['price']['amount'].toString()}'
                                        .toString()
                                    : '',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    decoration: TextDecoration.lineThrough)),
                            TextSpan(
                                text: '  -$discText%',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    height: 2)),
                          ])),
                          Wrap(
                            children: <Widget>[
                              Text(
                                detailProduct != null
                                    ? detailProduct['description']
                                    : '',
                                style:
                                    TextStyle(color: Colors.grey, height: 1.5),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.05,
                          ),
                          _countItem == 0
                              ? Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: cGradientColorItem),
                                  child: FlatButton(
                                    disabledColor: Color(0xFFEFEFEF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0),
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    onPressed: () => itemCounterAdd(),
                                    child: Text(
                                      'Beli',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              : Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: SizeConfig.screenWidth * 0.6,
                                      height: 43,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                            Color(0xFFF5F5F5),
                                            Color(0xFFF4F4F4),
                                            Color(0xFFF7F7F7),
                                            Color(0xFFE6E6E6),
                                            Color(0xFFE6E6E6),
                                            Color(0xFFE6E6E6),
                                            Color(0xFFF7F7F7),
                                            Color(0xFFF4F4F4),
                                            Color(0xFFF5F5F5),

                                            // Colors.white,
                                            // Colors.grey[400].withOpacity(0.3),
                                            // Colors.grey.withOpacity(0.3),
                                            // Colors.grey[400].withOpacity(0.3),
                                            // Colors.white,
                                          ])),
                                    ),
                                    // ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        FlatButton(
                                            padding: EdgeInsets.all(0),
                                            onPressed: () =>
                                                itemCounterRemove(),
                                            child: Ink(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8, horizontal: 30),
                                              decoration: BoxDecoration(
                                                  gradient: cGradientColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                            )),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 40),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text(
                                            '$_countItem',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16),
                                          ),
                                        ),
                                        FlatButton(
                                            padding: EdgeInsets.all(0),
                                            onPressed: () => itemCounterAdd(),
                                            child: Ink(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8, horizontal: 30),
                                              decoration: BoxDecoration(
                                                  gradient: cGradientColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                          // SizedBox(
                          //   height: SizeConfig.screenHeight * 0.03,
                          // ),

                          //<======= tombol tambah kurang dan counter (Box shadow pada text counter belum sempurna)=====>
                          //
                        ],
                      )),
                ],
              ),
            ),
            // Container(
            //   height: SizeConfig.screenHeight * 0.8,
            //   padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Padding(
            //         padding: const EdgeInsets.only(bottom: 10.0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: <Widget>[
            //             Text(
            //               'Produk Serupa',
            //               style: TextStyle(
            //                   fontSize: 16, fontWeight: FontWeight.bold),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(right: 20.0),
            //               child: Text(
            //                 'Lihat Semua >',
            //                 style: TextStyle(
            //                     fontSize: 12, color: Color(0xFF2EB61F)),
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //       CardSpecialPromo(),
            //     ],
            //   ),
            // ),
          ],
        )),
      ),
    );
  }
}
