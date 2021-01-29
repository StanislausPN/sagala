import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sagala/classes.dart';
import 'package:sagala/components/card_product.dart';
import 'package:sagala/constant.dart';
import 'package:sagala/home/components/card_donation.dart';
import 'package:sagala/home/components/card_special_promo.dart';
import 'package:sagala/home/components/food_category.dart';
import 'package:http/http.dart' as http;
import 'package:sagala/models/api_url.dart';
import 'package:sagala/models/product_modal.dart';
import 'package:sagala/size_config.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List listProduct = [];
  List<GetProduct> getProduct = [];
  List listSpecialPromo = [];
  List listCategory = [];
  String categoryTitle = 'Semua';
  int productCategoryId;
  bool loadingList = true;
  bool boolSpecialPromo = true;
  bool _hasMore;
  int _pageNumber;
  bool loading;
  bool error;
  final int _maxResult = 2;
  int productCount = 0;
  AutoScrollController _autoScrollcontroller;
  Product saveProduct = Product();
  Product loadProduct = Product();
  SharedPref sharedPref = SharedPref();
  int _countItem = 0;

  List<String> imageAssets = [
    'assets/images/sayuran.png',
    'assets/images/buah_segar.png',
    'assets/images/karbohidrat.png',
    'assets/images/protein.png',
    'assets/images/rempah_dan_bumbu.png',
    'assets/images/bumbu_instan.png',
    'assets/images/pelengkap_dapur.png',
    'assets/images/siap_santap_dan_camilan.png',
    'assets/images/frozen_food.png',
    'assets/images/aneka_bahan_kue.png',
    'assets/images/paket_hemat.png',
    'assets/images/perawatan_rumah.png',
    'assets/images/paket_hemat.png',
    'assets/images/perawatan_rumah.png',
  ];

  bool active = false;
  void itemCounterAdd() async {
    setState(() {
      _countItem++;
    });
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // localStorage.setInt('qty', _countItem);
  }

  void itemCounterRemove() {
    setState(() {
      _countItem--;
    });
  }

  // void _getProduct() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var product = localStorage.getString('product');
  //   if (product == null) {
  //     setState(() {
  //       active = false;
  //     });
  //   } else {
  //     setState(() {
  //       active = true;
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _fetchCategory();
    _hasMore = true;
    _pageNumber = 1;
    error = false;
    loading = true;
    Future.delayed(Duration.zero, () async {
      fetchSpecialPromo();
    });
    _loadProductToCart();
    _autoScrollcontroller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
  }

  void _loadProductToCart() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.getString('product');

    // productCategoryId = 1;
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var productId = localStorage.setInt('productId', productCategoryId);

    // print(productId);
  }

  void _addProductToCart() {
    // listProduct.add(value)
    sharedPref.save('product', saveProduct);
  }

  Future _scrollToIndex() async {
    await _autoScrollcontroller.scrollToIndex(0,
        preferPosition: AutoScrollPosition.begin,
        duration: Duration(seconds: 2));
  }

  Widget _wrapScrollTag({int index, Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollcontroller,
      index: index,
      child: child,
    );
  }

  void _fetchCategory() async {
    setState(() {
      listCategory = [];
    });
    try {
      var response = await http.get(
        baseUrl + 'category?maxResult=100&page=1',
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        setState(() {
          listCategory = jsonResponse['data'];
          loadingList = false;
        });
        // print(categoryId);
        print(listCategory.length);
      } else {
        print('Terjadi kesalahan sistem');
      }
    } catch (e) {
      print('Terjadi kesalahan sistem: $e');
    }
  }

  void fetchSpecialPromo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var locationCode = localStorage.getString('location');
    setState(() {
      listSpecialPromo = [];
    });
    try {
      var response = await http.get(
        baseUrl +
            'product?maxResult=10&page=1&district_code=' +
            locationCode +
            '&specialPromo=true',
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        setState(() {
          listSpecialPromo = jsonResponse['data'];
          loadingList = false;
        });
        if (listProduct.isNotEmpty) {
        } else {
          _fetchAllProduct();
        }
      } else {
        print('Terjadi kesalahan sistem');
      }
    } catch (e) {
      print('Terjadi kesalahan sistem: $e');
    }
  }

  Future<void> _fetchProductbyCategory(String productId) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var locationCode = localStorage.getString('location');
    setState(() {
      listProduct = [];
    });

    try {
      var response = await http.get(
        baseUrl +
            'product?maxResult=2' +
            // _maxResult.toString() +
            '&page=' +
            _pageNumber.toString() +
            '&district_code=' +
            locationCode +
            '&category_id=' +
            productId,
        headers: {
          "Content-Type": "application/json",
        },
      );

      setState(() {
        loadingList = false;
      });

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body)['data'];
        List fetchProduct =
            jsonResponse.map((e) => Product.fromJson(e)).toList();

        setState(() {
          listProduct.addAll(fetchProduct);
        });
      } else {
        print('Terjadi kesalahan sistem');
      }
    } catch (e) {
      print('Terjadi kesalahan sistem: $e');
    }
  }

  Future<void> _fetchAllProduct() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var locationCode = localStorage.getString('location');
    setState(() {
      listProduct = [];
      boolSpecialPromo = false;
    });
    try {
      var response = await http.get(
        baseUrl +
            'product?maxResult=2' +
            // _maxResult.toString() +
            '&page=' +
            _pageNumber.toString() +
            '&district_code=' +
            locationCode,
        headers: {
          "Content-Type": "application/json",
        },
      );

      setState(() {
        loadingList = false;
      });

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body)['data'];
        // listProduct = jsonResponse['data'];
        List fetchProduct =
            jsonResponse.map((e) => Product.fromJson(e)).toList();

        setState(() {
          // for (Map index in jsonResponse) {
          //   listProduct.add(Product.fromJson(index));
          // }

          // listProduct.insertAll(listProduct.length, fetchProduct);

          listProduct.addAll(fetchProduct);
          // loadingList = false;
          // _hasMore = listProduct.length == _defaultProductItem;
          // loading = false;
          // _pageNumber = _pageNumber + 1;

          // print(listProduct.length);
          // print(_pageNumber);
          // listProduct.addAll(fetchProduct);
        });
        // print(listProduct[0]['name']);
      } else {
        print('Terjadi kesalahan sistem');
      }
    } catch (e) {
      print('Terjadi kesalahan sistem: $e');
      setState(() {
        loading = false;
        error = true;
      });
    }
  }

  @override
  void dispose() {
    _autoScrollcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      children: [
        Expanded(
          child: Column(
            children: <Widget>[
              PreferredSize(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: cGradientColor,
                    ),
                    height: 60,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Cari produk disini....',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 5.0),
                                prefixIcon: Icon(Icons.search)),
                          ),
                        )),
                  ),
                  preferredSize: Size.fromHeight(60.0)),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollNotifiaction) {
                    if (scrollNotifiaction.metrics.pixels ==
                        scrollNotifiaction.metrics.maxScrollExtent) {
                      print('END OF PAGE');
                      // _fetchAllProduct();
                    }
                    return;
                  },
                  child: SingleChildScrollView(
                    controller: _autoScrollcontroller,
                    // controller to index
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: SizeConfig.screenHeight <= 685 ? 190 : 230,
                          padding:
                              EdgeInsets.only(left: 20, top: 20, bottom: 20),
                          child: CardDonation(),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: listCategory.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: SizeConfig.screenWidth /
                                  (SizeConfig.screenHeight * 0.2),
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return FoodCategory(
                                imageAsset: imageAssets[index],
                                name: listCategory[index]['name'],
                                onPress: () {
                                  _scrollToIndex();
                                  _fetchProductbyCategory(
                                      listCategory[index]['id']);
                                  setState(() {
                                    categoryTitle = listCategory[index]['name'];
                                  });
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 20, bottom: 20, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: boolSpecialPromo
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              'Special Promo Hari ini',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20.0),
                                              child: Text(
                                                'Lihat Semua >',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xFF2EB61F)),
                                              ),
                                            )
                                          ],
                                        )
                                      : Container()),

                              // Container(
                              //   height: 380,
                              //   width: double.infinity,
                              //   child: loadingList
                              //       ? ListView.builder(
                              //           itemCount: 3,
                              //           scrollDirection: Axis.horizontal,
                              //           itemBuilder: (context, index) {
                              //             return ShimmerProductCard();
                              //           })
                              //       : SingleChildScrollView(
                              //           scrollDirection: Axis.horizontal,
                              //           child: Row(children: <Widget>[
                              //             ...listSpecialPromo.map((item) {
                              //               int price = item['price']['amount'];
                              //               int afterDisc =
                              //                   item['price']['amountWithDiscount'];
                              //               double discount =
                              //                   100 - ((afterDisc / price) * 100);
                              //               return CardProduct(
                              //                 disc: discount.floor().toString(),
                              //                 // imageAssets: item['object_name'],
                              //                 cardId: item['id'].toString(),
                              //                 price:
                              //                     'Rp. ${item['price']['amount'].toString()}',
                              //                 priceAfterDisc:
                              //                     'Rp. ${item['price']['amountWithDiscount'].toString()}',
                              //                 title: item['name'],
                              //                 shortDesc: item['shortDescription'],
                              //                 unit: item['unit'],
                              //                 stock:
                              //                     'Tersedia. ${item['price']['stock'].toString()}',
                              //               );
                              //             }),
                              //           ]),
                              //         ),
                              // )
                            ],
                          ),
                        ),
                        _wrapScrollTag(
                          index: 0,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20, bottom: 20),
                            child: Text(
                              categoryTitle,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        RaisedButton(onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        }),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: GridView.builder(
                            itemCount: listProduct.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    // childAspectRatio: 0.44,
                                    childAspectRatio: SizeConfig.screenWidth /
                                        (SizeConfig.screenHeight * 1.3),
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 5.0,
                                    crossAxisCount: 2),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final product = listProduct[index];
                              int price = product.price.amount;
                              int afterDisc = product.price.amountWithDiscount;
                              double discount =
                                  100 - ((afterDisc / price) * 100);
                              String productID = product.id.toString();
                              String productName = product.name;
                              final productData = GetProduct(
                                  id: productID,
                                  name: productName,
                                  price: afterDisc,
                                  qty: _countItem);
                              return CardProduct(
                                qty: _countItem,
                                disc: discount.floor().toString(),
                                imageAssets: 'assets/images/buah_apel.png',
                                cardId: product.id.toString(),
                                price: 'Rp. ${product.price.amount.toString()}',
                                priceAfterDisc:
                                    'Rp. ${product.price.amountWithDiscount.toString()}',
                                title: product.name,
                                shortDesc: product.shortDescription,
                                unit: product.unit,
                                stock:
                                    'Tersedia. ${product.price.stock.toString()}',
                                onPressAdd: () async {
                                  itemCounterAdd();
                                  print('Added');
                                  print(_countItem);
                                  print(productData.id);
                                  // final prefs =
                                  //     await SharedPreferences.getInstance();
                                  // var getUser = prefs.getString('product');
                                  // final dataList = jsonDecode(getUser);
                                  // setState(() {
                                  //   productCount = dataList.length;
                                  // });
                                  // print(dataList);
                                },
                                onPressRemove: () async {
                                  itemCounterRemove();
                                  // final prefs =
                                  //       await SharedPreferences.getInstance();
                                  //       prefs.setString('product', encodeProduct);
                                  //prefs.reload();
                                  // if(_countItem == 0){
                                  // remove('product{product.id}')
                                  // }
                                  // if (getProduct.isNotEmpty) {
                                  //   getProduct.removeWhere(
                                  //       (element) => element.qty == _countItem);
                                  //   getProduct.insert(index, productData);
                                  // print('removed');
                                  // }
                                },
                                onPressBuy: () async {
                                  if (productData.id == product.id) {
                                    itemCounterAdd();
                                  }
                                  // if (getProduct.isNotEmpty) {
                                  //   getProduct.removeWhere(
                                  //       (element) => element.qty == _countItem);
                                  //   getProduct.insert(index, productData);
                                  // } else {
                                  //   getProduct.add(productData);
                                  //   final encodeProduct =
                                  //       jsonEncode(getProduct);
                                  // final prefs =
                                  //     await SharedPreferences.getInstance();
                                  // prefs.setString('product${product.id}', encodeProduct);
                                  //   print(encodeProduct);
                                  // }
                                  //gunakan sharedpreference reload sebelum get
                                  // _addProductToCart();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              productCount == 0
                  ? Container()
                  : Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: SizeConfig.screenWidth <= 360 ? 5 : 15),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8.0,
                                      right: 10,
                                    ),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xFFEDF2DF),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Icon(
                                            Icons.shopping_cart,
                                            color: Color(0xFF2EB61F),
                                            size: 20,
                                          ),
                                        )),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        radius: 8,
                                        child: Text(
                                          '${productCount.toString()}',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Rp. 250.000',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  Text(
                                      'Free ongkir pembelian di atas Rp. 100.000',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.grey))
                                ],
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: cGradientColor),
                            // padding: EdgeInsets.symmetric(horizontal: 2),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              onPressed: () {
                                // Navigator.pushNamed(context, '/register');
                              },
                              child: Text(
                                'Lanjut',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

class ShimmerProductCard extends StatelessWidget {
  ShimmerProductCard();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(milliseconds: 800),
      baseColor: Color(0XFFD6D6D6),
      highlightColor: Colors.white,
      child: Card(
          child: Container(
        width: 180,
        // height: 150,
      )),
    );
  }
}
