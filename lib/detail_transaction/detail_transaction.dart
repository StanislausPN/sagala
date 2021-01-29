import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sagala/detail_transaction/components/detail_payment.dart';
import 'package:sagala/detail_transaction/components/detail_purchase.dart';
import 'package:sagala/size_config.dart';

class DetailTransaction extends StatelessWidget {
  const DetailTransaction({Key key}) : super(key: key);

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
            'Detail Transaksi',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Image.asset('assets/images/bukti_transfer.png'),
                    ),
                    DetailPayment(),
                    DetailPurchase()
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'UPLOAD BUKTI TRANSFER',
                      style: TextStyle(
                          height: 1.5, fontSize: 16, color: Color(0xFF2EB61F)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
