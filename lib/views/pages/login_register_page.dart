import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:animated_toggle/animated_toggle.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/login_widget.dart';
import 'package:frontend/views/widgets/register_widget.dart';
import 'package:frontend/views/widgets/scrollable_page_widget.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  List<Widget> widgets = [LoginWidget(), RegisterWidget()];
  int currentWidget = 0;

  @override
  Widget build(BuildContext context) {
    return ScrollablePageWidget(
      child: Container(
        color: BeeStyle.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset("assets/images/beebites_white.png"),
              ),
              GlassContainerWidget(
                padding: EdgeInsetsGeometry.all(0),
                borderRadius: 100,
                dark: true,
                child: AnimatedHorizontalToggle(
                  background: Color.fromRGBO(0, 0, 0, 0),
                  activeColor: const Color.fromRGBO(255, 255, 255, 0.2),
                  activeBorder: Border.all(
                    color: const Color.fromRGBO(255, 255, 255, 0.5),
                    width: 1,
                  ),
                  activeTextStyle: TextStyle(color: BeeStyle.lightWhite),
                  inActiveTextStyle: TextStyle(color: BeeStyle.lightWhite),
                  taps: ["Login", "Register"],
                  radius: 200,
                  activeButtonRadius: 200,
                  width: 300,
                  height: 50,
                  duration: Duration(milliseconds: 30),
                  onChange: (int currentIndex, int targetIndex) {
                    setState(() {
                      currentWidget = targetIndex;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 64),
                child: widgets[currentWidget],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
