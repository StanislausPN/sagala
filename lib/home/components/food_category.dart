import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerFoodCategory extends StatelessWidget {
  ShimmerFoodCategory();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(milliseconds: 800),
      baseColor: Color(0XFFD6D6D6),
      highlightColor: Colors.white,
      child: Card(
          child: Container(
        width: 180,
        // height: 150,
      )),
    );
  }
}

class FoodCategory extends StatelessWidget {
  final Function onPress;
  final String imageAsset;
  final String name;
  const FoodCategory({Key key, this.onPress, this.imageAsset, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Color(0xFFF4FCF8),
        child: Container(
            padding: EdgeInsets.only(top: 5, left: 5, bottom: 5),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Image.asset(imageAsset),
                ),
                Flexible(
                    child: Text(
                  name,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ))
              ],
            )),
      ),
    );
  }
}
