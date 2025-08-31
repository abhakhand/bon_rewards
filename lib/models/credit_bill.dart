enum BillStatus {
  paid('Fully Paid'),
  dueSoon('Due Soon'),
  overdue('Overdue');

  const BillStatus(this.message);

  final String message;

  bool get isPaid => this == BillStatus.paid;
  bool get isDueSoon => this == BillStatus.dueSoon;
  bool get isOverdue => this == BillStatus.overdue;
}

class CreditBill {
  const CreditBill({
    required this.id,
    required this.amount,
    required this.date,
    required this.status,
  });

  final String id;
  final double amount;
  final DateTime date;
  final BillStatus status;
}
