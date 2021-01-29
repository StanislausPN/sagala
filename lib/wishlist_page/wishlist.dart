import 'package:flutter/material.dart';
import 'package:sagala/components/card_product.dart';
import 'package:sagala/constant.dart';
import 'package:sagala/size_config.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // Widget _bottomAppBar() {
    //   return PreferredSize(
    //       child: Container(
    //         decoration: BoxDecoration(
    //           gradient: cGradientColor,
    //         ),
    //         height: 60,
    //         child: Padding(
    //             padding:
    //                 const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
    //             child: Container(
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(10),
    //                   color: Colors.white),
    //               child: TextField(
    //                 decoration: InputDecoration(
    //                     hintText: 'Cari produk disini....',
    //                     border: InputBorder.none,
    //                     contentPadding: EdgeInsets.only(top: 7.0),
    //                     prefixIcon: Icon(Icons.search)),
    //               ),
    //             )),
    //       ),
    //       preferredSize: Size.fromHeight(60.0));
    // }

    // Widget _titleAppBar() {
    //   return Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: <Widget>[
    //       Image.asset('assets/images/logo.png'),
    //       Container(
    //         width: SizeConfig.screenWidth * 0.65,
    //         height: 40,
    //         decoration: BoxDecoration(
    //           color: Color(0xFFF6F6F4),
    //           borderRadius: BorderRadius.circular(10),
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.only(
    //               top: 7.0, bottom: 7, right: 15, left: 10),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: <Widget>[
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: <Widget>[
    //                   Text(
    //                     'Area Pengiriman',
    //                     style: TextStyle(fontSize: 10, color: Colors.grey[400]),
    //                   ),
    //                   Text(
    //                     'Cibadak Sukabumi, Jawa Barat',
    //                     style: TextStyle(
    //                         fontSize: 11,
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.bold),
    //                   ),
    //                 ],
    //               ),
    //               GestureDetector(
    //                   onTap: () =>
    //                       Navigator.pushNamed(context, '/delivery-area'),
    //                   child: SvgPicture.asset(
    //                       'assets/svg_icons/pin_drop_location.svg')),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   );
    // }

    // List _actionAppBar = <Widget>[
    //   GestureDetector(
    //       onTap: () => Navigator.pushNamed(context, '/check-out'),
    //       child: SvgPicture.asset('assets/svg_icons/support_agent.svg')),
    //   Container(
    //     padding: EdgeInsets.only(right: 5.0, top: 10, bottom: 10),
    //     width: 45,
    //     child: Stack(alignment: Alignment.center, children: <Widget>[
    //       GestureDetector(
    //           onTap: () => Navigator.pushNamed(context, '/login'),
    //           child: SvgPicture.asset('assets/svg_icons/notifications.svg')),
    //       Align(
    //         alignment: Alignment.topRight,
    //         child: Container(
    //             width: 20,
    //             height: 20,
    //             decoration: BoxDecoration(
    //               color: Colors.red,
    //               borderRadius: BorderRadius.circular(7),
    //             ),
    //             child: Align(
    //               alignment: Alignment.center,
    //               child: Text('3'),
    //             )),
    //       )
    //     ]),
    //   ),
    // ];

    List<String> imageSpecialPromo = [
      'assets/images/buah_alpukat.png',
      'assets/images/buah_apel.png',
      'assets/images/buah_pisang.png',
      'assets/images/buah_alpukat.png',
      'assets/images/buah_apel.png',
      'assets/images/buah_pisang.png',
      'assets/images/buah_alpukat.png',
      'assets/images/buah_apel.png',
      'assets/images/buah_pisang.png',
      'assets/images/buah_alpukat.png',
      'assets/images/buah_apel.png',
      'assets/images/buah_pisang.png',
    ];

    List<String> titleSpecialPromo = [
      'Alpukat',
      'Apel',
      'Pisang',
      'Alpukat',
      'Apel',
      'Pisang',
      'Alpukat',
      'Apel',
      'Pisang',
      'Alpukat',
      'Apel',
      'Pisang',
    ];
    List<String> descSpecialPromo = [
      'Alpukat mantul pisanlah',
      'Apel mantul pisanlah',
      'Pisang mantul pisanlah',
      'Alpukat mantul pisanlah',
      'Apel mantul pisanlah',
      'Pisang mantul pisanlah',
      'Alpukat mantul pisanlah',
      'Apel mantul pisanlah',
      'Pisang mantul pisanlah',
      'Alpukat mantul pisanlah',
      'Apel mantul pisanlah',
      'Pisang mantul pisanlah',
    ];

    return Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.white,
        //   bottom: _bottomAppBar(),
        //   // title: _titleAppBar(),
        //   // actions: _actionAppBar,
        // ),
        body: Column(
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
                          contentPadding: EdgeInsets.only(top: 7.0),
                          prefixIcon: Icon(Icons.search)),
                    ),
                  )),
            ),
            preferredSize: Size.fromHeight(60.0)),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Wishlist',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 12,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: SizeConfig.screenWidth <= 360.0
                            ? SizeConfig.screenWidth /
                                (SizeConfig.screenHeight * 1.2)
                            : SizeConfig.screenWidth / (875),
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return CardProduct(
                          title: titleSpecialPromo[index],
                          imageAssets: imageSpecialPromo[index],
                          shortDesc: descSpecialPromo[index],
                          price: 'Rp. 13.800',
                        );
                        // return Container(
                        //   width: SizeConfig.screenWidth * 0.43,
                        //   // height: 380,
                        //   decoration: BoxDecoration(
                        //       color: Colors.blueAccent,
                        //       borderRadius: BorderRadius.circular(10)),
                        //   child: Column(
                        //     children: <Widget>[
                        //       Container(
                        //         child: Image.asset(
                        //           'assets/images/buah_apel.png',
                        //           fit: BoxFit.cover,
                        //         ),
                        //       ),
                        //       Container(
                        //         padding: EdgeInsets.only(
                        //             top: 15, left: 15, right: 15),
                        //         child: Column(
                        //           crossAxisAlignment:
                        //               CrossAxisAlignment.start,
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: <Widget>[
                        //             Text(
                        //                 'Apel manis Has Bali BY Zahra Zain Cibadak',
                        //                 style: TextStyle(
                        //                   fontSize: 13,
                        //                 )),
                        //             Text(
                        //               'Rp50.000 ',
                        //               style: TextStyle(
                        //                   fontSize: 14,
                        //                   color: Colors.black,
                        //                   fontWeight: FontWeight.bold,
                        //                   height: 1.5),
                        //             ),
                        //             RichText(
                        //                 text: TextSpan(children: [
                        //               TextSpan(
                        //                 text: 'Rp68.000',
                        //                 style: TextStyle(
                        //                     decoration:
                        //                         TextDecoration.lineThrough,
                        //                     fontSize: 12,
                        //                     color: Colors.grey,
                        //                     height: 1.5),
                        //               ),
                        //               TextSpan(
                        //                 text: '  10%',
                        //                 style: TextStyle(
                        //                     fontSize: 12,
                        //                     color: Colors.grey,
                        //                     height: 1.5),
                        //               )
                        //             ])),
                        //             SizedBox(
                        //               height: 15,
                        //             ),
                        //             Container(
                        //               width: double.infinity,
                        //               height: 30,
                        //               child: OutlineButton(
                        //                 onPressed: () {},
                        //                 child: Text(
                        //                   'Beli',
                        //                   style: TextStyle(
                        //                       color: Color(0xFF3BBB2D),
                        //                       fontWeight: FontWeight.bold),
                        //                 ),
                        //                 focusColor: Color(0xFF3BBB2D),
                        //                 splashColor: Color(0xFF3BBB2D),
                        //                 highlightedBorderColor:
                        //                     Color(0xFF3BBB2D),
                        //                 color: Color(0xFF3BBB2D),
                        //                 borderSide: BorderSide(
                        //                   color: Color(0xFF3BBB2D),
                        //                 ),
                        //                 shape: StadiumBorder(),
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               height: 15,
                        //             ),
                        //           ],
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
