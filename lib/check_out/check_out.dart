import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sagala/check_out/components/check_out_item_card.dart';
import 'package:sagala/components/select_address_dialog.dart';
import 'package:sagala/constant.dart';
import 'package:sagala/size_config.dart';

class CheckOut extends StatelessWidget {
  final List<String> dateText = [
    'Kamis 28 Okt 2020',
    'Kamis 29 Okt 2020',
    'Kamis 30 Okt 2020',
    'Kamis 31 Okt 2020',
  ];

  final List<String> hourText = [
    '07.00 - 10.00',
    '11.00 - 13.00',
    '15.00 - 18.00',
    '19.00 - 20.00',
  ];
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
            'Check Out',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: SizeConfig.screenWidth <= 360.0 ? 10 : 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(
                          SizeConfig.screenWidth <= 360.0 ? 10 : 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text('Belanjaan'),
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.only(bottom: 20),
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return CheckOutItemCard();
                              }),
                          Text('Voucher'),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      border: InputBorder.none,
                                      hintText:
                                          'Masukkan kode voucher disini...',
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: FlatButton(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 20),
                                          color: Colors.green,
                                          onPressed: () {},
                                          child: Text(
                                            'GUNAKAN',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Biaya'),
                                Text('Rp. 2.193.950')
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Biaya Antar'),
                                Text('Rp. 0')
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Total Pembayaran'),
                                Text('Rp. 2.193.950')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        padding: EdgeInsets.all(
                            SizeConfig.screenWidth <= 360.0 ? 10 : 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Text('Pengiriman'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text('Tanggal kirim'),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 20),
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: dateText.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      SizeConfig.screenWidth / (140),
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: index % 2 == 0
                                          ? Color(0xFF2EB61F)
                                          : Color(0xFFF5FBFD),
                                      child: Container(
                                        // SizeConfig.screenWidth <= 360.0 ?
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 15),
                                        // padding: EdgeInsets.all(15),
                                        child: Text(
                                          dateText[index],
                                          style: TextStyle(
                                              color: index % 2 == 0
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text('Pilih Jam Antar'),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 20),
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: hourText.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio:
                                      SizeConfig.screenWidth / (200),
                                  // (SizeConfig.screenHeight * 0.3),
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: index % 2 == 0
                                          ? Color(0xFF2EB61F)
                                          : Color(0xFFF5FBFD),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 8),
                                        // vertical: 15, horizontal: 10),
                                        child: Text(
                                          hourText[index],
                                          style: TextStyle(
                                              color: index % 2 == 0
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text('Area Pengiriman'),
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Cibadak Sukabumi, Jawa Barat',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                      onTap: () => Navigator.pushNamed(
                                          context, '/delivery-area'),
                                      child: SvgPicture.asset(
                                          'assets/svg_icons/pin_drop_location.svg')),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                  'Sudah 2 user sudah yang order ke daerah ini, potensi cashback Rp. 10.000,- '),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Alamat'),
                                  GestureDetector(
                                      onTap: () {
                                        _alertDialogShowAddress(context);
                                      },
                                      child: Text(
                                        'Pilih Alamat',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF2EB61F),
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey[300]),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    border: InputBorder.none,
                                    hintText: 'Pilih alamat anda',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Text('Metode Pembayaran'),
                              ),
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Pilih Metode Transfer',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.pushNamed(
                                          context, '/delivery-area'),
                                      child: Icon(Icons.keyboard_arrow_down),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Image.asset(
                                          'assets/images/mandiri_image.png'),
                                      Text(
                                        'Mandiri',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                          width: SizeConfig.screenWidth * 0.4),
                                      GestureDetector(
                                          onTap: () => Navigator.pushNamed(
                                              context, '/delivery-area'),
                                          child: Icon(Icons.check)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Total Pembayaran'),
                          Text('Rp. 2.193.000')
                        ],
                      ),
                    ),
                    Center(
                      child: FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.pushNamed(context, '/detail-transaction');
                          },
                          child: Ink(
                            padding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal:
                                    SizeConfig.screenWidth <= 360.0 ? 90 : 100),
                            decoration: BoxDecoration(
                                gradient: cGradientColor,
                                borderRadius: BorderRadius.circular(40)),
                            child: Text(
                              'PESAN SEKARANG',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Future _alertDialogShowAddress(BuildContext context) {
    return showDialog(context: context, builder: (_) => SelectAddress());
  }
}
