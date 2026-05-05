import 'package:flutter/material.dart';
import 'package:astro_predict/models/horoscope_model.dart';
import 'package:astro_predict/services/horoscope_service.dart';

class HoroscopeProvider extends ChangeNotifier {
  final HoroscopeService _horoscopeService = HoroscopeService();
  
  HoroscopeModel? _currentHoroscope;
  bool _isLoading = false;
  String? _error;
  String? _selectedZodiac;

  HoroscopeModel? get currentHoroscope => _currentHoroscope;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get selectedZodiac => _selectedZodiac;

  Future<void> fetchHoroscope(String zodiacSign) async {
    _isLoading = true;
    _error = null;
    _selectedZodiac = zodiacSign;
    notifyListeners();

    try {
      _currentHoroscope = await _horoscopeService.getHoroscope(zodiacSign);
    } catch (e) {
      _error = 'Failed to fetch horoscope: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
