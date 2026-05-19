import 'package:flutter/material.dart';
import 'package:frontend/models/payment.dart';
import 'package:frontend/services/payment_service.dart';
import 'package:frontend/views/widgets/user/user_history_card_widget.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({super.key});

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  List<Payment>? payments;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadHistory();
  }

  void loadHistory() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      final data = await PaymentService.getAllPaymentsByUser(1);
      setState(() {
        isLoading = false;
        payments = data;
      });
    } catch (error) {
      setState(() {
        errorMessage = error.toString();
        isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage!),
            backgroundColor: Colors.redAccent,
            action: SnackBarAction(
              label: "RETRY",
              textColor: Colors.white,
              onPressed: loadHistory,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CircularProgressIndicator();
    }
    if (errorMessage != null && payments == null) {
      return Center(child: Text("$errorMessage"));
    }
    return Column(
      spacing: 16.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          spacing: 16.0,
          children: payments!.map((payment) {
            return UserHistoryCardWidget(payment: payment);
          }).toList(),
        ),
      ],
    );
    ;
  }
}
