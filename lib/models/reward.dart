class Reward {
  const Reward({
    this.id = '',
    this.name = '',
    this.logo = '',
  });

  final String id;
  final String name;
  final String logo;

  static const empty = Reward();
  bool get isEmpty => this == empty;
  bool get isNotEmpty => this != empty;
}
