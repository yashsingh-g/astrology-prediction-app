import 'package:flutter/material.dart';
import 'package:astro_predict/utils/app_colors.dart';
import 'package:astro_predict/services/notification_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificationsEnabled = true;
  bool _darkThemeEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'), leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context))),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              decoration: BoxDecoration(gradient: AppColors.gradientPrimary, borderRadius: BorderRadius.circular(16)),
              padding: EdgeInsets.all(20),
              child: Column(children: [
                CircleAvatar(radius: 50, backgroundColor: AppColors.accent, child: Icon(Icons.person, size: 50, color: AppColors.primary)),
                SizedBox(height: 16),
                Text('Astro Predict User', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 4),
                Text('v1.0.0', style: TextStyle(fontSize: 12, color: Colors.white60)),
              ]),
            ),
            SizedBox(height: 24),
            Text('Settings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 12),
            _buildSettingTile(icon: Icons.notifications, title: 'Enable Notifications', subtitle: 'Receive daily horoscope updates', value: _notificationsEnabled, onChanged: (value) {
              setState(() => _notificationsEnabled = value);
              if (value) {
                NotificationService.scheduleDailyNotification(id: 1, title: 'Daily Horoscope', body: 'Your cosmic prediction is ready!', hour: 8, minute: 0);
              } else {
                NotificationService.cancelNotification(1);
              }
            }),
            SizedBox(height: 12),
            _buildSettingTile(icon: Icons.dark_mode, title: 'Dark Theme', subtitle: 'Currently enabled', value: _darkThemeEnabled, onChanged: (value) => setState(() => _darkThemeEnabled = value)),
            SizedBox(height: 24),
            Text('About', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 12),
            _buildMenuTile(icon: Icons.info, title: 'About Astro Predict', onTap: () => _showAboutDialog(context)),
            SizedBox(height: 8),
            _buildMenuTile(icon: Icons.help, title: 'Help & Support', onTap: () => _showHelpDialog(context)),
            SizedBox(height: 8),
            _buildMenuTile(icon: Icons.privacy_tip, title: 'Privacy Policy', onTap: () => _showPrivacyDialog(context)),
            SizedBox(height: 8),
            _buildMenuTile(icon: Icons.description, title: 'Terms & Conditions', onTap: () => _showTermsDialog(context)),
          ]),
        ),
      ),
    );
  }

  Widget _buildSettingTile({required IconData icon, required String title, required String subtitle, required bool value, required Function(bool) onChanged}) {
    return Container(
      decoration: BoxDecoration(color: AppColors.cardBackground, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.accent.withOpacity(0.2))),
      child: ListTile(leading: Icon(icon, color: AppColors.accent), title: Text(title, style: TextStyle(color: Colors.white)), subtitle: Text(subtitle, style: TextStyle(color: Colors.white60)), trailing: Switch(value: value, onChanged: onChanged, activeColor: AppColors.accent)),
    );
  }

  Widget _buildMenuTile({required IconData icon, required String title, required VoidCallback onTap}) {
    return Container(
      decoration: BoxDecoration(color: AppColors.cardBackground, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.accent.withOpacity(0.2))),
      child: ListTile(leading: Icon(icon, color: AppColors.accent), title: Text(title, style: TextStyle(color: Colors.white)), trailing: Icon(Icons.arrow_forward, color: Colors.white30), onTap: onTap),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(backgroundColor: AppColors.cardBackground, title: Text('About Astro Predict', style: TextStyle(color: Colors.white)), content: Text('Astro Predict is your personal astrology guide. Get daily horoscope predictions, lucky numbers, and cosmic insights tailored to your zodiac sign.', style: TextStyle(color: Colors.white70)), actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('Close', style: TextStyle(color: AppColors.accent)))]));  }

  void _showHelpDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(backgroundColor: AppColors.cardBackground, title: Text('Help & Support', style: TextStyle(color: Colors.white)), content: Text('For support, contact us at: support@astropredict.com\n\nVisit our website: www.astropredict.com', style: TextStyle(color: Colors.white70)), actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('Close', style: TextStyle(color: AppColors.accent)))]));  }

  void _showPrivacyDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(backgroundColor: AppColors.cardBackground, title: Text('Privacy Policy', style: TextStyle(color: Colors.white)), content: SingleChildScrollView(child: Text('We respect your privacy. Astro Predict does not collect or share your personal data without your consent. All horoscope data is generated locally and securely stored on your device.', style: TextStyle(color: Colors.white70))), actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('Close', style: TextStyle(color: AppColors.accent)))]));  }

  void _showTermsDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(backgroundColor: AppColors.cardBackground, title: Text('Terms & Conditions', style: TextStyle(color: Colors.white)), content: SingleChildScrollView(child: Text('By using Astro Predict, you agree to our terms. Astrology is for entertainment purposes. Predictions are not guaranteed. Use at your own discretion.', style: TextStyle(color: Colors.white70))), actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('Close', style: TextStyle(color: AppColors.accent)))]));  }
}
