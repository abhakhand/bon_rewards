import 'package:bon_rewards/models/credit_bill.dart';
import 'package:bon_rewards/pages/rewards_page.dart';
import 'package:bon_rewards/widgets/card_tile.dart';
import 'package:bon_rewards/widgets/payment_loader.dart';
import 'package:flutter/material.dart';

class BillsPage extends StatelessWidget {
  const BillsPage({super.key});

  static final mockBills = [
    CreditBill(
      id: '14',
      amount: 230.75,
      date: DateTime(2025, 8, 20),
      status: BillStatus.overdue,
    ),
    CreditBill(
      id: '09',
      amount: 89.99,
      date: DateTime(2025, 8, 17),
      status: BillStatus.dueSoon,
    ),
    CreditBill(
      id: '99',
      amount: 120.40,
      date: DateTime(2025, 8, 10),
      status: BillStatus.paid,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BON Rewards'),
        centerTitle: false,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16, bottom: 4),
              child: Text('Your credit card bills'),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              child: Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final bill in mockBills)
                    CardTile(
                      key: ValueKey(bill.id),
                      bill: bill,
                      animationDelay: Duration(
                        milliseconds: mockBills.indexOf(bill) * 200,
                      ),
                      onPayTap: () async {
                        final overlay = OverlayEntry(
                          builder: (context) => const PaymentLoader(),
                        );

                        Overlay.of(context, rootOverlay: true).insert(overlay);

                        await Future<void>.delayed(
                          const Duration(seconds: 2),
                          overlay.remove,
                        );

                        if (!context.mounted) return;

                        await Navigator.of(context).push<void>(
                          MaterialPageRoute(
                            builder: (_) => const RewardsPage(),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
