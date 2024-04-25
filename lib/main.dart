import 'package:app_mania/pages/cart_page.dart';
import 'package:app_mania/pages/detail_page.dart';
import 'package:app_mania/pages/invoice.dart';
import 'package:app_mania/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        "detailPage":(context) => SaladDetail(),
        "cartPage":(context) => SaladCart(),
        "mainapp":(context) => MyApp(),
        "invoice":(context) => Invoice(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map filtermap = catList[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: -10,
        leading: Icon(Icons.location_on_rounded, color: Colors.black),
        title: Text(
          "Habiganj City",
          style: TextStyle(fontSize: 17, color: Colors.black),
        ),
        actions: [
          Container(
              margin: EdgeInsets.all(8),
              height: 35,
              width: 35,
              decoration:
                  BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
              child: Icon(
                Icons.sort,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: "Find The ",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2),
                  children: [
                    TextSpan(
                        text: "Best\nFood",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: " Around You")
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.black54),
                    Text("  Search your favourite food",
                        style: TextStyle(color: Colors.black54)),
                    Spacer(),
                    Icon(Icons.manage_search, color: Colors.black, size: 26),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Find  ",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: "5km",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.deepOrange,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: catList.map((catagory) {
                  String cat_name = catagory["cat_name"];
                  String cat_name2 = filtermap["cat_name"];
                  bool selected = cat_name==cat_name2;
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        filtermap = catagory;
                        setState(() {});
                      },
                      child: CatBox(cat_name: cat_name,selected: selected),
                    ),
                  );
                }).toList(),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      (filtermap["product_list"] as List<Map>).map((element) {
                    return ProBox(map: element);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CatBox extends StatefulWidget {
  String? cat_name;
  bool? selected;
  CatBox({super.key, this.cat_name,this.selected});

  @override
  State<CatBox> createState() => _CatBoxState();
}

class _CatBoxState extends State<CatBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      height: 45,
      decoration: BoxDecoration(
          color: (widget.selected??false)?Colors.green:Colors.black12, borderRadius: BorderRadius.circular(20)),
      child: Text(
        widget.cat_name ?? "",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color:(widget.selected??false)?Colors.white70:Colors.black),
      ),
    );
  }
}

class ProBox extends StatelessWidget {

  Map? map;

  ProBox({super.key, this.map});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context,"detailPage",arguments: map);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        clipBehavior: Clip.antiAlias,
        height: 400,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black12,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  CircleAvatar(
                    maxRadius: 100,
                    foregroundImage: AssetImage(map?["image"]),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      map?["name"] ?? "",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          "20 min",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                        Spacer(),
                        Icon(Icons.star_outline, color: Colors.deepOrange),
                        Text(
                          "${map?["rating"]??0}",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "\$ ${map?["price"] ?? 0}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(20))),
                child: Icon(Icons.add,color: Colors.white,),
              ),
            ),
            Positioned(
              top: 15,
              right: 15,
              child: Icon(CupertinoIcons.heart,color: Colors.black54,),
            ),
          ],
        ),
      ),
    );
  }
}
