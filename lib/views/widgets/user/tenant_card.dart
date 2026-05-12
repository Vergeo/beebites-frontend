import 'package:flutter/material.dart';
import 'package:frontend/views/widgets/glass_card_widget.dart';

class TenantCard extends StatefulWidget {
  final VoidCallback? onTap;
  final String tenantName;
  final String tenantLogo;
  const TenantCard({
    super.key,
    this.onTap,
    required this.tenantName,
    required this.tenantLogo,
  });

  @override
  State<TenantCard> createState() => _TenantCardState();
}

class _TenantCardState extends State<TenantCard> {
  @override
  Widget build(BuildContext context) {
    return GlassCardWidget(
      onTap: widget.onTap,
      height: 100,
      dark: true,
      child: Row(
        spacing: 16,
        children: [
          Expanded(
            child: Row(
              spacing: 8,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(widget.tenantLogo, width: 75, height: 75),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.tenantName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time_sharp, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          "5 min",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(255, 255, 226, 157),
            ),
            width: 50,
            height: 23,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  size: 15,
                  color: Color.fromARGB(255, 255, 102, 0),
                ),
                SizedBox(width: 1),
                Text("5.0"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
