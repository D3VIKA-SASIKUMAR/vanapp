import 'package:flutter/material.dart';
import 'package:vanapp/models/product_model.dart';

class ProductDataTable extends StatefulWidget {
  const ProductDataTable({super.key});

  @override
  State<ProductDataTable> createState() => _ProductDataTableState();
}

class _ProductDataTableState extends State<ProductDataTable> {
  final List<Map<String, dynamic>> listOfColumns = [
    {
      'product': ProductModel(
        productName: "apple",
        cost: "20.0",
      ),
      'qty': 1
    }
  ];

//  DataTableWidget(this.listOfColumns);     // Getting the data from outside, on initialization
  @override
  Widget build(BuildContext context) {
    return DataTable(
      
      columns: const [
        DataColumn(label: Expanded(flex: 2, child: Text('Product'))),
        DataColumn(label: Expanded(child: Text('Qty'))),
        DataColumn(label: Expanded(child: Text('Cost'))),
      ],
      rows:
          listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
              .map(
                ((map) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(map['product']
                            .productName!)), //Extracting from Map element the value
                        DataCell(Text(map['qty'].toString())),
                        DataCell(Text(map['product'].cost!)),
                      ],
                    )),
              )
              .toList(),
    );
  }
}
