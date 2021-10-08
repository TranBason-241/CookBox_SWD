import 'package:flutter/material.dart';

class dahoantat extends StatelessWidget {
  const dahoantat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(),
    );
  }

  initScreen() {
    return Container(
        child: Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            dummyDataOfListView(
                "https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp",
                "Women T-Shirt",
                "Cloths",
                "500Rs",
                4),
            dummyDataOfListView(
                "https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp",
                "Women T-Shirt",
                "Cloths",
                "600Rs",
                1),
            dummyDataOfListView(
                "https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp",
                "Women T-Shirt",
                "Cloths",
                "800Rs",
                3),
            dummyDataOfListView(
                "https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp",
                "Women T-Shirt",
                "Cloths",
                "800Rs",
                3),
            dummyDataOfListView(
                "https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp",
                "Women T-Shirt",
                "Cloths",
                "800Rs",
                3),
          ],
        ),
      ],
    ));
  }

  dummyDataOfListView(String imgSrc, String itemName, String itemCategory,
      String itemPrice, int itemCount) {
    return Container(
        child: Card(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      color: Color(0xffEEEEEE),
      child: ListTile(
        // on ListItem clicked
        onTap: () {},

        // Image of ListItem
        leading: Container(
          child: Image(
            fit: BoxFit.fitHeight,
            // image: AssetImage(imgSrc),
            image: NetworkImage(imgSrc),
          ),
        ),

        // Lists of titles
        title: Container(
          margin: EdgeInsets.only(top: 10.0),
          height: 80.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 2.0),
                child: Text(
                  "Item Name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 3.0),
                child: Text(
                  "Item Cetegory",
                  style: TextStyle(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 3.0),
                child: Text(
                  "500 RS",
                  style: TextStyle(color: Color(0xff374ABE)),
                ),
              ),
            ],
          ),
        ),

        // trailing: Container(
        //   child: Icon(
        //     Icons.refresh,
        //     size: 30,
        //     color: Color(0xff374ABE),
        //   ),
        // ),
      ),
    ));
  }
}
