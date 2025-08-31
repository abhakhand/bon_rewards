import 'package:bon_rewards/models/reward.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RewardCard extends StatefulWidget {
  const RewardCard({
    required this.reward,
    required this.onTap,
    this.isSelected = false,
    this.animationDelay = Duration.zero,
    this.padding = const EdgeInsets.all(16),
    super.key,
  });

  final Reward reward;
  final VoidCallback onTap;
  final bool isSelected;
  final Duration animationDelay;
  final EdgeInsetsGeometry padding;

  @override
  State<RewardCard> createState() => _RewardCardState();
}

class _RewardCardState extends State<RewardCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    if (widget.animationDelay != Duration.zero) {
      Future.delayed(widget.animationDelay, () {
        if (mounted) {
          _controller.forward();
        }
      });
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: widget.onTap,
        child: Card(
          elevation: 2,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: widget.isSelected ? const BorderSide() : BorderSide.none,
          ),
          child: Center(
            child: Padding(
              padding: widget.padding,
              child: SvgPicture.asset(widget.reward.logo),
            ),
          ),
        ),
      ),
    );
  }
}
