import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class reportt extends StatefulWidget {
  DocumentSnapshot docid;
  reportt({required this.docid});
  @override
  State<reportt> createState() => _reporttState(docid: docid);
}

class _reporttState extends State<reportt> {
  DocumentSnapshot docid;
  _reporttState({required this.docid});
  final pdf = pw.Document();
  var name;
  var subject1;
  var subject2;
  var subject3;
  var subject4;
  var subject5;

  var marks;
  void initState() {
    setState(() {
      name = widget.docid.get('name');
      subject1 = widget.docid.get('descripcion');
      subject2 = widget.docid.get('edia');
      subject3 = widget.docid.get('tEntrega');
      subject4 = widget.docid.get('priceLow');
      subject5 = widget.docid.get('entrega');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      // maxPageWidth: 1000,
      // useActions: false,
      // canChangePageFormat: true,
      canChangeOrientation: false,
      // pageFormats:pageformat,
      canDebug: false,

      build: (format) => generateDocument(
        format,
      ),
    );
  }

  Future<Uint8List> generateDocument(PdfPageFormat format) async {
    final doc = pw.Document(pageMode: PdfPageMode.outlines);

    final font1 = await PdfGoogleFonts.openSansRegular();
    final font2 = await PdfGoogleFonts.openSansBold();
    // final image = await imageFromAssetBundle('assets/r2.svg');

    String? _logo = await rootBundle.loadString('assets/logo.svg');

    doc.addPage(
      pw.Page(
        pageTheme: pw.PageTheme(
          pageFormat: format.copyWith(
            marginBottom: 0,
            marginLeft: 0,
            marginRight: 0,
            marginTop: 0,
          ),
        ),
        build: (context) {
          return pw.Center(
              child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Flexible(
                child: pw.SvgImage(
                  svg: _logo,
                  height: 100,
                ),
              ),
              pw.SizedBox(
                height: 20,
              ),
              pw.Center(
                child: pw.Text(
                  'Reporte',
                  style: pw.TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              pw.SizedBox(
                height: 20,
              ),
              pw.Divider(),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Nombre producto : ',
                    style: pw.TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  pw.Text(
                    name,
                    style: pw.TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Descripcion : ',
                    style: pw.TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  pw.Text(
                    subject1,
                    style: pw.TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Día de entrega : ',
                    style: pw.TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  pw.Text(
                    subject2,
                    style: pw.TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Tipo de entrega : ',
                    style: pw.TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  pw.Text(
                    subject2,
                    style: pw.TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              pw.Divider(),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Total : ',
                    style: pw.TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  pw.Text(
                    subject4.toString(),
                    style: pw.TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              pw.Divider(),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Total : ',
                    style: pw.TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  pw.Text(
                    subject5.toString(),
                    style: pw.TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ],
          ));
        },
      ),
    );

    return doc.save();
  }
}
