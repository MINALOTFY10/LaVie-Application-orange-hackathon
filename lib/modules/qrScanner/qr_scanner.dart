
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planetapp/modules/blog/blog_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';



class QrScanner extends StatefulWidget {

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  QRViewController? controller;

  final qrKey =GlobalKey(debugLabel: 'QR');
  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  @override
  void reassemble() async {
    if(Platform.isAndroid){
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
              buildQrView(context),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: Text("go to Blogs",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                  ),onPressed: (){
                  Navigator.push (
                    context,
                    MaterialPageRoute (
                      builder: (context) => BlogScreen(),
                    ),
                  );
                },),
              ),
            ),
            Positioned(bottom:20, child:  buildResult())
          ],
        ),
      ),
    );
  }

  Widget buildQrView(context){
    return QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
overlay: QrScannerOverlayShape(
  borderWidth: 10,
  borderLength: 90,
  borderColor:Colors.white,
  cutOutSize: MediaQuery.of(context).size.width * 0.8,
),
    );
  }

  void onQRViewCreated(QRViewController controller){
        setState(() {
          this.controller=controller;
        });
        controller.scannedDataStream.listen((barcode) => this.barcode = barcode);
  }

  Widget buildResult() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          barcode != null ? 'Result : ${barcode!.code}' :
          'Scan a Code!',
          maxLines: 3,),
      ),
    );
  }
}
