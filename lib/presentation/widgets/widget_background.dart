import 'package:flutter/material.dart';
import 'package:omni_app_flutter/core/constants/color_constants.dart';

/// Class that create a background widget customizable
class WidgetBackground extends StatelessWidget {
  final Color? colorBackground;

  const WidgetBackground({
    required Key key,
    this.colorBackground
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            key: key,
            decoration: BoxDecoration(
                color: colorBackground ?? kWhite
            ),
            height: double.infinity,
            width: double.infinity
        )
      ],
    );
  }
}