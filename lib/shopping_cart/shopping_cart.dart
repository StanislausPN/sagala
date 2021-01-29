import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sagala/constant.dart';
import 'package:sagala/shopping_cart/components/item_shopping_card.dart';
import 'package:sagala/size_config.dart';

class ShoppingCart extends StatelessWidget {
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
            'Keranjang Belanja',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        // persistentFooterButtons: _persistentFooterButton(),
        body: Column(
          children: [
            Expanded(
              flex: SizeConfig.screenHeight <= 685 ? 8 : 11,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ItemShoppingCard();
                    }),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xFFFCFCFC),
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 5,
                              ),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFEDF2DF),
                                      borderRadius: BorderRadius.circular(10)),
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
                                    '1',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
                          ],
                        ),
                        Text(
                          'Rp. 2.193.950',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: cGradientColor),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Check Out',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chevron_left,
                    color: Color(0xFF2EB61F),
                  ),
                  Text(
                    'Lanjutkan Belanja',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xFF2EB61F),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
