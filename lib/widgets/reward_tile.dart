import 'package:bon_rewards/widgets/coin.dart';
import 'package:flutter/material.dart';

class RewardTile extends StatefulWidget {
  const RewardTile({super.key});

  @override
  State<RewardTile> createState() => _RewardTileState();
}

class _RewardTileState extends State<RewardTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _blurAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _blurAnimation = Tween<double>(begin: 2, end: 20).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Colors.indigo, Colors.cyan],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.indigo,
                blurRadius: _blurAnimation.value,
                offset: Offset(0, _blurAnimation.value / 3),
              ),
            ],
          ),
          child: Row(
            spacing: 20,
            children: [
              const Coin(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You've unlocked a",
                      style: theme.textTheme.titleMedium!.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      r'$10 reward!',
                      style: theme.textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
