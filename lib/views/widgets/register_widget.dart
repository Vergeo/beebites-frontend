import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/services/auth_service.dart';
import 'package:frontend/views/pages/user/user_widget_tree.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/glass_text_field_widget.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isLoading = false;
  String? errorMessage;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void register() async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      if (password != confirmPassword) {
        throw Exception("Password doesn't matched");
      }
      final data = await AuthService.register(name, email, password);
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Register Successful"),
            backgroundColor: BeeStyle.green,
          ),
        );
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UserWidgetTree()),
      );
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
          GlassTextFieldWidget(
            hintText: "Full Name",
            controller: nameController,
          ),
          GlassTextFieldWidget(hintText: "Email", controller: emailController),
          GlassTextFieldWidget(
            hintText: "Password",
            controller: passwordController,
          ),
          GlassTextFieldWidget(
            hintText: "Confirm Password",
            controller: confirmPasswordController,
          ),
          GlassContainerWidget(
            width: double.infinity,
            borderRadius: 100,
            height: 60,
            dark: true,
            onTap: () => register(),
            child: Center(
              child: Text(
                "Register",
                style: TextStyle(color: BeeStyle.lightWhite),
              ),
            ),
          ),
          // ElevatedButton(onPressed: () {}, child: Text("Login")),
        ],
      ),
    );
  }
}
