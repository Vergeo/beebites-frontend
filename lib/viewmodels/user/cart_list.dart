import 'package:flutter/material.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/models/payment.dart';
import 'package:frontend/services/cart_service.dart';
import 'package:frontend/services/payment_service.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/user/user_cart_item.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    CartService.getCartFromUser(currentUserNotifier.value!.userId);
  }

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
    return ValueListenableBuilder(
      valueListenable: cartNotifier,
      builder: (context, carts, child) {
        return Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: carts.map((item) {
                return UserCartItem(cart: item);
              }).toList(),
            ),
            GlassContainerWidget(onTap: () => pay(), child: Text("Pay")),
          ],
        );
      },
    );
  }
}
