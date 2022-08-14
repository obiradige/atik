import 'package:atik/constants/contants.dart';
import 'package:atik/constants/locator.dart';
import 'package:atik/constants/secure_storage.dart';
import 'package:atik/features/home/view/qr_overlay.dart';
import 'package:atik/features/recycle/view/recyler_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({Key? key}) : super(key: key);

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  final _secureStorage = getIt<SecureStorage>();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Constants.greens, size: 30),
              onPressed: () {
                Navigator.of(context).pop();
              })),
      backgroundColor: Constants.whites,
      body: Stack(
        alignment: Alignment.center,
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
          Padding(
            padding: EdgeInsets.only(top: w * 1),
            child: Container(
              width: w * 0.8,
              height: h * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: w * 0.35,
                        height: h * 0.13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.green),
                        child: Center(
                            child: Text(
                          'Qr Oku',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: w * 0.052,
                              color: Colors.white),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          //Get.to(() => PinCode(total: widget.total ,isFull: widget.isFull,isFull2:widget.isFull2));
                          
                        },
                        child: Container(
                          width: w * 0.35,
                          height: h * 0.13,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey),
                          child: Center(
                              child: Text(
                            'Kodu Gir',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: w * 0.052),
                          )),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          Positioned(
            top: w * 1.6,
            child: IconButton(
              onPressed: () async {
                await controller!.toggleFlash();
              },
              icon: Icon(
                Icons.highlight,
                size: w * 0.1,
              ),
              color: Colors.yellow,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _onQRViewCreated(QRViewController controller) async {
    this.controller = controller;

    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      HapticFeedback.vibrate();
     setState(() async {
        result = scanData;
        this.controller!.pauseCamera();
        

        String? aStr = result!.code;
        String replaceStr  = aStr!.replaceAll( RegExp(r'[^0-9]'),''); 

         await _secureStorage.storeKey(key: 'pinCode', value: replaceStr);

         // ignore: use_build_context_synchronously
         Navigator.push(context,MaterialPageRoute(builder: (context) =>  CalculationPage(), ),);
       
      });
    });
  }
}
