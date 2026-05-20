import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/models/payment.dart';
import 'package:frontend/services/cart_service.dart';
import 'package:frontend/services/payment_service.dart';
import 'package:frontend/viewmodels/user/payment_detail.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';

class UserPaymentPage extends StatefulWidget {
  const UserPaymentPage({super.key});

  @override
  State<UserPaymentPage> createState() => _UserPaymentPageState();
}

class _UserPaymentPageState extends State<UserPaymentPage> {
  bool isLoading = true;
  String? errorMessage;
  bool paidStatus = false;

  void pay() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      final Payment payment = await PaymentService.createPayment(
        currentUserNotifier.value!.userId,
        selectedTenantNotifier.value!,
        "qris",
      );

      await CartService.checkout(
        currentUserNotifier.value!.userId,
        payment.paymentId,
      );
      setState(() {
        paidStatus = true;
        isLoading = false;
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
              onPressed: pay,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                child: Column(
                  spacing: 16,
                  children: [
                    Row(
                      children: [
                        BackButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text("Payment", style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    PaymentDetail(),
                    Image.asset("assets/images/qr.png"),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 16,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GlassContainerWidget(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Status",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          paidStatus
                              ? Text(
                                  "Paid",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.greenAccent,
                                  ),
                                )
                              : Text(
                                  "Not Paid",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.redAccent,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    GlassContainerWidget(
                      width: double.infinity,
                      fillColor: BeeStyle.orange.withAlpha(60),
                      padding: EdgeInsetsGeometry.all(8),
                      borderRadius: 100,
                      onTap: () => pay(),
                      child: Text(
                        "Refresh Payment Status",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
