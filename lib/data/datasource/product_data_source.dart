import 'package:sano/data/database/database.dart' as db;

abstract class ProductDataSource {

  Future<List<db.ProductData>> getProducts();

  Future<int> createProduct(db.ProductData product);

  Future<int> deleteProduct(db.ProductData product);
}