import 'package:bon_rewards/models/reward.dart';
import 'package:bon_rewards/pages/reward_success_page.dart';
import 'package:bon_rewards/widgets/reward_card.dart';
import 'package:bon_rewards/widgets/reward_tile.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({super.key});

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  static const rewards = <Reward>[
    Reward(id: '1', name: 'Amazon', logo: 'assets/logos/amazon.svg'),
    Reward(id: '2', name: 'Zomato', logo: 'assets/logos/zomato.svg'),
    Reward(id: '3', name: 'Myntra', logo: 'assets/logos/myntra.svg'),
    Reward(id: '4', name: 'Flipkart', logo: 'assets/logos/flipkart.svg'),
    Reward(id: '5', name: 'Uber', logo: 'assets/logos/uber.svg'),
    Reward(id: '6', name: "Domino's", logo: 'assets/logos/dominos.svg'),
    Reward(id: '7', name: 'Blinkit', logo: 'assets/logos/adidas.svg'),
    Reward(id: '8', name: 'Swiggy', logo: 'assets/logos/swiggy.svg'),
  ];

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

  Reward selectedReward = Reward.empty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rewards')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 28,
            children: [
              const RewardTile(),
              const Text(
                'Select your favorite brand to redeem rewards',
                style: TextStyle(),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: rewards.length,
                  itemBuilder: (context, index) {
                    final reward = rewards[index];

                    return RewardCard(
                      reward: reward,
                      onTap: () {
                        setState(() {
                          selectedReward = reward;
                        });
                      },
                      isSelected: selectedReward.id == reward.id,
                      padding: EdgeInsets.all(
                        index == 4 || index == 5 || index == 6 ? 28 : 16,
                      ),
                      animationDelay: Duration(milliseconds: index * 100),
                    );
                  },
                ),
              ),
              if (selectedReward.isNotEmpty)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement<void, void>(
                      MaterialPageRoute(
                        builder: (_) => RewardSuccessPage(
                          reward: selectedReward,
                        ),
                      ),
                    );
                  },
                  child: const Text('Choose Reward'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
