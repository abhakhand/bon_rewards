import 'dart:math';

import 'package:bon_rewards/helpers.dart';
import 'package:bon_rewards/models/credit_bill.dart';
import 'package:flutter/material.dart';

class CardTile extends StatefulWidget {
  const CardTile({
    required this.bill,
    required this.onPayTap,
    this.animationDelay = Duration.zero,
    super.key,
  });

  final CreditBill bill;
  final VoidCallback onPayTap;
  final Duration animationDelay;

  @override
  State<CardTile> createState() => _CardTileState();
}

class _CardTileState extends State<CardTile>
    with SingleTickerProviderStateMixin {
  final colors = <Color>[];
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    colors
      ..add(gradientColors[Random().nextInt(gradientColors.length)])
      ..add(Colors.black);

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
      child: Container(
        height: 240,
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 12,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.credit_card,
                  color: Colors.white70,
                  size: 28,
                ),
                const Spacer(),
                if (widget.bill.status.isPaid)
                  Text(
                    widget.bill.status.message,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 16,
                    ),
                  ),

                if (widget.bill.status.isDueSoon ||
                    widget.bill.status.isOverdue)
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: widget.bill.status.isOverdue
                              ? Colors.red
                              : Colors.black,
                          backgroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: widget.onPayTap,
                        child: const Text('Pay Now'),
                      ),
                      if (widget.bill.status.isOverdue)
                        const Text(
                          'Overdue',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                    ],
                  ),
              ],
            ),
            const Spacer(),
            Text(
              '**** **** **** ${widget.bill.id.padLeft(4, '0')}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Amount',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    Text(
                      '\$${widget.bill.amount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Due Date',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    Text(
                      formatDate(widget.bill.date),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
