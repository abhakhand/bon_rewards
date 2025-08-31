import 'package:bon_rewards/models/reward.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RewardSuccessPage extends StatefulWidget {
  const RewardSuccessPage({required this.reward, super.key});

  final Reward reward;

  @override
  State<RewardSuccessPage> createState() => _RewardSuccessPageState();
}

class _RewardSuccessPageState extends State<RewardSuccessPage> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 2),
    );

    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const Text(
                  'Congratulations!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'You have got a ${r'$10'} coupon for',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: SvgPicture.asset(
                    widget.reward.logo,
                    height: 80,
                    width: 80,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Continue'),
                ),
              ],
            ),

            ConfettiWidget(
              confettiController: _confettiController,
              minBlastForce: 0.9,
              numberOfParticles: 20,
              blastDirection: 1,
            ),
          ],
        ),
      ),
    );
  }
}
