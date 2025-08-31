import 'package:flutter/material.dart';

class Coin extends StatefulWidget {
  const Coin({super.key});

  @override
  State<Coin> createState() => _CoinState();
}

class _CoinState extends State<Coin> with SingleTickerProviderStateMixin {
  late final AnimationController _flipController;
  late final Animation<double> _flipAnimation;

  Future<void> _startFlipLoop() async {
    while (mounted) {
      await Future<void>.delayed(const Duration(seconds: 3));
      if (!mounted) break;
      await _flipController.forward();
      await _flipController.reverse();
    }
  }

  @override
  void initState() {
    super.initState();
    
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );

    _startFlipLoop();
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _flipAnimation,
      builder: (context, child) {
        // 0 to pi (180deg)
        final angle = _flipAnimation.value * 3.1416;

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(angle),
          child: Container(
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [Color(0xFFFFE066), Color(0xFFF4A261)],
              ),
            ),
            child: Center(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateY(angle >= 1.57 ? 3.1416 : 0),
                child: const Icon(Icons.stars, color: Colors.white, size: 32),
              ),
            ),
          ),
        );
      },
    );
  }
}
