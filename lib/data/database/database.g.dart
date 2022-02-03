// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ProductData extends DataClass implements Insertable<ProductData> {
  final int? id;
  final String name;
  final int? price;
  final DateTime date;

  ProductData({this.id, required this.name, this.price, required this.date});

  factory ProductData.fromData(Map<String, dynamic> data, GeneratedDatabase db, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ProductData(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      price: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}price']),
      date: const DateTimeType().mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id!);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<int?>(price);
    }
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  ProductCompanion toCompanion(bool nullToAbsent) {
    return ProductCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id!),
      name: Value(name),
      price: price == null && nullToAbsent ? const Value.absent() : Value(price),
      date: Value(date),
    );
  }

  factory ProductData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProductData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<int?>(json['price']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id!),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<int?>(price),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  ProductData copyWith({int? id, String? name, int? price, DateTime? date}) => ProductData(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        date: date ?? this.date,
      );

  @override
  String toString() {
    return (StringBuffer('ProductData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, price, date);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductData &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.date == this.date);
}

class ProductCompanion extends UpdateCompanion<ProductData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> price;
  final Value<DateTime> date;

  const ProductCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.date = const Value.absent(),
  });

  ProductCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.price = const Value.absent(),
    required DateTime date,
  })  : name = Value(name),
        date = Value(date);

  static Insertable<ProductData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int?>? price,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (date != null) 'date': date,
    });
  }

  ProductCompanion copyWith({Value<int>? id, Value<String>? name, Value<int?>? price, Value<DateTime>? date}) {
    return ProductCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<int?>(price.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $ProductTable extends Product with TableInfo<$ProductTable, ProductData> {
  final GeneratedDatabase _db;
  final String? _alias;

  $ProductTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>('id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false, defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name =
      GeneratedColumn<String?>('name', aliasedName, false, type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int?> price =
      GeneratedColumn<int?>('price', aliasedName, true, type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date =
      GeneratedColumn<DateTime?>('date', aliasedName, false, type: const IntType(), requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns => [id, name, price, date];

  @override
  String get aliasedName => _alias ?? 'product';

  @override
  String get actualTableName => 'product';

  @override
  VerificationContext validateIntegrity(Insertable<ProductData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(_nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(_priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('date')) {
      context.handle(_dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  ProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ProductData.fromData(data, _db, prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ProductTable createAlias(String alias) {
    return $ProductTable(_db, alias);
  }
}

abstract class _$ApplicationDatabase extends GeneratedDatabase {
  _$ApplicationDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ProductTable? _product;
  $ProductTable get product => _product ??= $ProductTable(this);

  ProductDao? _productDao;
  ProductDao get productDao => _productDao ??= ProductDao(this as ApplicationDatabase);

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [product];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ProductDaoMixin on DatabaseAccessor<ApplicationDatabase> {
  $ProductTable get product => attachedDatabase.product;
}
