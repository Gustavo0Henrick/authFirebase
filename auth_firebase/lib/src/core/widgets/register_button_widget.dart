import 'package:auth_firebase/src/core/themes/app_colors/app_colors.dart';
import 'package:auth_firebase/src/core/themes/app_fonts/app_fonts.dart';
import 'package:auth_firebase/src/modules/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterButtonWidget extends StatefulWidget {
  final email;
  final password;
  final name;
  final confirmed;
  const RegisterButtonWidget(
      {Key? key, this.email, this.password, this.name, this.confirmed})
      : super(key: key);

  @override
  _RegisterButtonWidgetState createState() => _RegisterButtonWidgetState();
}

class _RegisterButtonWidgetState extends State<RegisterButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuthController>();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColors.darkBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: controller.state == AuthState.loading
          ? null
          : () {
              if (widget.password == widget.confirmed) {
                controller.signup(widget.email, widget.password, widget.name);
              } else {
                print('Password and Confirmed Password Invalid');
              }
            },
      child: const Text(
        'Cadastrar',
        style: AppFonts.robotobold20,
      ),
    );
  }
}
