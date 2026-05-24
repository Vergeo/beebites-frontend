import 'package:flutter/material.dart';
import 'package:frontend/models/cart.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/models/tenant.dart';
import 'package:frontend/services/tenant_service.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';

class PaymentDetail extends StatefulWidget {
  const PaymentDetail({super.key});

  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  Tenant? tenant;
  bool isLoading = true;
  String? errorMessage;
  List<Cart> carts = cartNotifier.value;
  int total = totalPriceNotifier.value;

  @override
  void initState() {
    super.initState();
    loadTenant();
  }

  void loadTenant() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final data = await TenantService.getTenant(selectedTenantNotifier.value!);
      setState(() {
        tenant = data;
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
              onPressed: loadTenant,
            ),
          ),
        );
      }
    }
  }

  Widget showDetail() {
    if (isLoading) {
      return CircularProgressIndicator();
    }
    if (errorMessage != null && tenant == null) {
      return Center(child: Text("$errorMessage"));
    }
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tenant!.tenantName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),

        Column(
          children: [
            Column(
              children: carts.map((order) {
                return Row(
                  children: [
                    SizedBox(width: 20, child: Text(order.quantity.toString())),
                    Expanded(child: Text(order.menu.menuName)),
                    Text(
                      currencyNotifier.value.format(
                        order.quantity * order.menu.menuPrice,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  currencyNotifier.value.format(total),
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GlassContainerWidget(width: double.infinity, child: showDetail());
  }
}
