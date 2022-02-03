
class Product {
  final int? id;
  final String name;
  final int price;
  final DateTime date;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.date,
  });

  Product copyWith({
    String? name,
    int? price,
    DateTime? date,
  }) {
    return Product(
      id: id,
      name: name ?? this.name,
      price: price ?? this.price,
      date: date ?? this.date,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
