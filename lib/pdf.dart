import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class PdfGenerater extends StatelessWidget {
  final String docId;
  final int level;
  final DateTime timestamp;

  const PdfGenerater({
    Key? key,
    required this.docId,
    required this.level,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Skin Report',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/skint.jpg',
                      height: 300, // Adjust the height as needed
                      width: 300, // Adjust the width as needed
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        'Oily Skin:\n'
                            'Oily skin produces excess sebum, leading to a shiny appearance, enlarged pores, '
                            'and susceptibility to acne. Skincare for oily skin includes gentle cleansers and oil-free products '
                            'to control oil production.\n\n'
                            'Dry Skin:\n'
                            'Dry skin lacks moisture and natural oils, resulting in flakiness, tightness, and dullness. '
                            'It can be worsened by factors like cold weather and harsh skincare products. Skincare for dry skin '
                            'involves hydrating cleansers, rich moisturizers, and ingredients like hyaluronic acid to restore moisture.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        await generateAndSavePdf(context);
                      },
                      child: SizedBox(
                        width: 160, // Set the width
                        height: 50, // Set the height
                        child: Center(
                          child: Text(
                            'Generate Your Report',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFEFE8A2), // Set button background color
                      ),
                    ),
                    SizedBox(height: 20), // Add SizedBox below the button
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> generateAndSavePdf(BuildContext context) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(32),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'Oil Level Report',
                  style: pw.TextStyle(fontSize: 35, color: PdfColors.blue,),
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  'Document ID: $docId',
                  style: pw.TextStyle(fontSize: 18),
                ),
                pw.SizedBox(height: 10),
                pw.Text(
                  'Level: $level',
                  style: pw.TextStyle(fontSize: 18),
                ),
                pw.SizedBox(height: 10),
                pw.Text(
                  'Timestamp: ${timestamp.toString()}',
                  style: pw.TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/oil_level_report.pdf");
    await file.writeAsBytes(await pdf.save());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('PDF Generated'),
        content: const Text('Click below to download the PDF file.'),
        actions: [
          TextButton(
            onPressed: () {
              OpenFile.open(file.path);
              Navigator.of(context).pop();
            },
            child: const Text('Download'),
          ),
        ],
      ),
    );
  }
}
