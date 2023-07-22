import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:open_file/open_file.dart';

import '../model/epenses_model.dart';
import '../model/income_model.dart';

import 'dart:io';

class ExportController {
  Future<void> exportToPDF() async {
    // Create a new PDF document
    PdfDocument document = PdfDocument();

    // Add a new page
    PdfPage page = document.pages.add();

    // Get the page size
    Size pageSize = page.getClientSize();

    // Design the header with red color
    PdfGraphics graphics = page.graphics;
    graphics.drawRectangle(
      bounds: Rect.fromLTWH(0, 0, pageSize.width, 50), // Update height to 50
      pen: PdfPen(PdfColor(255, 0, 0), width: 0),
      brush: PdfBrushes.red,
    );

    // Create the title
    PdfFont font = PdfStandardFont(PdfFontFamily.helvetica, 18);
    String title = "Patofy Expenses and Income Summary";
    PdfStringFormat format = PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    );

    Size titleSize = font.measureString(title, format: format);
    double titleX = (pageSize.width - titleSize.width) / 2;
    double titleY = 25 - titleSize.height / 2; // 25 is half the height of the rectangle (50/2)

    graphics.drawString(
      title,
      font,
      brush: PdfBrushes.white,
      bounds: Rect.fromLTWH(titleX, titleY, titleSize.width, titleSize.height),
      format: format,
    );

    // Draw the created date below the rectangle
    String createdDate = getCurrentFormattedDate();
    PdfFont dateFont = PdfStandardFont(PdfFontFamily.helvetica, 12);
    PdfStringFormat dateFormat = PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    );

    Size dateSize = dateFont.measureString(createdDate, format: dateFormat);
    double dateX = (pageSize.width - dateSize.width) / 2;
    double dateY = 55; // Adjust the Y position as needed to place it below the rectangle

    graphics.drawString(
      createdDate,
      dateFont,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(dateX, dateY, dateSize.width, dateSize.height),
      format: dateFormat,
    );

    // Save the PDF document and get the bytes
    List<int> bytes = await document.save();
    document.dispose();

    await saveAndLaunchFile(bytes, 'Patofy.pdf');
  }

  String getCurrentFormattedDate() {
    DateTime now = DateTime.now();
    String formattedDate = "${now.day}-${now.month}-${now.year}";
    return formattedDate;
  }

  Future<void> saveAndLaunchFile(List<int> bytes, String filename) async {
    final path = (await getExternalStorageDirectory())!.path;
    final file = File('$path/$filename');
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open('$path/$filename');
  }
}
