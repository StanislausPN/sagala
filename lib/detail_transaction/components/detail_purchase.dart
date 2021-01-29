import 'package:flutter/material.dart';
import 'package:sagala/size_config.dart';

class DetailPurchase extends StatelessWidget {
  const DetailPurchase({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Belanjaan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      height: SizeConfig.screenHeight * 0.12,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[300],
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child:
                                  Image.asset('assets/images/buah_apel.png')),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Jeruk Lemon Asem'),
                                Text(
                                  'Rp. 19.000',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Text('Biaya'), Text('Rp. 2.193.950')],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Text('Biaya Antar'), Text('0')],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total Pembayaran',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Rp. 2.193.950',
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Text('Jeni Roxy', style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text('0857 2941 8406'),
            ),
            Text('Jam & Tanggal Kirim',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text('07:00 - 10:00, 29 Oktober 2019'),
            ),
            Text('Alamat Pengiriman',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                  'Kp. Kebon Randu Rt. 03 Rw. 022 Jawa Barat, Kab. Sukabumi, Cibadak 43351 Indonesia'),
            ),
          ],
        ),
      ),
    );
  }
}
