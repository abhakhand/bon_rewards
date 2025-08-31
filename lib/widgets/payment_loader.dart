import 'package:flutter/material.dart';

class PaymentLoader extends StatelessWidget {
  const PaymentLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          const ModalBarrier(
            color: Colors.black87,
            dismissible: false,
          ),
          Center(
            child: Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      16,
                    ),
                  ),
                  child: const CircularProgressIndicator(),
                ),
                const Text(
                  'Validating payment...',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
