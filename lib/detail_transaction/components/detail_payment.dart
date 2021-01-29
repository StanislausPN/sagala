import 'package:flutter/material.dart';

class DetailPayment extends StatelessWidget {
  const DetailPayment({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              'Segera selesaikan pembayaran Anda sebelum stok habis.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text('Sisa waktu pembayaran Anda'),
          ),
          Row(
            children: <Widget>[
              Text('24', style: TextStyle(fontSize: 40)),
              Text(': ', style: TextStyle(fontSize: 40)),
              Text('05', style: TextStyle(fontSize: 40)),
              Text(': ', style: TextStyle(fontSize: 40)),
              Text('52', style: TextStyle(fontSize: 40)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 22),
                  child: Text('Jam', style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 22),
                  child: Text('Menit', style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 22),
                  child: Text('Detik', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text('Sebelum Senin 4 November 2019 pukul 04:34 WIB',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    color: Colors.grey[350])),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text('Transfer pembayaran ke nomor rekening :'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Image.asset('assets/images/mandiri.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '1650030073333',
                      style: TextStyle(
                          fontSize: 20,
                          height: 1.5,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'a/n Bagja Indonesia Sejahtera',
                      style: TextStyle(
                        height: 1.5,
                      ),
                    ),
                    Text(
                      'Salin no. Rek',
                      style: TextStyle(color: Color(0xFF2EB61F)),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text('Jumlah yang harus dibayar :'),
          ),
          Text(
            'Rp 2.193.950',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, height: 1.5),
          ),
          Text('Transfer tepat sampai 3 digit terakhir',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                  color: Colors.grey[350])),
          Text('Perbedaan nominal menghambat proses verifikasi',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                  color: Colors.grey[350])),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              'Salin Jumlah',
              style: TextStyle(height: 1.5, color: Color(0xFF2EB61F)),
            ),
          ),
          Text(
            'Pastikan pembayaran Anda sudah BERHASIL dan unggah bukti untuk mempercepat proses verifikasi.',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
