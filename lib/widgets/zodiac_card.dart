import 'package:flutter/material.dart';
import 'package:astro_predict/utils/app_colors.dart';

class ZodiacCard extends StatefulWidget {
  final String zodiacSign;
  final String emoji;
  final String dateRange;
  final VoidCallback onTap;

  const ZodiacCard({Key? key, required this.zodiacSign, required this.emoji, required this.dateRange, required this.onTap}) : super(key: key);

  @override
  State<ZodiacCard> createState() => _ZodiacCardState();
}

class _ZodiacCardState extends State<ZodiacCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final zodiacColor = AppColors.zodiacColors[widget.zodiacSign.toLowerCase()] ?? AppColors.primary;

    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTapDown: (_) => _animationController.forward(),
        onTapUp: (_) {
          _animationController.reverse();
          widget.onTap();
        },
        onTapCancel: () => _animationController.reverse(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [zodiacColor.withOpacity(0.3), zodiacColor.withOpacity(0.1)]),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: zodiacColor.withOpacity(0.5), width: 2),
            boxShadow: [BoxShadow(color: zodiacColor.withOpacity(0.3), blurRadius: 15, offset: Offset(0, 5))],
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(widget.emoji, style: TextStyle(fontSize: 40, height: 1)),
              SizedBox(height: 12),
              Text(widget.zodiacSign, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
              SizedBox(height: 8),
              Text(widget.dateRange, style: TextStyle(fontSize: 12, color: Colors.white60), textAlign: TextAlign.center),
            ]),
          ),
        ),
      ),
    );
  }
}
