import 'package:sano/data/database/database.dart' as db;
import 'package:sano/domain/entity/product.dart';

mixin Mapper {
  db.ProductData mapEntityToDbFile(Product product) {
    return db.ProductData(
      id: product.id ?? 0,
      name: product.name,
      date: product.date,
      price: product.price,
    );
  }

  Product mapDbToEntityFile(db.ProductData productData) {
    return Product(
      id: productData.id,
      name: productData.name,
      date: productData.date,
      price: productData.price ?? 0,
    );
  }
}
