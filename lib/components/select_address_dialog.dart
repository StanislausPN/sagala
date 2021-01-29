import 'package:flutter/material.dart';
import 'package:sagala/size_config.dart';

class SelectAddress extends StatelessWidget {
  const SelectAddress({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: EdgeInsets.all(20),
      backgroundColor: Color(0xFFF4FCF8),
      content: Container(
        height: SizeConfig.screenHeight * 0.55,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: Icon(Icons.close),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                  'Silahkan pilih alamat pengiriman yang sudah kamu gunakan sebelumnya'),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              width: SizeConfig.screenWidth * 0.9,
              height: SizeConfig.screenHeight * 0.4,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        height: 90,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          child: Text(
                                            'Kp. Kebon Randu Rt. 03 Rw. 022 Jawa Barat, Kab. Sukabumi,  Cibadak 43351 Indonesia',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.edit,
                                          color: Colors.grey,
                                        ),
                                        Icon(Icons.delete, color: Colors.grey),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '+ Tambahkan Alamat Baru',
                style: TextStyle(
                  color: Color(0xFF2EB61F),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
