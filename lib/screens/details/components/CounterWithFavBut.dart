import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// import 'CartCounter.dart';

class CounterWithFavBut extends StatelessWidget {
  const CounterWithFavBut({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // CartCounter(),
        Container(
          padding: EdgeInsets.all(8),
          height: 32,
          width: 32,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.redAccent),
              color: Colors.white,
              shape: BoxShape.circle),
          child: SvgPicture.asset("assets/icons/heart.svg"),
        )
      ],
    );
  }
}
