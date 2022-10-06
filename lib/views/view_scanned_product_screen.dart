// import 'package:barcode_validator/barcode_validator.dart';
import 'package:flutter/material.dart';
import 'package:vanapp/controllers/product_controller.dart';
import 'package:vanapp/widgets/custom_textfield.dart';
import 'package:vanapp/widgets/my_barcode_scanner.dart';

class ViewScannedProductScreen extends StatefulWidget {
  const ViewScannedProductScreen({super.key});

  @override
  State<ViewScannedProductScreen> createState() =>
      _ViewScannedProductScreenState();
}

class _ViewScannedProductScreenState extends State<ViewScannedProductScreen> {
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController retailPriceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController uomController = TextEditingController();
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Visibility(visible: isSearching, child: const LinearProgressIndicator()),
      Row(
        children: [
          Expanded(
            flex: 2,
            child: MyBarcodeScanner(
              controller: barcodeController,
              onBarcode: (barcode) {
                // if (isValidBarcode(barcode)) {
                setState(() {
                  isSearching = true;
                });
                ProductController().getProductByBarcode(barcode).then((value) {
                  setState(() {
                    productNameController.text = value.productName ?? "";
                    uomController.text = value.uom ?? "";
                    retailPriceController.text = value.retailPrice ?? "";
                    stockController.text = value.stock ?? "";
                    descriptionController.text = value.prodCode ?? "";
                    isSearching = false;
                  });
                });
                // }
              },
            ),
          ),
          Expanded(
              child: CustomTextField(
            enabled: false,
            hintText: "UOM",
            controller: productNameController,
          )),
        ],
      ),
      CustomTextField(
        hintText: "Product",
        enabled: false,
        controller: productNameController,
      ),
      CustomTextField(
        hintText: "Description",
        enabled: false,
        controller: productNameController,
      ),
      CustomTextField(
        hintText: "Retail Price",
        enabled: false,
        controller: productNameController,
      ),
      CustomTextField(
        hintText: "Stock",
        enabled: false,
        controller: productNameController,
      ),
    ]);
  }
}
