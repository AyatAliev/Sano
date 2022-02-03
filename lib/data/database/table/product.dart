import 'package:moor/moor.dart';

class Product extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get price => integer().nullable()();
  DateTimeColumn get date => dateTime()();
}