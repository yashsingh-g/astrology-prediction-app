# Astro Predict 🌟

A beautiful Flutter astrology prediction app that provides daily horoscope predictions, lucky numbers, mood insights, and zodiac compatibility for all 12 zodiac signs.

## Features ✨

- 📱 **Beautiful UI** - Modern Material Design 3 with dark theme
- 🔮 **Daily Horoscope** - Get daily predictions for your zodiac sign
- 📅 **Weekly & Monthly Predictions** - Extended forecast insights
- 🎰 **Lucky Numbers** - Personalized lucky numbers for each sign
- 🎨 **Lucky Colors** - Cosmic-aligned color recommendations
- 😊 **Mood Indicator** - Current cosmic mood tracking
- ⚡ **Energy Level** - Dynamic energy percentage
- 💕 **Zodiac Compatibility** - Relationship compatibility ratings
- 🔔 **Push Notifications** - Daily horoscope reminders
- 🌙 **Dark Mode** - Eye-friendly dark theme
- ✨ **Smooth Animations** - Beautiful transitions and interactions

## Getting Started 🚀

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (included with Flutter)
- Android Studio / Xcode for emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yashsingh-g/astrology-prediction-app.git
   cd astrology-prediction-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure 📁

```
lib/
├── main.dart                 # App entry point
├── screens/
│   ├── splash_screen.dart   # Splash screen with animations
│   ├── home_screen.dart     # Home screen with zodiac grid
│   ├── horoscope_screen.dart # Full horoscope display
│   └── profile_screen.dart  # Profile and settings
├── widgets/
│   ├── zodiac_card.dart     # Zodiac card widget
│   └── horoscope_card.dart  # Horoscope card widget
├── models/
│   ├── zodiac_model.dart    # Zodiac data model
│   └── horoscope_model.dart # Horoscope data model
├── providers/
│   └── horoscope_provider.dart  # State management
├── services/
│   ├── horoscope_service.dart   # Horoscope service
│   └── notification_service.dart # Notification service
└── utils/
    ├── app_colors.dart      # Color constants
    └── app_strings.dart     # String constants
```

## Dependencies 📦

- **provider** (6.0.0) - State management
- **flutter_local_notifications** (16.0.0) - Push notifications
- **lottie** (2.4.0) - Animations
- **http** (1.1.0) - HTTP requests
- **intl** (0.19.0) - Internationalization
- **timezone** (0.9.0) - Timezone handling
- **shared_preferences** (2.2.0) - Local storage

## Building for Release 🏗️

### Generate App Signing Key
```bash
keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias astro_key
```

### Build APK
```bash
flutter build apk --release
# Output: build/app/outputs/apk/release/app-release.apk
```

### Build App Bundle (Recommended)
```bash
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

## Configuration ⚙️

### App Details
- **App Name**: Astro Predict
- **Package Name**: com.astropredict.app
- **Version**: 1.0.0
- **Build Number**: 1
- **Min SDK**: 21 (Android 5.1)
- **Target SDK**: 34 (Android 14)

### Colors
- **Primary**: #4d0099 (Purple)
- **Accent**: #00e6e6 (Cyan)
- **Background**: #0d0015 (Deep Purple)

## Zodiac Signs 🔯

The app includes all 12 zodiac signs with:
- Unique emojis
- Date ranges
- Daily, weekly, and monthly predictions (500+ words each)
- Personalized lucky numbers
- Lucky colors
- Mood indicators
- Energy levels
- Compatibility ratings with other signs

## Features in Detail 🌈

### Splash Screen
- Beautiful gradient background
- Animated logo and text
- Smooth fade-in and scale transitions
- Progress indicator

### Home Screen
- 3×4 zodiac grid
- Color-coded zodiac cards
- Interactive cards with scale animation
- About astrology section
- Bottom navigation

### Horoscope Screen
- Zodiac header with emoji
- Tab-based predictions (Daily/Weekly/Monthly)
- Lucky numbers and colors
- Mood and energy indicators
- Zodiac compatibility with progress bars
- Error handling and retry functionality

### Profile Screen
- User profile header
- Notification settings
- Theme settings
- About section
- Help & support
- Privacy policy
- Terms & conditions

## Notifications 🔔

The app supports daily push notifications:
- Enable/disable in settings
- Customizable time (default 8:00 AM)
- Repeats daily
- Local device notifications

## State Management 🔄

Using Provider pattern for efficient state management:
- `HoroscopeProvider` - Manages horoscope data and loading states
- Easy to extend for future features
- Clean architecture

## Error Handling ⚠️

- Loading states with spinners
- Error messages with retry buttons
- Try-catch error handling
- User-friendly error messages

## Animations ✨

- Splash screen fade-in and scale
- Zodiac card tap animations
- Smooth tab transitions
- Loading spinners
- Progress bar animations

## Testing 🧪

```bash
# Run tests
flutter test

# Run with coverage
flutter test --coverage
```

## Deployment 🚀

### Indus App Store
1. Create developer account
2. Prepare assets (icon, screenshots)
3. Sign APK/AAB
4. Upload to Indus Store
5. Complete app review
6. Go live!

For detailed deployment guide, see `INDUS_DEPLOYMENT.md`

## Troubleshooting 🔧

### Common Issues

**Issue**: App crashes on startup
- **Solution**: Run `flutter clean` and `flutter pub get`

**Issue**: Notifications not working
- **Solution**: Check permissions in AndroidManifest.xml

**Issue**: UI not displaying correctly
- **Solution**: Ensure you're using the correct Flutter version (3.0+)

## Security 🔐

- No hardcoded secrets or API keys
- Local data storage only
- No user tracking
- Privacy-first design
- Secure permissions handling

## Performance 📊

- Optimized for smooth 60 FPS
- Efficient state management
- Minimal memory footprint
- Fast app startup
- Smooth animations

## Contributing 🤝

Contributions are welcome! Please feel free to submit pull requests.

## License 📄

This project is open source and available under the MIT License.

## Support 💬

For support, email: support@astropredict.com

## Author 👨‍💻

Created with ❤️ by [Yash Singh](https://github.com/yashsingh-g)

## Changelog 📝

### Version 1.0.0
- Initial release
- All zodiac signs implemented
- Full horoscope predictions
- Notification system
- Profile and settings screen
- Beautiful UI with Material Design 3

---

**Made with ❤️ for astrology enthusiasts everywhere** ✨🔮
