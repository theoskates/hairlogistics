import 'package:flutter/material.dart';
import 'package:hairlogistics/models/Product.dart';

import '../../../constants.dart';

class ColorAndSize extends StatefulWidget {
  ColorAndSize({
    Key key,
    @required this.products,
  }) : super(key: key);

  final Product products;

  @override
  _ColorAndSizeState createState() => _ColorAndSizeState();
}

class _ColorAndSizeState extends State<ColorAndSize> {
  final colors = <Map<String, dynamic>>[
    {'color': Colors.red, 'isSelected': true},
    {'color': Colors.yellow, 'isSelected': false},
    {'color': Colors.green, 'isSelected': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Color"),
              Row(
                  children: colors
                      .asMap()
                      .entries
                      .map((e) => ColorDot(
                            color: e.value['color'],
                            isSelected: e.value['isSelected'],
                            index: e.key,
                            onTap: (index) {
                              for (int i = 0; i < colors.length; i++) {
                                if (index == i) {
                                  colors[i]['isSelected'] = true;
                                  continue;
                                }
                                colors[i]['isSelected'] = false;
                              }
                              setState(() {});
                            },
                          ))
                      .toList())
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(style: TextStyle(color: kTextColor), children: [
              TextSpan(
                text: "Size\n",
              ),
              TextSpan(
                text: "${widget.products.size}mm",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
              )
            ]),
          ),
        )
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final int index;
  final Function(int type) onTap;
  const ColorDot({
    Key key,
    this.color,
    this.index,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(this.index);
        this.onTap(this.index);
      },
      child: Container(
        margin: EdgeInsets.only(
            top: kDefaultPadding / 4, right: kDefaultPadding / 2),
        padding: EdgeInsets.all(2.5),
        height: 24,
        width: 24,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? color : Colors.transparent,
            )),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
