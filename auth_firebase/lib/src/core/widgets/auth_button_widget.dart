import 'package:auth_firebase/src/core/themes/app_colors/app_colors.dart';
import 'package:auth_firebase/src/core/themes/app_fonts/app_fonts.dart';
import 'package:auth_firebase/src/modules/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthButtonWidget extends StatefulWidget {
  final email;
  final password;
  const AuthButtonWidget({Key? key, this.email, this.password})
      : super(key: key);

  @override
  _AuthButtonWidgetState createState() => _AuthButtonWidgetState();
}

class _AuthButtonWidgetState extends State<AuthButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuthController>();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: controller.state == AuthState.loading
          ? null
          : () {
              controller.signin(widget.email, widget.password);
            },
      child: const Text(
        'Entrar',
        style: AppFonts.robotobold20blue,
      ),
    );
  }
}
