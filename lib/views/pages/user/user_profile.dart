import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/views/pages/login_register_page.dart';
import 'package:frontend/views/pages/tenant/tenant_widget_tree.dart';
import 'package:frontend/views/pages/user/register_tenant.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/scrollable_page_widget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return ScrollablePageWidget(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your Profile", style: TextStyle(fontSize: 24)),
          Row(
            spacing: 16,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  radius: 200,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentUserNotifier.value!.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    currentUserNotifier.value!.email,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          // GlassContainerWidget(child: Text("Update Profile")),
          GlassContainerWidget(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const RegisterTenant(),
                ),
              ),
            },
            child: Text("Register as Tenant"),
          ),
          GlassContainerWidget(
            fillColor: BeeStyle.red,
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const LoginRegisterPage(),
                ),
              ),
            },
            child: Text("Logout"),
          ),

          // Text(
          //   "General",
          //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          // ),
          // const SizedBox(height: 11),
          // GlassCardWidget(
          //   padding: EdgeInsetsGeometry.only(left: 20, top: 5),
          //   height: 30,
          //   width: double.infinity,
          //   dark: true,
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       Text(
          //         "Account Information",
          //         style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          //       ),
          //     ],
          //   ),
          // ),

          // const SizedBox(height: 11),
          // GlassCardWidget(
          //   padding: EdgeInsetsGeometry.only(left: 20, top: 5),
          //   height: 30,
          //   width: double.infinity,
          //   dark: true,
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       Text(
          //         "Settings",
          //         style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          //       ),
          //     ],
          //   ),
          // ),

          // const SizedBox(height: 20),

          // Text(
          //   "Support",
          //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          // ),
          // const SizedBox(height: 11),
          // GlassCardWidget(
          //   padding: EdgeInsetsGeometry.only(left: 20, top: 5),
          //   height: 30,
          //   width: double.infinity,
          //   dark: true,
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       Text(
          //         "Help Centre",
          //         style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          //       ),
          //     ],
          //   ),
          // ),

          // const SizedBox(height: 11),
          // GlassCardWidget(
          //   padding: EdgeInsetsGeometry.only(left: 20, top: 5),
          //   height: 30,
          //   width: double.infinity,
          //   dark: true,
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       Text(
          //         "Feedback",
          //         style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          //       ),
          //     ],
          //   ),
          // ),

          // const SizedBox(height: 20),

          // Text(
          //   "Others",
          //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          // ),
          // const SizedBox(height: 11),
          // GlassCardWidget(
          //   padding: EdgeInsetsGeometry.only(left: 20, top: 5),
          //   height: 30,
          //   width: double.infinity,
          //   dark: true,
          //   onTap: () {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute<void>(
          //         builder: (context) => const TenantWidgetTree(),
          //       ),
          //     );
          //   },
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       Text(
          //         "Register as Tenant",
          //         style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
