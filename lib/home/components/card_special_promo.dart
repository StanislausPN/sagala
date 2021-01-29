// import 'package:flutter/material.dart';
// import 'package:sagala/size_config.dart';
// import 'package:sagala/components/card_product.dart';

// class CardSpecialPromo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<String> imageSpecialPromo = [
//       'assets/images/buah_alpukat.png',
//       'assets/images/buah_apel.png',
//       'assets/images/buah_pisang.png',
//       'assets/images/buah_alpukat.png',
//       'assets/images/buah_apel.png',
//       'assets/images/buah_pisang.png',
//       'assets/images/buah_alpukat.png',
//       'assets/images/buah_apel.png',
//       'assets/images/buah_pisang.png',
//       'assets/images/buah_alpukat.png',
//       'assets/images/buah_apel.png',
//       'assets/images/buah_pisang.png',
//     ];

//     List<String> titleSpecialPromo = [
//       'Alpukat',
//       'Apel',
//       'Pisang',
//       'Alpukat',
//       'Apel',
//       'Pisang',
//       'Alpukat',
//       'Apel',
//       'Pisang',
//       'Alpukat',
//       'Apel',
//       'Pisang',
//     ];
//     List<String> descSpecialPromo = [
//       'Alpukat mantul pisanlah',
//       'Apel mantul pisanlah',
//       'Pisang mantul pisanlah',
//       'Alpukat mantul pisanlah',
//       'Apel mantul pisanlah',
//       'Pisang mantul pisanlah',
//       'Alpukat mantul pisanlah',
//       'Apel mantul pisanlah',
//       'Pisang mantul pisanlah',
//       'Alpukat mantul pisanlah',
//       'Apel mantul pisanlah',
//       'Pisang mantul pisanlah',
//     ];
//     SizeConfig().init(context);
//     return Container(
//       height: 380,
//       width: double.infinity,
//       child: ListView.builder(
//           itemCount: imageSpecialPromo.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             return CardProduct(
//               title: titleSpecialPromo[index],
//               imageAssets: imageSpecialPromo[index],
//               desc: descSpecialPromo[index],
//               price: 'Rp. 13.800',
//             );
//           }),
//     );
//   }
// }
