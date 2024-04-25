import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_mania/util.dart';

class SaladDetail extends StatefulWidget {
  String? name;
  String? image;
  num? price;
  num? rating;
  num? calories;
  int? quantity;
  Map? data;

  SaladDetail({super.key});

  @override
  State<SaladDetail> createState() => _SaladDetailState();
}

class _SaladDetailState extends State<SaladDetail> {
  @override
  void didChangeDependencies() {
    widget.data = ModalRoute.of(context)?.settings.arguments as Map?;
    widget.name = widget.data?["name"];
    widget.image = widget.data?["image"];
    widget.price = widget.data?["price"];
    widget.rating = widget.data?["rating"];
    widget.calories = widget.data?["calories"];
    widget.quantity = widget.data?["quantity"];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Salad Details"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(CupertinoIcons.heart),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white54,
                              blurRadius: 100,
                              spreadRadius: 50,
                              offset: Offset(0, -1))
                        ],
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(50))),
                  ),
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.transparent, shape: BoxShape.circle),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(widget.image ?? ""),
                  ),
                ),
              ],
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 30, left: 25, right: 25, bottom: 20),
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  widget.data?["quantity"] =
                                      (widget.data?["quantity"]) - 1;
                                  setState(() {});
                                },
                                child: Icon(Icons.remove,
                                    color: Colors.white, size: 25)),
                            Spacer(),
                            Text("${widget.data?["quantity"]}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  widget.data?["quantity"] =
                                      (widget.data?["quantity"]) + 1;
                                  setState(() {});
                                },
                                child: Icon(Icons.add,
                                    color: Colors.white, size: 25))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(widget.name ?? "",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w700)),
                    Text(
                      "Fresh Avocado, shrimps salad with lettus green mix,cherry tomatoes,herbs and olive oil,lemon dressing.",
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orangeAccent),
                        Text(" ${widget.rating ?? 0}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                        Spacer(),
                        Text("\u{1F525} ${widget.calories ?? 0} Kcal",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                        Spacer(),
                        Text("\u{23F0} 5-10 Min",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text("Ingradients",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 10),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text("\u{1F990}",
                                style: TextStyle(fontSize: 25)),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text("\u{1F345}",
                                style: TextStyle(fontSize: 25)),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text("\u{1FAD2}",
                                style: TextStyle(fontSize: 25)),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text("\u{1F951}",
                                style: TextStyle(fontSize: 25)),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 10),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text("\u{1F96C}",
                                style: TextStyle(fontSize: 25)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        if (widget.data != null) {
                          if (cartList.contains(widget.data)) {
                            cartList.forEach((element)  {
                              if(element==widget.data) {
                                element["name"] = widget.data!["name"];
                                element["price"] = widget.data!["price"];
                                element["rating"] = widget.data!["rating"];
                                element["image"] = widget.data!["image"];
                                element["calories"] = widget.data!["calories"];
                                element["quantity"] = widget.data!["quantity"];
                              }
                            } );
                          } else {
                            cartList.add(widget.data!);
                          }
                        }
                        Navigator.pushNamed(context, "cartPage");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("Add To Cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
