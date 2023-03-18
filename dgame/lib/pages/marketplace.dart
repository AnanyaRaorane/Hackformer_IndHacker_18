import 'package:flutter/material.dart';

import '../widgets/tab.dart';
import '../widgets/upcoming.dart';
class Marketplace extends StatefulWidget {
  const Marketplace({Key? key}) : super(key: key);

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F0F0F),
      body: SafeArea(
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Marketplace",style: TextStyle(fontSize: 25),),
                  Icon(Icons.account_balance_wallet_rounded,),
                ],
              ),
            ),
            Expanded(child: NFTs()),
          ],
        )
      ),
    );
  }
}
