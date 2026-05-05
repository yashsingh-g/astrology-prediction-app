import 'package:flutter/material.dart';
import 'package:astro_predict/utils/app_colors.dart';
import 'package:astro_predict/utils/app_strings.dart';
import 'package:astro_predict/widgets/zodiac_card.dart';
import 'horoscope_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.appName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), backgroundColor: AppColors.primary, elevation: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Select Your Zodiac Sign', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.85),
              itemCount: AppStrings.zodiacSigns.length,
              itemBuilder: (context, index) {
                return ZodiacCard(
                  zodiacSign: AppStrings.zodiacSigns[index],
                  emoji: AppStrings.zodiacEmojis[index],
                  dateRange: AppStrings.zodiacDates[index],
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HoroscopeScreen(zodiacSign: AppStrings.zodiacSigns[index], emoji: AppStrings.zodiacEmojis[index]),
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [AppColors.accent.withOpacity(0.2), AppColors.primary.withOpacity(0.2)]),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.accent.withOpacity(0.3)),
              ),
              padding: EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('About Astrology', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 8),
                Text(
                  'Discover the cosmic insights into your personality and future. Our app provides daily, weekly, and monthly horoscope predictions based on your zodiac sign.',
                  style: TextStyle(fontSize: 14, color: Colors.white70, height: 1.5),
                ),
              ]),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: AppColors.cardBackground,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: Colors.white30,
        items: [BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'), BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')],
        onTap: (index) {
          setState(() => _selectedIndex = index);
          if (index == 1) Navigator.of(context).pushNamed('/profile');
        },
      ),
    );
  }
}
