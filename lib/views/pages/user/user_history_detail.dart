import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/payment.dart';
import 'package:frontend/viewmodels/user/history_detail.dart';

class UserHistoryDetail extends StatefulWidget {
  final Payment payment;

  const UserHistoryDetail({super.key, required this.payment});

  @override
  State<UserHistoryDetail> createState() => _UserHistoryDetailState();
}

class _UserHistoryDetailState extends State<UserHistoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    BackButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text("Transaction Summary", style: TextStyle(fontSize: 24)),
                  ],
                ),
                HistoryDetail(payment: widget.payment),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
