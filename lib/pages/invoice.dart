import 'package:app_mania/util.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';




class Invoice extends StatefulWidget {
  const Invoice({super.key});

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  final pdf = pw.Document();
  Uint8List? image;
  void images1() async {
    image =
      (await rootBundle.load('images/salad.png')).buffer.asUint8List();
  }
  @override
  void initState() {
    super.initState();
    images1();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Padding(
            padding: pw.EdgeInsets.all(20),
            child: pw.Column(
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Image(
                      pw.MemoryImage(image!),
                      width: 100,
                      height: 100,
                    ),
                    pw.Text(
                      "Invoice",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 30),
                    )
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "Billed to:",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 20),
                        ),
                        pw.Text(
                          "Vignesh Ramani",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 18),
                        ),
                        pw.Text(
                          "Jasdan",
                          style: pw.TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text(
                          "Invoice No:90677",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 20),
                        ),
                        pw.Text(
                          "25/04/2024",
                          style: pw.TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Container(
                  height: 2,
                  width: double.infinity,
                  color: PdfColors.black,
                ),
                pw.SizedBox(height: 20),
                pw.Row(
                  children: [
                    pw.Text(
                      "Item",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 15),
                    ),
                    pw.Spacer(),
                    pw.Text(
                      "Quantity",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 15),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Text(
                      "Unit Price",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 15),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Text(
                      "Total",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 15),
                    )
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Container(
                  height: 2,
                  width: double.infinity,
                  color: PdfColors.black,
                ),
                ...cartList.map((e) {
                  return pw.Column(
                    children: [
                      pw.SizedBox(height: 15),
                      pw.Row(
                        children: [
                          pw.Text(
                            "${e["name"]}",
                            style: pw.TextStyle(fontSize: 15),
                          ),
                          pw.Spacer(),
                          pw.Text(
                            "${e["quantity"]}",
                            style: pw.TextStyle(fontSize: 15),
                          ),
                          pw.SizedBox(width: 50),
                          pw.Text(
                            "${e["price"]}",
                            style: pw.TextStyle(fontSize: 15),
                          ),
                          pw.SizedBox(width: 30),
                          pw.Text(
                            "${e["quantity"] * e["price"]}",
                            style: pw.TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      pw.SizedBox(height: 15),
                      pw.Container(
                        height: 2,
                        width: double.infinity,
                        color: PdfColors.black,
                      ),
                    ],
                  );
                }),
                pw.SizedBox(height: 20),
                pw.Row(
                  children: [
                    pw.Container(),
                    pw.Spacer(),
                    pw.Container(),
                    pw.SizedBox(width: 10),
                    pw.Text(
                      "SubTotal",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 15),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Text(
                      "${Global.subsum}",
                      style: pw.TextStyle(fontSize: 15),
                    )
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  children: [
                    pw.Container(),
                    pw.Spacer(),
                    pw.Container(),
                    pw.SizedBox(width: 10),
                    pw.Text(
                      "Discount(5%)",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 15),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Text(
                      "-${Global.discount}",
                      style: pw.TextStyle(fontSize: 15),
                    )
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  children: [
                    pw.Container(),
                    pw.Spacer(),
                    pw.Container(),
                    pw.SizedBox(width: 10),
                    pw.Text(
                      "Delivery",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 15),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Text(
                      "+${Global.delivery}",
                      style: pw.TextStyle(fontSize: 15),
                    )
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  children: [
                    pw.Container(),
                    pw.Spacer(),
                    pw.Container(),
                    pw.SizedBox(width: 10),
                    pw.Text(
                      "Total",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 25),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Text(
                      "${Global.finalsum}",
                      style: pw.TextStyle(fontSize: 25),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() async {
                Directory? res = await getExternalStorageDirectory();
                String? path = res!.path;
                File? file = File("$path/resume.pdf");
                await file.writeAsBytes(await pdf.save()).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      content: Text("Saved successfully"),
                    ),
                  );
                });
              });
            },
            child: Icon(Icons.download),
          ),
          FloatingActionButton(
            onPressed: () async {
              Printing.layoutPdf(
                onLayout: (format) {
                  return pdf.save();
                },
              );
            },
            child: Icon(Icons.print),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "images/salad.png",
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    "Invoice",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Billed to:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "Vignesh Ramani",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        "Jasdan",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Invoice No:90677",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "25/04/2024",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 2,
                width: double.infinity,
                color: Colors.black,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Item",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Spacer(),
                  Text(
                    "Quantity",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Unit Price",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 2,
                width: double.infinity,
                color: Colors.black,
              ),
              ...cartList.map((e) {
                return Column(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          "${e["name"]}",
                          style: TextStyle(fontSize: 15),
                        ),
                        Spacer(),
                        Text(
                          "${e["quantity"]}",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(width: 50),
                        Text(
                          "${e["price"]}",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(width: 30),
                        Text(
                          "${e["quantity"] * e["price"]}",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 2,
                      width: double.infinity,
                      color: Colors.black,
                    ),
                  ],
                );
              }),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(),
                  Spacer(),
                  Container(),
                  SizedBox(width: 10),
                  Text(
                    "SubTotal",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "${Global.subsum}",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(),
                  Spacer(),
                  Container(),
                  SizedBox(width: 10),
                  Text(
                    "Discount(5%)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "-${Global.discount}",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(),
                  Spacer(),
                  Container(),
                  SizedBox(width: 10),
                  Text(
                    "Delivery",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "+${Global.delivery}",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(),
                  Spacer(),
                  Container(),
                  SizedBox(width: 10),
                  Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "${Global.finalsum}",
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
