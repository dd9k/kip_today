/*
 * QR.Flutter
 * Copyright (c) 2019 the QR.Flutter authors.
 * See LICENSE for distribution and usage details.
 */

import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:checkinpromobile/src/constants/AppColors.dart';

/// This is the screen that you'll see when the app starts
// ignore: must_be_immutable
class QRCode extends StatefulWidget {
  final data;
  final String notes;
  final double sizeQRCode;
  VoidCallback funcDownload;
  QRCode(
      {Key key,
      @required this.data,
      this.notes = '',
      this.sizeQRCode = 150,
      this.funcDownload})
      : super(key: key);
  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  final sizeImageLogo = 1.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final message = widget.data;

    final qrFutureBuilder = FutureBuilder(
      future: _loadOverlayImage(),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return Container(width: widget.sizeQRCode, height: widget.sizeQRCode);
        }
        return Container(
          color: this.context.bgQR,
          padding: EdgeInsets.all(10),
          width: widget.sizeQRCode,
          height: widget.sizeQRCode,
          child: CustomPaint(
            size: Size.square(widget.sizeQRCode),
            painter: QrPainter(
              data: message,
              version: QrVersions.auto,
              eyeStyle: QrEyeStyle(eyeShape: QrEyeShape.square, color: Colors.black),
              dataModuleStyle:
                   QrDataModuleStyle(dataModuleShape: QrDataModuleShape.square, color: Colors.black),
              embeddedImage: snapshot.data,
              embeddedImageStyle: QrEmbeddedImageStyle(
                size: Size.square(sizeImageLogo),
              ),
            ),
          ),
        );
      },
    );

    return Material(
      color: Colors.transparent,
      child: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                width: widget.sizeQRCode,
                child: InkWell(
                    onTap: () {
                      widget.funcDownload();
                    },
                    child: qrFutureBuilder),
              ),
            ),
            Visibility(
              visible: widget.notes.isNotEmpty,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40)
                      .copyWith(bottom: 40),
                  child: Wrap(
                    spacing: 5,
                    children: [
                      Icon(Icons.download_sharp),
                      Text(
                        widget.notes,
                        style: TextStyle(
                            fontFamily: AppTextStyles.tahomaFont,
                            fontSize: AdaptiveTextSize().getadaptiveTextSize(
                                context,
                                multiplier: 1.85)),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future<ui.Image> _loadOverlayImage() async {
    final completer = Completer<ui.Image>();
    final byteData = await rootBundle.load('assets/images/logo_unitcorp.png');
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }
}
