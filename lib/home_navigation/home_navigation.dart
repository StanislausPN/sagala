import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sagala/components/select_address_dialog.dart';
import 'package:sagala/constant.dart';
import 'package:sagala/home/components/notification_panel.dart';
import 'package:sagala/home/home.dart';
import 'package:sagala/home_navigation/components/check_location_dialog.dart';
import 'package:sagala/main.dart';
import 'package:sagala/size_config.dart';
import 'package:sagala/transaction/transaction.dart';
import 'package:sagala/wishlist_page/wishlist.dart';
import 'package:sagala/wishlist_page/wishlist_not_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeNavigation extends StatefulWidget {
  HomeNavigation({Key key}) : super(key: key);

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  bool selected = false;
  int _selectedIndex = 0;
  bool isLogin;
  final GlobalKey<ScaffoldState> _drawerKey = new GlobalKey<ScaffoldState>();
  String namaKota = 'Kota anda';
  String namaProvinsi = 'Provinsi anda';
  String nama = 'Nama anda';

  List<Widget> _children() => [
        HomePage(
          key: keyHomePage,
        ),
        TransactionPage(),
        isLogin == false ? WishlistNotLogin() : WishlistPage(),
        Container(),
      ];

  void _onItemTapped(int index) {
    setState(() {
      if (index == 3) {
        _drawerKey.currentState.openDrawer();
      } else {
        _selectedIndex = index;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    locationCheck();
    isLogin = false;
  }

  Future<void> _userCheck() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    localStorage.getString('id');
    var name = localStorage.getString('name');
    localStorage.getString('email');

    if (token != null) {
      setState(() {
        isLogin = true;
        nama = name;
      });
    }
  }

  void locationCheck() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var locationCode = localStorage.getString('location');
    if (locationCode == null) {
      _showLocationDialog();
    } else {
      _userCheck();
      var getCity = localStorage.getString('city');
      var getProvince = localStorage.getString('province');

      setState(() {
        namaKota = getCity;
        namaProvinsi = getProvince;
      });
      keyHomePage.currentState.fetchSpecialPromo();
      // if (token == null) {
      //   setState(() {
      //     isLogin = true;
      //   });
      // }
      return;
    }
  }

  Future<void> _showLocationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: CheckLocationDialog(
              onInit: () {
                locationCheck();
                // Home. fetchspecialpromo
                // keyFunction.currentState.fetchSpecialPromo();
              },
            ));
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future _alertDialogShowAddress(BuildContext context) {
    return showDialog(context: context, builder: (_) => SelectAddress());
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              isLogin == false
                  ? Column(
                      children: [
                        ListTile(
                          title: Text('Contact Us'),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('Term and Agreement'),
                          onTap: () {},
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(Icons.close),
                                ))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/buah_pisang.png'))),
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 15,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(18),
                                            bottomRight: Radius.circular(18)),
                                        color:
                                            Colors.grey[700].withOpacity(0.5),
                                      ),
                                      child: Text('Ubah',
                                          style: TextStyle(
                                            color: Colors.white,
                                          )))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('$nama'),
                                  Text('0857 2941 8406')
                                ],
                              ),
                            ),
                            FlatButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {},
                                child: Ink(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      gradient: cGradientColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                )),
                          ],
                        ),
                        Divider(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 16),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child:
                                    Image.asset('assets/images/money_coin.png'),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Total Poin'),
                                  Text(
                                    '1.230',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 25,
                        ),
                        ListTile(
                          title: Text('Daftar Transaksi'),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('Daftar Alamat'),
                          onTap: () {
                            _alertDialogShowAddress(context);
                          },
                        ),
                        ListTile(
                          title: Text('Ubah Password'),
                          onTap: () =>
                              Navigator.pushNamed(context, '/change-password'),
                        ),
                        ListTile(
                          title: Text('Contact Us'),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('Term and Agreement'),
                          onTap: () {},
                        ),
                      ],
                    ),
              Material(
                  elevation: 10,
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: FlatButton(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        textColor: Color(0xFFFF0000),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          if (isLogin == false) {
                            Navigator.pushNamed(context, '/login');
                          } else {
                            print('LogOUt');
                          }
                        },
                        child: Text(isLogin == false ? 'Log In' : 'Log Out',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ))),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
            onTap: () => print(isLogin),
            child: Image.asset('assets/images/logo.png')),
        Container(
          margin: EdgeInsets.only(left: 15),
          width: SizeConfig.screenWidth <= 360
              ? SizeConfig.screenWidth * 0.6
              : SizeConfig.screenWidth * 0.65,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFFF6F6F4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 7.0, bottom: 7, right: 15, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Area Pengiriman',
                      style: TextStyle(fontSize: 10, color: Colors.grey[400]),
                    ),
                    Text(
                      '$namaKota, $namaProvinsi',
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/delivery-area'),
                    child: SvgPicture.asset(
                        'assets/svg_icons/pin_drop_location.svg')),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = _children();
    SizeConfig().init(context);
    print(SizeConfig.screenHeight);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          // bottom: _bottomAppBar(),
          title: _titleAppBar(),
          actions: [
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/check-out'),
                child: SvgPicture.asset('assets/svg_icons/support_agent.svg')),
            NotificationPanel()
          ],
        ),
        drawerEnableOpenDragGesture: false,
        key: _drawerKey,
        drawer: buildDrawer(context),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg_icons/home_icon.svg',
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg_icons/transaction_icon.svg',
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg_icons/favourite_icon.svg'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg_icons/account_icon.svg'),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: children[_selectedIndex]);
    // body: children[_selectedIndex]);
  }
}

// ShaderMask(
//               shaderCallback: (Rect bounds) {
//                 return LinearGradient(
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                     colors: [
//                       Color(0XFF4FE72B),
//                       Color(0XFF18AB26),
//                     ]).createShader(bounds);
//               },
//               child: Icon(Icons.dashboard),
//             ),

//
