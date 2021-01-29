import 'package:flutter/material.dart';
import 'package:sagala/constant.dart';
import 'package:sagala/size_config.dart';

class DetailProductCard extends StatelessWidget {
  const DetailProductCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
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
          Container(
            padding: EdgeInsets.only(left: 20),
            height: SizeConfig.screenHeight * 0.08,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/buah_pisang.png',
                          fit: BoxFit.cover,
                        )),
                  );
                }),
          ),
          Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Pisang Sunpride PREMIUM PACK Lembut dan Manis',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Rp 94.500   ',
                        style: TextStyle(color: Colors.red, fontSize: 23)),
                    TextSpan(
                        text: 'Rp 189.000',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            decoration: TextDecoration.lineThrough)),
                    TextSpan(
                        text: '   -50%',
                        style: TextStyle(color: Colors.grey, fontSize: 15)),
                  ])),
                  Wrap(
                    children: <Widget>[
                      Text(
                        'Deskripsi Pisang Sunpride PREMIUM PACK - isi 10pcs Selamat Datang di Bakoel Sayur Online! Penuhi kebutuhan dapur Anda dengan berbelanja di sini. Belanja praktis, pesan hari ini besok langsung diantar! Harga murah kualitas Premium! DESKRIPSI PRODUK Pisang Sunpride Premium Pack - HARGA PER Pack isi @10 Pcs.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.05,
                  ),
                  Center(
                    child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {},
                        child: Ink(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 126),
                          decoration: BoxDecoration(
                              gradient: cGradientColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Beli',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.03,
                  ),

                  //<======= tombol tambah kurang dan counter (Box shadow pada text counter belum sempurna)=====>
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     FlatButton(
                  //         padding: EdgeInsets.all(0),
                  //         onPressed: () {},
                  //         child: Ink(
                  //           padding: EdgeInsets.symmetric(
                  //               vertical: 10, horizontal: 40),
                  //           decoration: BoxDecoration(
                  //               gradient: cGradientColor,
                  //               borderRadius: BorderRadius.circular(20)),
                  //           child: Text(
                  //             '-',
                  //             style: TextStyle(
                  //                 color: Colors.white, fontSize: 16),
                  //           ),
                  //         )),
                  //     FlatButton(
                  //         padding: EdgeInsets.all(0),
                  //         onPressed: () {},
                  //         child: Ink(
                  //           padding: EdgeInsets.symmetric(
                  //               vertical: 10, horizontal: 40),
                  //           decoration: BoxDecoration(
                  //               color: Colors.white,
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   color: Colors.grey,
                  //                   spreadRadius: 10,
                  //                   blurRadius: 2,
                  //                   offset: Offset(0, 5),
                  //                 ),
                  //               ],
                  //               borderRadius: BorderRadius.circular(20)),
                  //           child: Text(
                  //             '1',
                  //             style:
                  //                 TextStyle(color: Colors.grey, fontSize: 16),
                  //           ),
                  //         )),
                  //     FlatButton(
                  //         padding: EdgeInsets.all(0),
                  //         onPressed: () {},
                  //         child: Ink(
                  //           padding: EdgeInsets.symmetric(
                  //               vertical: 10, horizontal: 40),
                  //           decoration: BoxDecoration(
                  //               gradient: cGradientColor,
                  //               borderRadius: BorderRadius.circular(20)),
                  //           child: Text(
                  //             '+',
                  //             style: TextStyle(
                  //                 color: Colors.white, fontSize: 16),
                  //           ),
                  //         )),
                  //   ],
                  // )
                ],
              )),
        ],
      ),
    );
  }
}
