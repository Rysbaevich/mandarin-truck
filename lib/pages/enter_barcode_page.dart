import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandarin_client/service/scan_service.dart';

class EnterBarCodePage extends StatefulWidget {
  const EnterBarCodePage({super.key});

  @override
  State<EnterBarCodePage> createState() => _EnterBarCodePageState();
}

class _EnterBarCodePageState extends State<EnterBarCodePage> {
  final _barCodeController = TextEditingController();
  final scan = ScanSerivce();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _barCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Регистрация товара"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  textAlignVertical: TextAlignVertical.center,
                  controller: _barCodeController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Введите текст",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.orange.withOpacity(.5),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.orange.withOpacity(.5),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.orange.withOpacity(.5),
                      ),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Icon(
                        CupertinoIcons.barcode_viewfinder,
                        color: Colors.orange,
                      ),
                    ),
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value == '') {
                      return "Это обязательное поле";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    scan.sendQrCodeToServer(_barCodeController.text);
                    _formKey.currentState?.reset();
                    _barCodeController.clear();
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Отправить"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
