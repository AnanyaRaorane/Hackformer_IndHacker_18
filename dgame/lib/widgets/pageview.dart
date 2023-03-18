import 'package:flutter/material.dart';
import 'package:hack_former/pages/marketplace.dart';

import '../pages/homepage.dart';

class Customslider extends StatefulWidget {
  const Customslider({Key? key}) : super(key: key);

  @override
  State<Customslider> createState() => _CustomsliderState();
}

class _CustomsliderState extends State<Customslider> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: controller,
      children: const <Widget>[
        HOME(),
        Marketplace(),

      ],
    );
  }
}
