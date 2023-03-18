import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/button.dart';
class HOME extends StatefulWidget {
  const HOME({Key? key}) : super(key: key);

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child:Column(
          children: [
            Container(
              height:MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.height/2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:AssetImage('asset/animations/transformer2.gif'),
                    fit: BoxFit.fill,
                ),
                //border: BorderSide(width: 2.9),
                //borderRadius: BorderRadius.circular(210),

              ),
              //child: Image.asset('asset/animations/transformer2.gif'),
            ),
            FancyButton(
              child: Text(
                "Play",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'PressStart2P',
                ),
              ),
              size: 35,
              color: Color(0xFFCA3034),
              onPressed: () {},
            ),
            // FancyButton(
            //   child: Text(
            //     "Your Amazing Text",
            //   ),
            //   size: 18,
            //   color: Color(0xFFCA3034),
            // ),
            //
            // Text("Play",style: TextStyle(fontFamily: 'PressStart2P')),

          ],
        )

        
      ),
    );
  }
}
