import 'package:sano/data/database/database.dart' as db;
import 'package:sano/data/database/database.dart';
import 'package:sano/data/datasource/product_data_source.dart';

class ProductDataSourceImpl extends ProductDataSource {
  final db.ApplicationDatabase _database;

  ProductDataSourceImpl({
    required db.ApplicationDatabase database,
  }) : _database = database;

  @override
  Future<int> createProduct(ProductData product) {
    return _database.productDao.insertFile(product);
  }

  @override
  Future<int> deleteProduct(ProductData product) {
    return _database.productDao.deleteFile(product);
  }

  @override
  Future<List<ProductData>> getProducts() {
    return _database.productDao.getFiles();
  }
}