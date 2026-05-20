import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/glass_text_field_widget.dart';

class TenantEditItemPage extends StatefulWidget {
  const TenantEditItemPage({super.key});

  @override
  State<TenantEditItemPage> createState() => _TenantEditItemPageState();
}

class _TenantEditItemPageState extends State<TenantEditItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      appBar: AppBar(title: Text("Edit Product", ), backgroundColor: BeeStyle.white,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.black, Colors.transparent],
                    stops: [0.0, 0.6, 1.0], 
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  'assets/images/yishonaya.png', 
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              
              GlassContainerWidget(
                width: 105,
                height: 22,
                padding: EdgeInsets.all(0),
                child: Center(child: Text("Upload Image", style: TextStyle(fontSize: 10),), ),
                onTap: () {
                  
                },
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name"),
                  GlassTextFieldWidget(hintText: "name", controller: TextEditingController(),),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Price"),
                  GlassTextFieldWidget(hintText: "price", controller: TextEditingController(),),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Stock"),
                  GlassTextFieldWidget(hintText: "stock", controller: TextEditingController(),),
                ],
              )


            ],
          ),
        )
      ),
    );
  }
}