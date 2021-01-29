import 'package:flutter/material.dart';

class CardLocation extends StatelessWidget {
  const CardLocation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Color(0xFFEAF8E9),
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Lokasi saat ini',
                              style: TextStyle(height: 1.5, fontSize: 13),
                            ),
                            Text(
                              'Jl. Perintis Kemerdekaan No. 72',
                              style: TextStyle(
                                  height: 1.5, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Kec. Cibadak, Kab. Sukabumi, Jawa Barat.',
                              style: TextStyle(
                                  height: 1.5, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Usulkan Sagala Ditempat Mu',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2EB61F)))
                            // Text('Gunakan Alamat ini',
                            //     style: TextStyle(
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.bold,
                            //         color: Color(0xFF2EB61F)))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                // Align(
                //   alignment: Alignment.topRight,
                //   child: Container(
                //     width: 120,
                //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(20)),
                //     child: Center(
                //       child: Text('Tidak Tersedia',
                //           style: TextStyle(
                //               fontSize: 14,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.grey)),
                //     ),
                //   ),
                // ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 80,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text('Tersedia',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2EB61F))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
