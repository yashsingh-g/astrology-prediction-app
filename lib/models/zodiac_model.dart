class ZodiacModel {
  final int id;
  final String name;
  final String emoji;
  final String dateRange;
  final String element;
  final String rulingPlanet;
  final List<String> traits;
  final String symbol;

  ZodiacModel({
    required this.id,
    required this.name,
    required this.emoji,
    required this.dateRange,
    required this.element,
    required this.rulingPlanet,
    required this.traits,
    required this.symbol,
  });

  factory ZodiacModel.fromJson(Map<String, dynamic> json) {
    return ZodiacModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      emoji: json['emoji'] ?? '',
      dateRange: json['dateRange'] ?? '',
      element: json['element'] ?? '',
      rulingPlanet: json['rulingPlanet'] ?? '',
      traits: List<String>.from(json['traits'] ?? []),
      symbol: json['symbol'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'emoji': emoji,
      'dateRange': dateRange,
      'element': element,
      'rulingPlanet': rulingPlanet,
      'traits': traits,
      'symbol': symbol,
    };
  }
}
