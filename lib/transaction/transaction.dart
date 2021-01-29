import 'package:flutter/material.dart';
import 'package:sagala/size_config.dart';
import 'package:sagala/transaction/done/done.dart';
import 'package:sagala/transaction/on_process/on_process.dart';
import 'package:sagala/transaction/waiting_for_payment/waiting_for_payment.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  void initState() {
    tabController = new TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // Widget _titleAppBar() {
    //   return Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: <Widget>[
    //       Container(
    //         width: SizeConfig.screenWidth * 0.65,
    //         height: 40,
    //         decoration: BoxDecoration(
    //           color: Color(0xFFF6F6F4),
    //           borderRadius: BorderRadius.circular(10),
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.only(
    //               top: 7.0, bottom: 7, right: 15, left: 10),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: <Widget>[
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: <Widget>[
    //                   Text(
    //                     'Area Pengiriman',
    //                     style: TextStyle(fontSize: 10, color: Colors.grey[400]),
    //                   ),
    //                   Text(
    //                     'Cibadak Sukabumi, Jawa Barat',
    //                     style: TextStyle(
    //                         fontSize: 11,
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.bold),
    //                   ),
    //                 ],
    //               ),
    //               GestureDetector(
    //                   onTap: () {},
    //                   child: SvgPicture.asset(
    //                       'assets/svg_icons/pin_drop_location.svg')),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   );
    // }

    // List _actionAppBar = <Widget>[
    //   GestureDetector(
    //       onTap: () {},
    //       child: SvgPicture.asset('assets/svg_icons/support_agent.svg')),
    //   Container(
    //     padding: EdgeInsets.only(right: 5.0, top: 10, bottom: 10),
    //     width: 45,
    //     child: Stack(alignment: Alignment.center, children: <Widget>[
    //       GestureDetector(
    //           onTap: () {},
    //           child: SvgPicture.asset('assets/svg_icons/notifications.svg')),
    //       Align(
    //         alignment: Alignment.topRight,
    //         child: Container(
    //             width: 20,
    //             height: 20,
    //             decoration: BoxDecoration(
    //               color: Colors.red,
    //               borderRadius: BorderRadius.circular(7),
    //             ),
    //             child: Align(
    //               alignment: Alignment.center,
    //               child: Text('3'),
    //             )),
    //       )
    //     ]),
    //   ),
    // ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        // title: _titleAppBar(),
        // actions: _actionAppBar,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TabBar(
              controller: tabController,
              indicatorColor: Color(0xFF2EB61F),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Color(0xFF2EB61F),
              unselectedLabelColor: Colors.black,
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'Menunggu Pembayaran',
                ),
                Tab(
                  text: 'Dalam Proses',
                ),
                Tab(
                  text: 'Selesai',
                ),
              ],
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[WaitingForPayment(), OnProcess(), Done()],
      ),
    );
  }
}
