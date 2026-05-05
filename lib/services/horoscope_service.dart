import 'package:astro_predict/models/horoscope_model.dart';
import 'package:intl/intl.dart';

class HoroscopeService {
  final Map<String, Map<String, dynamic>> _horoscopeData = {
    'Aries': {
      'daily': 'Today brings exciting opportunities for new ventures. Your natural leadership qualities will shine through, attracting positive attention from those around you. Trust your instincts and take bold action towards your goals.',
      'weekly': 'This week is all about taking action on your plans. The stars align favorably for bold decisions and new beginnings. Trust your instincts and move forward with confidence. Success awaits the bold.',
      'monthly': 'March brings transformation and growth. This is an excellent time for starting new projects and establishing yourself as a leader in your field. Financial gains are possible.',
      'luckyNumbers': [1, 8, 17],
      'luckyColors': ['Red', 'Gold'],
      'mood': 'Energetic',
      'energy': 85,
      'compatibility': {'Leo': 90, 'Sagittarius': 88, 'Gemini': 75, 'Aquarius': 70, 'Libra': 65},
    },
    'Taurus': {
      'daily': 'Stability and security are your focus today. This is a good day for financial planning and making practical decisions that will benefit you long-term. Patience brings rewards.',
      'weekly': 'The week favors consistency and hard work. Your efforts will be rewarded, and you may see tangible progress in your goals. Stay grounded and focused.',
      'monthly': 'April brings financial opportunities and abundance. This is an excellent time for investments and securing your future. Trust the process and remain steadfast.',
      'luckyNumbers': [2, 6, 15],
      'luckyColors': ['Green', 'Pink'],
      'mood': 'Calm',
      'energy': 70,
      'compatibility': {'Virgo': 92, 'Capricorn': 90, 'Cancer': 80, 'Pisces': 75, 'Scorpio': 68},
    },
    'Gemini': {
      'daily': 'Communication flows beautifully today. Your words carry power, making it an ideal time for important conversations, presentations, or connecting with others. Express yourself freely.',
      'weekly': 'Social connections flourish this week. Networking and collaboration bring wonderful opportunities. Express yourself freely and listen actively to others.',
      'monthly': 'May is your time to shine socially and intellectually. New connections can lead to exciting opportunities. Keep your mind open to possibilities and embrace change.',
      'luckyNumbers': [3, 5, 12],
      'luckyColors': ['Yellow', 'Cyan'],
      'mood': 'Curious',
      'energy': 80,
      'compatibility': {'Aquarius': 95, 'Libra': 93, 'Aries': 80, 'Leo': 75, 'Sagittarius': 70},
    },
    'Cancer': {
      'daily': 'Emotions run deep today. Trust your intuition and inner wisdom. This is a perfect time to connect with loved ones and create a nurturing environment around you.',
      'weekly': 'Family and home matters take center stage. The stars support harmony and togetherness. Invest time in relationships that matter most to you.',
      'monthly': 'June brings emotional clarity and spiritual growth. Focus on self-care and creating a safe space for yourself. Healing is at hand.',
      'luckyNumbers': [4, 7, 16],
      'luckyColors': ['Silver', 'White'],
      'mood': 'Nurturing',
      'energy': 75,
      'compatibility': {'Taurus': 88, 'Virgo': 90, 'Pisces': 92, 'Scorpio': 85, 'Capricorn': 72},
    },
    'Leo': {
      'daily': 'Your confidence peaks today. This is your moment to shine and take center stage. Your natural charisma draws others to you effortlessly. Embrace the spotlight.',
      'weekly': 'Creativity and self-expression flourish. The universe supports your projects and ambitions. Don\'t be shy about showcasing your talents and abilities.',
      'monthly': 'July is your power month. Leo season brings recognition and success. Embrace the spotlight and pursue your dreams with boldness and confidence.',
      'luckyNumbers': [5, 1, 19],
      'luckyColors': ['Gold', 'Orange'],
      'mood': 'Confident',
      'energy': 90,
      'compatibility': {'Aries': 92, 'Sagittarius': 95, 'Gemini': 80, 'Libra': 85, 'Aquarius': 70},
    },
    'Virgo': {
      'daily': 'Your analytical mind is sharp today. This is excellent for solving problems and organizing your thoughts. Attention to detail pays off handsomely.',
      'weekly': 'Work and productivity receive stellar support. Your efforts are recognized and appreciated. This is a great time for professional advancement and growth.',
      'monthly': 'August brings clarity and organization. This is your chance to refine your skills and achieve your professional goals. Excellence is within reach.',
      'luckyNumbers': [6, 3, 9],
      'luckyColors': ['Green', 'Brown'],
      'mood': 'Focused',
      'energy': 78,
      'compatibility': {'Taurus': 92, 'Capricorn': 95, 'Cancer': 88, 'Scorpio': 82, 'Pisces': 70},
    },
    'Libra': {
      'daily': 'Harmony and balance are your themes today. Relationships flourish, and your diplomatic skills shine. This is a great day for partnerships and agreements.',
      'weekly': 'Social interactions are delightful. The stars favor cooperation and mutual understanding. Build connections that matter. Love is in the air.',
      'monthly': 'September brings relationship blossoms and social success. This is an ideal time for commitment and shared ventures. Balance in all things.',
      'luckyNumbers': [7, 6, 15],
      'luckyColors': ['Blue', 'Pink'],
      'mood': 'Harmonious',
      'energy': 80,
      'compatibility': {'Gemini': 93, 'Aquarius': 95, 'Aries': 75, 'Leo': 85, 'Sagittarius': 80},
    },
    'Scorpio': {
      'daily': 'Your intensity and passion are at their peak. This is a day for deep connections and meaningful action. Your determination is unstoppable. Embrace your power.',
      'weekly': 'Transformation and rebirth are on the horizon. Trust your instincts and follow your intuition. Hidden truths may be revealed to your benefit.',
      'monthly': 'October is your power month. Scorpio season brings transformation and strength. Embrace change and emerge stronger than before.',
      'luckyNumbers': [8, 4, 17],
      'luckyColors': ['Maroon', 'Black'],
      'mood': 'Intense',
      'energy': 88,
      'compatibility': {'Cancer': 92, 'Pisces': 95, 'Taurus': 75, 'Virgo': 85, 'Capricorn': 88},
    },
    'Sagittarius': {
      'daily': 'Adventure calls! Your optimism is contagious and your enthusiasm knows no bounds. This is a perfect day for taking chances and exploring new horizons.',
      'weekly': 'Expansion and growth are highlighted. The stars support travel, learning, and new experiences. Embrace opportunities with open arms.',
      'monthly': 'November brings freedom and adventure. This is an excellent time for exploration and broadening your horizons. The world is yours to discover.',
      'luckyNumbers': [9, 3, 12],
      'luckyColors': ['Purple', 'Orange'],
      'mood': 'Adventurous',
      'energy': 85,
      'compatibility': {'Aries': 90, 'Leo': 95, 'Gemini': 80, 'Aquarius': 88, 'Libra': 85},
    },
    'Capricorn': {
      'daily': 'Discipline and determination guide your path today. Your strategic thinking brings success. This is a day to focus on long-term goals and stability.',
      'weekly': 'Achievement and recognition are within reach. Your hard work pays off. Stay focused and professional. Career moves favor you now.',
      'monthly': 'December brings success and recognition. This is your time to shine professionally. Ambition is rewarded and goals come within reach.',
      'luckyNumbers': [1, 8, 10],
      'luckyColors': ['Brown', 'Black'],
      'mood': 'Ambitious',
      'energy': 82,
      'compatibility': {'Taurus': 92, 'Virgo': 95, 'Cancer': 85, 'Scorpio': 90, 'Pisces': 75},
    },
    'Aquarius': {
      'daily': 'Innovation and originality define your day. Your unique perspective is valued. This is perfect for brainstorming and pursuing unconventional ideas.',
      'weekly': 'The unexpected brings excitement. Stay flexible and open to new possibilities. Your ideas can change the world. Collaboration prospers.',
      'monthly': 'January brings fresh starts and innovation. This is your time to revolutionize and think differently. The future is yours to create.',
      'luckyNumbers': [2, 7, 11],
      'luckyColors': ['Cyan', 'Blue'],
      'mood': 'Innovative',
      'energy': 83,
      'compatibility': {'Gemini': 95, 'Libra': 95, 'Aries': 80, 'Sagittarius': 90, 'Leo': 70},
    },
    'Pisces': {
      'daily': 'Your intuition is extraordinary today. Dreams and imagination guide you toward your desires. Trust your inner voice and creative instincts.',
      'weekly': 'Spiritual growth and emotional depth are highlighted. This is a time for reflection and healing. Connect with your true self and purpose.',
      'monthly': 'February brings spiritual awakening and emotional clarity. This is your time for introspection and following your dreams. Magic is real.',
      'luckyNumbers': [3, 9, 18],
      'luckyColors': ['Sea Green', 'Lavender'],
      'mood': 'Intuitive',
      'energy': 76,
      'compatibility': {'Cancer': 95, 'Scorpio': 93, 'Taurus': 80, 'Capricorn': 78, 'Virgo': 72},
    },
  };

  Future<HoroscopeModel> getHoroscope(String zodiacSign) async {
    await Future.delayed(Duration(seconds: 1));
    final data = _horoscopeData[zodiacSign];
    if (data == null) throw Exception('Zodiac sign not found');

    final today = DateTime.now();
    final dateFormatter = DateFormat('dd MMM yyyy');

    return HoroscopeModel(
      zodiacSign: zodiacSign,
      date: dateFormatter.format(today),
      dailyPrediction: data['daily'] ?? '',
      weeklyPrediction: data['weekly'] ?? '',
      monthlyPrediction: data['monthly'] ?? '',
      luckyNumbers: List<int>.from(data['luckyNumbers'] ?? []),
      luckyColors: List<String>.from(data['luckyColors'] ?? []),
      mood: data['mood'] ?? '',
      energyLevel: data['energy'] ?? 50,
      compatibility: Map<String, int>.from(data['compatibility'] ?? {}),
    );
  }

  Future<List<HoroscopeModel>> getAllHoroscopes() async {
    final horoscopes = <HoroscopeModel>[];
    for (String zodiac in _horoscopeData.keys) {
      final horoscope = await getHoroscope(zodiac);
      horoscopes.add(horoscope);
    }
    return horoscopes;
  }
}
