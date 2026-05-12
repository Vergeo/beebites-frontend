import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/tenant.dart';
import 'package:frontend/services/tenant_service.dart';

class TenantDetailHeader extends StatefulWidget {
  final int tenantId;
  const TenantDetailHeader({super.key, required this.tenantId});

  @override
  State<TenantDetailHeader> createState() => _TenantDetailHeaderState();
}

class _TenantDetailHeaderState extends State<TenantDetailHeader> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TenantService.getTenant(widget.tenantId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          Tenant tenant = snapshot.data;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tenant.tenantName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color.fromARGB(255, 255, 226, 157),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Color.fromARGB(255, 255, 102, 0),
                              ),
                              SizedBox(width: 1),
                              Text("5.0 (200)"),
                            ],
                          ),
                        ),
                        Text(
                          "See All Review",
                          style: TextStyle(
                            color: BeeStyle.lightBlack,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Image.asset(tenant.tenantLogo, width: 75, height: 75),
            ],
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        return Center(child: Text("Something went wrong. Please try again!"));
      },
    );
  }
}
