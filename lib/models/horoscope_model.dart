class HoroscopeModel {
  final String zodiacSign;
  final String date;
  final String dailyPrediction;
  final String weeklyPrediction;
  final String monthlyPrediction;
  final List<int> luckyNumbers;
  final List<String> luckyColors;
  final String mood;
  final int energyLevel;
  final Map<String, int> compatibility;

  HoroscopeModel({
    required this.zodiacSign,
    required this.date,
    required this.dailyPrediction,
    required this.weeklyPrediction,
    required this.monthlyPrediction,
    required this.luckyNumbers,
    required this.luckyColors,
    required this.mood,
    required this.energyLevel,
    required this.compatibility,
  });

  factory HoroscopeModel.fromJson(Map<String, dynamic> json) {
    return HoroscopeModel(
      zodiacSign: json['zodiacSign'] ?? '',
      date: json['date'] ?? '',
      dailyPrediction: json['dailyPrediction'] ?? '',
      weeklyPrediction: json['weeklyPrediction'] ?? '',
      monthlyPrediction: json['monthlyPrediction'] ?? '',
      luckyNumbers: List<int>.from(json['luckyNumbers'] ?? []),
      luckyColors: List<String>.from(json['luckyColors'] ?? []),
      mood: json['mood'] ?? '',
      energyLevel: json['energyLevel'] ?? 50,
      compatibility: Map<String, int>.from(json['compatibility'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'zodiacSign': zodiacSign,
      'date': date,
      'dailyPrediction': dailyPrediction,
      'weeklyPrediction': weeklyPrediction,
      'monthlyPrediction': monthlyPrediction,
      'luckyNumbers': luckyNumbers,
      'luckyColors': luckyColors,
      'mood': mood,
      'energyLevel': energyLevel,
      'compatibility': compatibility,
    };
  }
}
