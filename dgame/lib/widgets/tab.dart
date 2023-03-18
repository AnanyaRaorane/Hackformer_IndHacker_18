// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:hack_former/widgets/upcoming.dart';

import 'history.dart';

class TAB extends StatefulWidget {
  const TAB({Key? key}) : super(key: key);

  @override
  State<TAB> createState() => _TABState();
}

class _TABState extends State<TAB> with SingleTickerProviderStateMixin {
  TabController? _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Expanded(
      child: Container(
        // height: h,
        // width: w,
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBar(
                controller: _tabcontroller,
                //isScrollable: true,
                tabs: [Tab(child: Text('Collections'),
                ),
                  Tab(child: Text('NFTs'),)]
            ),
          ),
            Expanded(
              child: TabBarView(controller: _tabcontroller, children: [
                NFTs(),
                Resources(),
              ]),
            )
          ],
        ),
      ),
    );

  }

}
