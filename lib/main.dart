import 'package:flutter/material.dart';
import 'package:sagala/change_password/change_password.dart';
import 'package:sagala/check_out/check_out.dart';
import 'package:sagala/delivery_area/delivery_area.dart';
import 'package:sagala/detail_product/detail_product.dart';
import 'package:sagala/detail_transaction/detail_transaction.dart';
import 'package:sagala/forgot_password/forgot_password.dart';
import 'package:sagala/home/home.dart';
import 'package:sagala/login/login.dart';
import 'package:sagala/new_address/new_address.dart';
import 'package:sagala/register/register.dart';
import 'package:sagala/shopping_cart/shopping_cart.dart';
import 'package:sagala/home_navigation/home_navigation.dart';
import 'package:sagala/transaction/waiting_for_payment/payment_detail_transaction/payment_detail_transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

final keyHomePage = new GlobalKey<HomePageState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAGALA Mobile Apps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: Color(0xFFF4FCF8),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
              headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      // home: ShowSideBar(),
      // home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeNavigation(),
        '/delivery-area': (context) => DeliveryArea(),
        '/detail-product': (context) => DetailProduct(),
        '/shopping-cart': (context) => ShoppingCart(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/forgot-password': (context) => ForgotPassword(),
        '/check-out': (context) => CheckOut(),
        '/detail-transaction': (context) => DetailTransaction(),
        '/waiting-for-payment-detail-transaction': (context) =>
            WaitingForPaymentDetailTransaction(),
        '/new-address': (context) => NewAddress(),
        '/change-password': (context) => ChangePassword(),
      },
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Saving data'),
//       ),
//       body: Row(
//         //mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: RaisedButton(
//               child: Text('Read'),
//               onPressed: () {
//                 _read();
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: RaisedButton(
//               child: Text('Save'),
//               onPressed: () {
//                 _save();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Replace these two methods in the examples that follow

//   _read() async {
//     final prefs = await SharedPreferences.getInstance();
//     final key = 'my_int_key';
//     final value = prefs.getInt(key) ?? 0;
//     print('read: $value');
//   }

//   _save() async {
//     final prefs = await SharedPreferences.getInstance();
//     final key = 'my_int_key';
//     final value = 42;
//     prefs.setInt(key, value);
//     print('saved $value');
//   }
// }
