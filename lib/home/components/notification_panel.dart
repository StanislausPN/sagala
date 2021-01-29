import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sagala/size_config.dart';

class NotificationPanel extends StatefulWidget {
  NotificationPanel({Key key}) : super(key: key);

  @override
  _NotificationPanelState createState() => _NotificationPanelState();
}

class _NotificationPanelState extends State<NotificationPanel> {
  GlobalKey _key;
  bool isMenuOpen = false;
  Offset buttonPosition;
  Size buttonSize;
  OverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _key = LabeledGlobalKey("button_icon");
  }

  @override
  void dispose() {
    super.dispose();
  }

  findButton() {
    RenderBox renderBox = _key.currentContext.findRenderObject();
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  void closeMenu() {
    _overlayEntry.remove();
    isMenuOpen = !isMenuOpen;
  }

  void openMenu() {
    findButton();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context).insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: 60,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  if (isMenuOpen) {
                    closeMenu();
                  } else {
                    openMenu();
                  }
                },
                child: Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight,
                  color: Colors.transparent,
                ),
              ),
              Positioned(
                left: SizeConfig.screenWidth * 0.25,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Notifications (3)',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: SizeConfig.screenWidth * 0.6,
                            height: 230,
                            child: ListView.builder(
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(top: 10),
                                    width: 230,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFE5E5E5)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                        'Pesanan dengan No. Order #884948 telah di verifikasi.'),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: _key,
      padding: EdgeInsets.only(right: 5.0, top: 10, bottom: 10),
      width: 45,
      child: Stack(alignment: Alignment.center, children: <Widget>[
        GestureDetector(
            onTap: () {
              if (isMenuOpen) {
                closeMenu();
              } else {
                openMenu();
              }
            },
            child: SvgPicture.asset('assets/svg_icons/notifications.svg')),
        Align(
          alignment: Alignment.topRight,
          child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text('3'),
              )),
        )
      ]),
    );
  }
}
