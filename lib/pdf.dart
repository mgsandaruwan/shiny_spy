import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart'; // Import open_file package

class PdfGenerater extends StatelessWidget {
  final String docId;
  final int level;
  final DateTime timestamp;

  const PdfGenerater({
    required this.docId,
    required this.level,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Generator'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await generateAndSavePdf(context); // Pass the context to the function
          },
          child: Text('Generate PDF'),
        ),
      ),
    );
  }

  Future<void> generateAndSavePdf(BuildContext context) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Center(
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text('Oil Level Report'),
                pw.Text('Document ID: $docId'),
                pw.Text('Level: $level'),
                pw.Text('Timestamp: $timestamp'),
              ],
            ),
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/oil_level_report.pdf");
    await file.writeAsBytes(await pdf.save());

    // Show a dialog with a download button
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('PDF Generated'),
        content: Text('Click below to download the PDF file.'),
        actions: [
          TextButton(
            onPressed: () {
              OpenFile.open(file.path); // Open the PDF file
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Download'),
          ),
        ],
      ),
    );
  }
}
