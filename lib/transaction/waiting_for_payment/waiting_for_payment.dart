import 'package:flutter/material.dart';
import 'package:sagala/size_config.dart';

class WaitingForPayment extends StatelessWidget {
  const WaitingForPayment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                padding: const EdgeInsets.all(15),
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('938340433437282',
                            style: TextStyle(color: Color(0xFF2EB61F))),
                        Text(
                          '19 Oktober 2020',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth <= 360.0
                          ? SizeConfig.screenWidth * 0.1
                          : SizeConfig.screenWidth * 0.2,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Total Transaksi',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey[350])),
                        Text(
                          'Rp 2.193.950',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, '/waiting-for-payment-detail-transaction'),
                        child: Icon(Icons.chevron_right))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
