import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../../style/colors.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double width;
  final Widget? widget;
  final Color color;
  final double boarderRadius;
  final double? borderwidth;
  final Color? borderColor;
  CustomContainer({
    this.width = 20.0,
    this.height = 20.0,
    this.boarderRadius = 0,
    this.color = colorBlackGrey,
    this.widget,
    this.borderwidth,
    this.borderColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(
            width: borderwidth ?? 0,
            color: borderColor ?? whiteColor,
          ),
          color: color,
          borderRadius: BorderRadius.circular(boarderRadius)),
      child: widget,
    );
  }
}
