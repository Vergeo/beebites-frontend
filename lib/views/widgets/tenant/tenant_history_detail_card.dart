import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';

class TenantHistoryDetailCard extends StatelessWidget {
    const TenantHistoryDetailCard({super.key});

    @override
    Widget build(BuildContext context) {
      return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          GlassContainerWidget(
            child: Row(
              // spacing: 10,
              children: [
                Expanded(child: Text("Order ID: 0001")),
                Container(
                  width: 65,
                  height: 15,
                  decoration: BoxDecoration(
                    color: BeeStyle.green,
                    borderRadius: BorderRadius.circular(7)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Icon(Icons.check, size: 10,),
                      Text("Paid", 
                        style: TextStyle(
                          fontSize: 10, 
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ),

          Text("Summary"),

          GlassContainerWidget(
            child: Column(
              spacing: 20,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Image.asset("assets/images/yishonaya.png", width: 50, height: 50,),
                    Text("1x",
                      style: TextStyle(fontSize: 12),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Original Yakiniku",
                            style: TextStyle(fontSize: 14),),
                          Text("No additional notes",
                            style: TextStyle(fontSize: 12),)
                        ],
                      ),
                    ),
                    Text("Rp 58.151",
                      style: TextStyle(
                        fontSize: 14
                      ),
                    )
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Image.asset("assets/images/yishonaya.png", width: 50, height: 50,),
                    Text("1x",
                      style: TextStyle(fontSize: 12),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Original Yakiniku",
                            style: TextStyle(fontSize: 14),),
                          Text("No additional notes",
                            style: TextStyle(fontSize: 12),)
                        ],
                      ),
                    ),
                    Text("Rp 58.151",
                      style: TextStyle(
                        fontSize: 14
                      ),
                    )
                  ],
                ),
                
              ],
            ),
          ),
          
          const Spacer(),

          GlassContainerWidget(
            child: Row(
              children: [
                Expanded(child: Text("Total")),
                Text("Rp 97.241", style: TextStyle(fontWeight: FontWeight.w600),)
              ],
            ),
          )
        ],
      );
    }
}