import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  var JsonData = [

    {"image": "https://static-01.daraz.com.bd/p/8818635ab27745624ca094b18f2a60de.jpg", "name": "POSHI 916", "prize": "৳ 412", "details": "100% Authentic POSHI 916 new collection Mid-Size Chronograph Black Leather Luminous Hand Analog Watch for men waterproof (Japan Movement 7T35)with box"},
    {"image": "https://static-01.daraz.com.bd/p/53a6a084d1f64e9b56d5691866784bb0.jpg", "name": "WRM 10", "prize": "৳ 160", "details": "100% Authentic POSHI 916 new collection Mid-Size Chronograph Black Leather Luminous Hand Analog Watch for men waterproof (Japan Movement 7T35)with box"},
    {"image": "https://static-01.daraz.com.bd/p/d239476b0e182ad64f6c0ed36b4459c9.jpg", "name": "Black Analog Watch", "prize": "৳ 116", "details": "100% Authentic POSHI 916 new collection Mid-Size Chronograph Black Leather Luminous Hand Analog Watch for men waterproof (Japan Movement 7T35)with box"},
    {"image": "https://static-01.daraz.com.bd/p/b8fbc07b14edb1ba7c1d40325e7065d0.jpg", "name": "Fashionable Watch", "prize": "৳ 530", "details": "100% Authentic POSHI 916 new collection Mid-Size Chronograph Black Leather Luminous Hand Analog Watch for men waterproof (Japan Movement 7T35)with box"},
    {"image": "https://static-01.daraz.com.bd/p/cd8c6b9315e2acfd2f3adb398f34e471.jpg", "name": "Leather Analog Watch", "prize": "৳ 129", "details": "100% Authentic POSHI 916 new collection Mid-Size Chronograph Black Leather Luminous Hand Analog Watch for men waterproof (Japan Movement 7T35)with box"},
    {"image": "https://static-01.daraz.com.bd/p/0d6a204588761885b703b5340794cd6d.jpg", "name": "Luxary men Watch", "prize": "৳ 242", "details": "100% Authentic POSHI 916 new collection Mid-Size Chronograph Black Leather Luminous Hand Analog Watch for men waterproof (Japan Movement 7T35)with box"},
    {"image": "https://static-01.daraz.com.bd/p/8818635ab27745624ca094b18f2a60de.jpg", "name": "POSHI 916", "prize": "৳ 412", "details": "100% Authentic POSHI 916 new collection Mid-Size Chronograph Black Leather Luminous Hand Analog Watch for men waterproof (Japan Movement 7T35)with box"},
    {"image": "https://static-01.daraz.com.bd/p/53a6a084d1f64e9b56d5691866784bb0.jpg", "name": "WRM 10", "prize": "৳ 160", "details": "100% Authentic POSHI 916 new collection Mid-Size Chronograph Black Leather Luminous Hand Analog Watch for men waterproof (Japan Movement 7T35)with box"},
    {"image": "https://static-01.daraz.com.bd/p/d239476b0e182ad64f6c0ed36b4459c9.jpg", "name": "Black Analog Watch", "prize": "৳ 116", "details": "100% Authentic POSHI 916 new collection Mid-Size Chronograph Black Leather Luminous Hand Analog Watch for men waterproof (Japan Movement 7T35)with box"},
    {"image": "https://static-01.daraz.com.bd/p/b8fbc07b14edb1ba7c1d40325e7065d0.jpg", "name": "Fashionable Watch", "prize": "৳ 530", "details": "100% Authentic POSHI 916 new collection Mid-Size Chronograph Black Leather Luminous Hand Analog Watch for men waterproof (Japan Movement 7T35)with box"},
    {"image": "https://static-01.daraz.com.bd/p/cd8c6b9315e2acfd2f3adb398f34e471.jpg", "name": "Leather Analog Watch", "prize": "৳ 129", "details": "100% Authentic POSHI 916 new collection Mid-Size Chronograph Black Leather Luminous Hand Analog Watch for men waterproof (Japan Movement 7T35)with box"},
    {"image": "https://static-01.daraz.com.bd/p/0d6a204588761885b703b5340794cd6d.jpg", "name": "Luxary men Watch", "prize": "৳ 242", "details": "100% Authentic POSHI 916 new collection Mid-Size Chronograph Black Leather Luminous Hand Analog Watch for men waterproof (Japan Movement 7T35)with box"},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Assignment 03"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: JsonData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductViewPage(
                          JsonData[index]['image']!,
                          JsonData[index]['name']!,
                          JsonData[index]['prize']!,
                          JsonData[index]['details']!)));
            },
            child: Container(
              margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
              padding: EdgeInsets.all(5.0),
              width: double.infinity,
              height: 220,
              child: Card(
                child: Image.network(JsonData[index]['image']!),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductViewPage extends StatelessWidget {
  String image;
  String name;
  String prize;
  String details;

  ProductViewPage(this.image, this.name, this.prize, this.details, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          title: Text("Products view"),
        ),

        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Image.network(image),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                          title: Text(prize,style: TextStyle(color: Colors.deepOrange),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      child: ListTile(
                          title: Text(name,style: TextStyle(color: Colors.deepOrange),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      child: ListTile(
                          title: Text(details,style: TextStyle(color: Colors.deepOrange),),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
