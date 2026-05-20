import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/viewmodels/user/cart_list.dart';
import 'package:frontend/views/pages/user/user_payment_page.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';

class UserCartPage extends StatefulWidget {
  const UserCartPage({super.key});

  @override
  State<UserCartPage> createState() => _UserCartPageState();
}

class _UserCartPageState extends State<UserCartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: BeeStyle.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Text("My Order", style: TextStyle(fontSize: 24)),
                    CartList(),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ValueListenableBuilder(
              valueListenable: totalPriceNotifier,
              builder: (context, totalPrice, child) {
                return ValueListenableBuilder(
                  valueListenable: itemCountNotifier,
                  builder: (context, itemCount, child) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "$itemCount item(s)",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  currencyNotifier.value.format(totalPrice),
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          GlassContainerWidget(
                            width: double.infinity,
                            fillColor: itemCount == 0
                                ? BeeStyle.lightBlack.withAlpha(60)
                                : BeeStyle.orange.withAlpha(60),
                            padding: EdgeInsetsGeometry.all(8),
                            borderRadius: 100,
                            onTap: () {
                              if (itemCount > 0) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserPaymentPage(),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              itemCount == 0
                                  ? "Cart is Empty"
                                  : "Proceed to Payment",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
