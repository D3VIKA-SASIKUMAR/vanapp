import 'package:vanapp/models/product_model.dart';
import 'package:vanapp/utils/network_service.dart';

class ProductController {
  Future<ProductModel> getProductByBarcode(String barcode) async {
    final List result =
        await getData("Product/GetProductDetailsByBarcode?barcode=$barcode");
    return ProductModel.fromJson(result.first);
  }
}
