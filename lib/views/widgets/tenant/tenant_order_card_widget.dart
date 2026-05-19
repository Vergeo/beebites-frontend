import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/views/widgets/glass_card_widget.dart';

class TenantOrderCardWidget extends StatelessWidget {
  final String itemName;
  final String notes;
  final int orderId;

  
  const TenantOrderCardWidget({
    super.key,
    required this.itemName,
    required this.notes,
    required this.orderId
  });

  @override
  Widget build(BuildContext context) {
    return GlassCardWidget(
      height: 100,
      padding: EdgeInsetsGeometry.only(left: 20, right: 15, top: 10,),
      dark: true,
      child: Column(
        
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("#001", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),)
            ],
          ),
          Row(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("1x"),
              Image.asset("assets/images/yishonaya.png", width: 40, height: 40,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,  
                children: [
                  Text(itemName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                  Text(notes, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                ],
              )
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: Text(orderId.toString(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),)),
              Container(
                decoration: BoxDecoration(
                  color: BeeStyle.green,
                  borderRadius: BorderRadius.circular(7)
                ),
                width: 82,
                height: 23,
                child: Center(child: Text("Done", style: TextStyle(fontSize: 10, color: Colors.black.withValues(alpha: 0.75)),)),
              )
            ],
          )
        ],  
      )
    );
  }
}