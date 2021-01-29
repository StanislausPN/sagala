import 'package:flutter/material.dart';
import 'package:sagala/size_config.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CardDonation extends StatefulWidget {
  const CardDonation({
    Key key,
  }) : super(key: key);

  @override
  _CardDonationState createState() => _CardDonationState();
}

class _CardDonationState extends State<CardDonation> {
  PageController swipeController = PageController(
    initialPage: 0,
  );
  double currentPage = 0;

  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      swipeController.addListener(() {
        setState(() {
          currentPage = swipeController.page;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        PageView(
          controller: swipeController,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/swipe_image.png'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/swipe_image.png'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/swipe_image.png'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/swipe_image.png'),
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10),
          alignment: Alignment.bottomCenter,
          child: SmoothPageIndicator(
            controller: swipeController,
            count: 4,
            effect: ScrollingDotsEffect(
                spacing: 6.0,
                radius: 100.0,
                dotWidth: 7.0,
                dotHeight: 7.0,
                paintStyle: PaintingStyle.fill,
                dotColor: Color(0xFFE5E5E5),
                activeDotColor: Color(0xFF2EB61F)),
          ),
        ),
      ],
    );
    // return ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: 5,
    //     itemBuilder: (context, index) {
    //       return Container(
    //           width: SizeConfig.screenWidth - 25,
    //           padding: EdgeInsets.only(top: 20, bottom: 20, left: 5),
    //           child: Card(
    //             shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(20)),
    //             color: Color(0xFFFFC300),
    //             child: Row(
    //               children: <Widget>[
    //                 Align(
    //                   heightFactor: 4,
    //                   alignment: Alignment.bottomLeft,
    //                   child: Container(
    //                       height: 40,
    //                       width: 30,
    //                       child: Image.asset('assets/images/logo_card.png')),
    //                 ),
    //                 Container(
    //                   width: SizeConfig.screenWidth * 0.52,
    //                   padding: const EdgeInsets.only(top: 20.0, bottom: 30),
    //                   child: RichText(
    //                     text: TextSpan(children: [
    //                       TextSpan(
    //                           text: 'Semua keuntungan penjualan',
    //                           style: TextStyle(
    //                               height: 1.5,
    //                               fontWeight: FontWeight.bold,
    //                               fontSize: 14)),
    //                       TextSpan(
    //                         text:
    //                             ' digunakan untuk membantu pencari nafkah driver dan pedagang',
    //                         style: TextStyle(
    //                           fontSize: 14,
    //                           height: 1.2,
    //                         ),
    //                       ),
    //                     ]),
    //                   ),
    //                 ),
    //                 Container(
    //                   width: 100,
    //                   child: Image.asset('assets/images/gift_card.png'),
    //                 ),
    //               ],
    //             ),
    //           ));
    //     });
  }
}
