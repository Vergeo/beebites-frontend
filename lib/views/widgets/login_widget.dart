import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/services/auth_service.dart';
import 'package:frontend/services/tenant_service.dart';
import 'package:frontend/views/pages/tenant/tenant_widget_tree.dart';
import 'package:frontend/views/pages/user/user_widget_tree.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/glass_text_field_widget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String? errorMessage;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() async {
    String email = emailController.text;
    String password = passwordController.text;

    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      final data = await AuthService.login(email, password);
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login Successful"),
            backgroundColor: Colors.green,
          ),
        );
      }
      selectedPageNotifier.value = 0;
      if (currentUserNotifier.value!.role == "tenant") {
        currentTenantNotifier.value = await TenantService.getTenantByUser(
          currentUserNotifier.value!.userId,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const TenantWidgetTree()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const UserWidgetTree()),
        );
      }
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
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 428,
      child: Column(
        spacing: 32,
        children: [
          GlassTextFieldWidget(hintText: "Email", controller: emailController),
          GlassTextFieldWidget(
            hintText: "Password",
            controller: passwordController,
            obscureText: true,
          ),
          GlassContainerWidget(
            width: double.infinity,
            borderRadius: 100,
            height: 60,
            dark: true,
            onTap: () => login(),
            child: Center(
              child: Text(
                "Login",
                style: TextStyle(color: BeeStyle.lightWhite),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
