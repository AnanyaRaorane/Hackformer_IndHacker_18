import 'package:flutter/material.dart';

class NFTs extends StatefulWidget {
  const NFTs({Key? key}) : super(key: key);

  @override
  State<NFTs> createState() => _NFTsState();
}

class _NFTsState extends State<NFTs> {
  @override
  Widget nftcard() {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xff424242), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
            child: ClipRRect(
              child: Image.asset(
                "asset/images/nft.png",
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 15,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Lazy Ape",style: TextStyle(fontSize: 15),),
                    SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Color(0xffFF2281)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.monetization_on,size: 20,), Text("3.5 ETH",style: TextStyle(fontSize: 10),)],
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text("Buy Now"),
                    style: ElevatedButton.styleFrom(
                        //fixedSize: Size(120, 25),
                        backgroundColor: Color(0xffFF2281),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)))),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return nftcard();
      },
    );
  }
}
