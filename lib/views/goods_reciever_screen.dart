import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:vanapp/widgets/custom_textfield.dart';
import 'package:vanapp/widgets/my_barcode_scanner.dart';
import 'package:vanapp/widgets/my_data_table.dart';

class GoodsRecieverScreen extends StatefulWidget {
  const GoodsRecieverScreen({super.key});

  @override
  State<GoodsRecieverScreen> createState() => _GoodsRecieverScreenState();
}

class _GoodsRecieverScreenState extends State<GoodsRecieverScreen> {
    final TextEditingController barcodeController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController retailPriceController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
    bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyBarcodeScanner(),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: CustomTextField(
                  hintText: "Product name",
                  enabled: false,
                )),
            Expanded(
                child: CustomTextField(
              hintText: "Price",
              enabled: false,
            )),
          ],
        ),
        Row(
          children: [
            Expanded(child: CustomTextField(hintText: "Qty")),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 60,
                  child: GFButton(
                    onPressed: () {},
                    text: "Add",
                    type: GFButtonType.solid,
                    fullWidthButton: true,
                    blockButton: true,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(child: SingleChildScrollView(child: ProductDataTable())),
          ],
        ),
      ],
    );
  }
}
