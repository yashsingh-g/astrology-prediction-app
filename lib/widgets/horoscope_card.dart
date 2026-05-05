import 'package:flutter/material.dart';
import 'package:astro_predict/utils/app_colors.dart';

class HoroscopeCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final Color? accentColor;

  const HoroscopeCard({Key? key, required this.title, required this.content, required this.icon, this.accentColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppColors.cardBackground, AppColors.surfaceLight]),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: (accentColor ?? AppColors.accent).withOpacity(0.3), width: 1),
        boxShadow: [BoxShadow(color: (accentColor ?? AppColors.accent).withOpacity(0.2), blurRadius: 10, offset: Offset(0, 4))],
      ),
      padding: EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(icon, color: accentColor ?? AppColors.accent, size: 24),
          SizedBox(width: 12),
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        ]),
        SizedBox(height: 12),
        Text(content, style: TextStyle(fontSize: 14, color: Colors.white70, height: 1.5)),
      ]),
    );
  }
}
