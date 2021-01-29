import 'package:flutter/material.dart';
import 'package:sagala/constant.dart';
import 'package:sagala/size_config.dart';

class ItemShoppingCard extends StatefulWidget {
  @override
  _ItemShoppingCardState createState() => _ItemShoppingCardState();
}

class _ItemShoppingCardState extends State<ItemShoppingCard> {
  int _countItem = 1;
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(15),
      height: 140,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 80,
                padding: EdgeInsets.only(right: 10, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/buah_alpukat.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Alpukat Mentega Super PREMIUM Jumbo dari Solo Jawa'),
                    Text('Rp. 1.099.450'),
                  ],
                ),
              ),
              Icon(
                Icons.delete,
                color: Color(0xFFCCCCCC),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      itemCounterRemove();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: Container(
                        width: 55,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          gradient: cGradientColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.remove,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: Container(
                        width: 65,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Color(0xFFF4FCF8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            '$_countItem',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      itemCounterAdd();
                    },
                    child: Container(
                        width: 55,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          gradient: cGradientColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              Text('Rp 1.099.450')
            ],
          )
        ],
      ),
    );
  }
}
