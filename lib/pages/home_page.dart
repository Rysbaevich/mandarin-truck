import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mandarin_client/pages/enter_barcode_page.dart';
import 'package:mandarin_client/service/scan_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

const String scanCancelColor = '#ff6666';
const String cameraPermissionDeniedMessage = "Нет разрешения камеры";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scanner = ScanSerivce();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/logo.jpg",
                  height: 150,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () => scanQR(),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Регистрация товара"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EnterBarCodePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Ввести вручную"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> scanQR() async {
    var permissionStatus = await Permission.camera.request();
    if (permissionStatus.isGranted) {
      try {
        String barcodeResult = await FlutterBarcodeScanner.scanBarcode(
            scanCancelColor, 'Cancel', false, ScanMode.QR);
        if (barcodeResult != '-1' && mounted) {
          scanner.sendQrCodeToServer(barcodeResult);
        }
      } on PlatformException {
        log('Failed to get platform version.');
      }
    } else {
      EasyLoading.showToast(cameraPermissionDeniedMessage);
    }
  }
}
