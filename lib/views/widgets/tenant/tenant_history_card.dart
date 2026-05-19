import 'package:flutter/material.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';

class TenantHistoryCard extends StatefulWidget {
  final int quantity;
  
  const TenantHistoryCard({
    required this.quantity,
    super.key,
    
  });
  
  @override
  State<TenantHistoryCard> createState() => _TenantHistoryCardState();
}

class _TenantHistoryCardState extends State<TenantHistoryCard> {
  @override
  Widget build(BuildContext context) {
    return GlassContainerWidget(
      // height: 100,
      padding: EdgeInsetsGeometry.all(20),
      
      child: Column(
        spacing: 5,
        children: [
          Row(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/yishonaya.png", width: 40, height: 40,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,  
                children: [
                  Text("itemName", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                  Text("${widget.quantity}x", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                ],
              )
            ],
          ),

          if (widget.quantity > 1)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("+${widget.quantity - 1} items",  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400)),
              ],
            ),
          
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: Text("Order ID: 0001", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),)),
              GlassContainerWidget(
                width: 82,
                height: 23,
                padding: EdgeInsetsGeometry.zero,
                dark: true,
                child: Center(child: Text("Done", style: TextStyle(fontSize: 10, color: Colors.black.withValues(alpha: 0.75)),)),
                onTap: () {
                  
                },
              )
            ],
          )
        ],  
      )
    );
  }
}