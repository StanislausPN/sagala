import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sagala/constant.dart';
import 'package:sagala/models/product_modal.dart';
import 'package:sagala/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardProduct extends StatefulWidget {
  final String cardId;
  final String imageAssets;
  final String title;
  final String shortDesc;
  final String priceAfterDisc;
  final String price;
  final String unit;
  final String disc;
  final String stock;
  final int qty;
  final Function onPressAdd;
  final Function onPressRemove;
  final Function onPressBuy;
  // final Function details;
  const CardProduct({
    Key key,
    @required this.imageAssets,
    @required this.title,
    this.price,
    this.unit,
    this.shortDesc,
    this.priceAfterDisc,
    this.cardId,
    this.disc,
    this.stock,
    this.qty,
    this.onPressAdd,
    this.onPressRemove,
    this.onPressBuy,
    // this.details,
  }) : super(key: key);

  @override
  _CardProductState createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  // bool addedItem = false;
  bool favouriteIcon = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        width: 180,
        margin: EdgeInsets.only(right: 13, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/detail-product',
                    arguments: ProductModal(widget.cardId));
              },
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            // image: NetworkImage(
                            //   widget.imageAssets,
                            // ),
                            image: AssetImage('assets/images/buah_alpukat.png'),
                            fit: BoxFit.cover)),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                favouriteIcon = !favouriteIcon;
                              });
                            },
                            child: Container(
                              width: 33,
                              height: 33,
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFF9FAF9),
                                child: SvgPicture.asset(
                                  favouriteIcon
                                      ? 'assets/svg_icons/icon_favourite_active.svg'
                                      : 'assets/svg_icons/outline_favorite_icon.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            backgroundColor: Color(0xFF2EB61F),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text('Tani Fresh',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget.qty == 0
                      ? Container()
                      : Container(
                          alignment: Alignment.bottomCenter,
                          height: 180,
                          padding: EdgeInsets.only(top: 60),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFF00983A).withOpacity(0.7)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('${widget.qty}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.white)),
                              Text('Added',
                                  style: TextStyle(
                                      fontSize: 18,
                                      height: 1.5,
                                      color: Colors.white))
                            ],
                          ),
                        )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    widget.shortDesc,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12, color: Colors.grey, height: 1.5),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.price,
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 13,
                            color: Colors.grey,
                            height: 1.5),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFEDF2DF),
                        ),
                        child: Text(
                          'Save ${widget.disc}%',
                          style:
                              TextStyle(fontSize: 13, color: Color(0xFF8CC24A)),
                        ),
                      )
                    ],
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: widget.priceAfterDisc,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          height: 1.5),
                    ),
                    TextSpan(
                      text: ' / ${widget.unit}',
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF999999),
                          fontWeight: FontWeight.w600,
                          height: 1.5),
                    ),
                  ])),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.stock,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF3BBB2D),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  widget.qty == 0
                      ? Container(
                          width: double.infinity,
                          child: OutlineButton(
                            onPressed: widget.onPressBuy,
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
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: widget.onPressRemove,
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 20),
                                    decoration: BoxDecoration(
                                        gradient: cGradientColor,
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    )),
                              ),
                              GestureDetector(
                                onTap: widget.onPressAdd,
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 20),
                                    decoration: BoxDecoration(
                                        gradient: cGradientColor,
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ],
        ));
  }
}
