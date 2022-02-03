import 'dart:io' as dartIo;
import 'package:flutter/foundation.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sano/data/database/table/table.dart';

part 'database.g.dart';

@UseMoor(
  tables: [Product],
  daos: [Product],
)
class ApplicationDatabase extends _$ApplicationDatabase {
  ApplicationDatabase({QueryExecutor? executor}) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (kDebugMode) {
          print("migration from $from");
          print("migration to $from");
        }

        if (from == 1) {
          await m.createTable(product);
        }
      },
    );
  }

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = dartIo.File(path.join(dbFolder.path, 'db.sqlite'));
      return VmDatabase(file);
    });
  }
}

/// Product DAO
@UseDao(tables: [Product])
class ProductDao extends DatabaseAccessor<ApplicationDatabase> with _$ProductDaoMixin {
  final ApplicationDatabase attachedDatabase;

  ProductDao(this.attachedDatabase) : super(attachedDatabase);

  Future<List<ProductData>> getFiles() {
    return select(product).get();
  }

  Future<int> insertFile(ProductData productData) async {
    return await transaction(() async {
      return into(product).insertOnConflictUpdate(productData);
    });
  }

  Future<int> deleteFile(ProductData productData) async {
    return await transaction(() async {
      return await delete(product).delete(productData);
    });
  }
}
