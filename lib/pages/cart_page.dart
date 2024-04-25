import 'package:app_mania/main.dart';
import 'package:app_mania/util.dart';
import 'package:flutter/material.dart';

class SaladCart extends StatefulWidget {
  const SaladCart({super.key});

  @override
  State<SaladCart> createState() => _SaladCartState();
}

class _SaladCartState extends State<SaladCart> {

@override
  void initState() {
    super.initState();
    subtotal();
    finaltotal();
}
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "mainapp");
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.close, size: 28),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(35),
                ),
                color: Color(0XFFFAF9FE)),
            child: SingleChildScrollView(
              child: Column(
                children: cartList.map((element) {
                  return SaladBox(map: element);
                }).toList(),
              ),
            ),
          ),
          Container(
            height: 400,
            decoration: BoxDecoration(color: Color(0XFFFAF9FE)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.discount,
                        color: Colors.black54,
                      ),
                      Text("  Promo Code",
                          style:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      Spacer(),
                      Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Colors.green,
                        ),
                        child: Text(
                          "Apply",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  height: 270,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text("Subtotal", style: TextStyle(fontSize: 20)),
                            Spacer(),
                            Text("\$ ${Global.subsum}", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                      Container(
                        height: 2,
                        color: Colors.black12,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text("Discount(-5% on subtotal)", style: TextStyle(fontSize: 20)),
                            Spacer(),
                            Text("-\$ ${Global.discount}", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                      Container(
                        height: 2,
                        color: Colors.black12,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text("Delivery", style: TextStyle(fontSize: 20)),
                            Spacer(),
                            Text("+\$ ${Global.delivery}", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                      Container(
                        height: 2,
                        color: Colors.black12,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text("Total",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Spacer(),
                            Text("\$ ${Global.finalsum}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "invoice");
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "CHECKOUT/INVOICE",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void finaltotal() {
  Global.finalsum=0;
    cartList.forEach((element) {
        var p=element["price"];
        var q=element["quantity"];
        var price= num.parse("$p");
        var quantity= num.parse("$q");
        Global.finalsum= Global.finalsum+(price*quantity);
    });
  Global.finalsum=Global.finalsum+Global.delivery-Global.discount;
  }
  void subtotal() {
  Global.subsum=0;
    cartList.forEach((element) {
      var p=element["price"];
      var q=element["quantity"];
      var price= num.parse("$p");
      var quantity= num.parse("$q");
      Global.subsum=Global.subsum+(price*quantity);
    });
    Global.discount=(5*Global.subsum)/100;
  }
}

class SaladBox extends StatefulWidget {
  Map? map;

  SaladBox({super.key, this.map});

  @override
  State<SaladBox> createState() => _SaladBoxState();
}

class _SaladBoxState extends State<SaladBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            foregroundImage: AssetImage(widget.map?["image"]),
            backgroundColor: Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.map?["name"],
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text("\$ ${widget.map?["price"]}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 10.0,left: 10,bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${widget.map?["quantity"]}",
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("\$ ${(widget.map?["price"]) * (widget.map?["quantity"])}",
                    style: TextStyle(fontSize: 15, color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
