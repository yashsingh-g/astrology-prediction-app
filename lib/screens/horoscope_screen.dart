import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:astro_predict/providers/horoscope_provider.dart';
import 'package:astro_predict/utils/app_colors.dart';
import 'package:astro_predict/widgets/horoscope_card.dart';

class HoroscopeScreen extends StatefulWidget {
  final String zodiacSign;
  final String emoji;

  const HoroscopeScreen({Key? key, required this.zodiacSign, required this.emoji}) : super(key: key);

  @override
  State<HoroscopeScreen> createState() => _HoroscopeScreenState();
}

class _HoroscopeScreenState extends State<HoroscopeScreen> {
  late int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HoroscopeProvider>().fetchHoroscope(widget.zodiacSign);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.zodiacSign),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: Consumer<HoroscopeProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.accent)),
                SizedBox(height: 16),
                Text('Loading your cosmic predictions...', style: TextStyle(color: Colors.white70)),
              ]),
            );
          }

          if (provider.error != null) {
            return Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.error, color: Colors.red, size: 48),
                SizedBox(height: 16),
                Text(provider.error ?? 'Error loading prediction', style: TextStyle(color: Colors.red), textAlign: TextAlign.center),
                SizedBox(height: 16),
                ElevatedButton(onPressed: () => provider.fetchHoroscope(widget.zodiacSign), child: Text('Retry')),
              ]),
            );
          }

          final horoscope = provider.currentHoroscope;
          if (horoscope == null) return Center(child: Text('No horoscope data available'));

          final zodiacColor = AppColors.zodiacColors[widget.zodiacSign.toLowerCase()] ?? AppColors.primary;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [zodiacColor.withOpacity(0.3), zodiacColor.withOpacity(0.1)]),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: zodiacColor.withOpacity(0.5)),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(children: [
                    Text(widget.emoji, style: TextStyle(fontSize: 48)),
                    SizedBox(height: 12),
                    Text(widget.zodiacSign, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                    SizedBox(height: 4),
                    Text(horoscope.date, style: TextStyle(fontSize: 12, color: Colors.white60)),
                  ]),
                ),
                SizedBox(height: 24),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    _buildTab('Daily', 0, zodiacColor),
                    SizedBox(width: 8),
                    _buildTab('Weekly', 1, zodiacColor),
                    SizedBox(width: 8),
                    _buildTab('Monthly', 2, zodiacColor),
                  ]),
                ),
                SizedBox(height: 16),
                HoroscopeCard(title: _getTabTitle(_selectedTabIndex), content: _getPrediction(horoscope, _selectedTabIndex), icon: Icons.auto_stories, accentColor: zodiacColor),
                SizedBox(height: 16),
                HoroscopeCard(title: 'Lucky Numbers', content: horoscope.luckyNumbers.join(', '), icon: Icons.numbers, accentColor: Colors.amber),
                SizedBox(height: 16),
                HoroscopeCard(title: 'Lucky Colors', content: horoscope.luckyColors.join(', '), icon: Icons.palette, accentColor: Colors.pink),
                SizedBox(height: 16),
                Row(children: [
                  Expanded(child: HoroscopeCard(title: 'Mood', content: horoscope.mood, icon: Icons.sentiment_satisfied, accentColor: Colors.purple)),
                  SizedBox(width: 12),
                  Expanded(child: HoroscopeCard(title: 'Energy', content: '${horoscope.energyLevel}%', icon: Icons.flash_on, accentColor: Colors.yellow)),
                ]),
                SizedBox(height: 16),
                Text('Compatibility', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 12),
                ...horoscope.compatibility.entries.map((entry) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text(entry.key, style: TextStyle(fontSize: 14, color: Colors.white70)),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: entry.value / 100,
                          minHeight: 8,
                          backgroundColor: Colors.white12,
                          valueColor: AlwaysStoppedAnimation<Color>(entry.value >= 80 ? Colors.green : entry.value >= 60 ? Colors.amber : Colors.red),
                        ),
                      ),
                      SizedBox(width: 12),
                      Text('${entry.value}%', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                    ]),
                  );
                }).toList(),
              ]),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTab(String label, int index, Color color) {
    final isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTabIndex = index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.3) : Colors.transparent,
          border: Border(bottom: BorderSide(color: isSelected ? color : Colors.transparent, width: 3)),
        ),
        child: Text(label, style: TextStyle(fontSize: 14, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, color: isSelected ? color : Colors.white60)),
      ),
    );
  }

  String _getTabTitle(int index) {
    switch (index) {
      case 0:
        return 'Daily Prediction';
      case 1:
        return 'Weekly Prediction';
      case 2:
        return 'Monthly Prediction';
      default:
        return 'Prediction';
    }
  }

  String _getPrediction(dynamic horoscope, int index) {
    switch (index) {
      case 0:
        return horoscope.dailyPrediction;
      case 1:
        return horoscope.weeklyPrediction;
      case 2:
        return horoscope.monthlyPrediction;
      default:
        return '';
    }
  }
}
