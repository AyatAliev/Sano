import 'package:sano/data/database/database.dart' as db;
import 'package:sano/data/datasource/product_data_source.dart';
import 'package:sano/data/repository/mapper.dart';
import 'package:sano/domain/entity/product.dart';
import 'package:sano/domain/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository with Mapper {
  final ProductDataSource _dataSource;

  ProductRepositoryImpl({
    required ProductDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<int> createProduct(Product product) {
    db.ProductData productDataDb = db.ProductData(
      name: product.name,
      price: product.price,
      date: DateTime.now(),
    );

    return _dataSource.createProduct(productDataDb);
  }

  @override
  Future<int> deleteProduct(Product product) async {
    return _dataSource.deleteProduct(mapEntityToDbFile(product));
  }

  @override
  Future<List<Product>> getProducts() async {
    final List<Product> products = (await _dataSource.getProducts())
        .map((file) => mapDbToEntityFile(file))
        .toList();

    return products;
  }
}
