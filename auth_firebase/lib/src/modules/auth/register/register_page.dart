import 'package:auth_firebase/src/core/themes/app_colors/app_colors.dart';
import 'package:auth_firebase/src/core/themes/app_fonts/app_fonts.dart';
import 'package:auth_firebase/src/core/widgets/custom_button_widget.dart';
import 'package:auth_firebase/src/core/widgets/custom_passwordfield_widget.dart';
import 'package:auth_firebase/src/core/widgets/custom_textfield_widget.dart';
import 'package:auth_firebase/src/core/widgets/register_button_widget.dart';
import 'package:auth_firebase/src/modules/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmedController = TextEditingController();
  bool obscure = true;

  late final AuthController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<AuthController>();

    controller.addListener(() {
      if (controller.state == AuthState.erro) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Erro no Cadastro')));
      } else if (controller.state == AuthState.sucess) {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.blue,
        elevation: 0,
        centerTitle: true,
        title: Text("Register Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height * 0.9,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Container(
                  height: size.height * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextFieldWidget(
                        height: 40,
                        size: size.width * 0.6,
                        controller: nameController,
                        inputType: TextInputType.name,
                        function: (value) {},
                        hint: 'Nome',
                      ),
                      CustomTextFieldWidget(
                        height: 40,
                        size: size.width * 0.6,
                        controller: emailController,
                        inputType: TextInputType.emailAddress,
                        function: (value) {},
                        hint: 'Email',
                      ),
                      CustomPasswordfieldWidget(
                        height: 40,
                        function: (value) {},
                        hint: "Senha",
                        size: size.width * 0.6,
                        controller: passwordController,
                      ),
                      CustomPasswordfieldWidget(
                        height: 40,
                        function: (value) {},
                        hint: "Confirme a Senha",
                        size: size.width * 0.6,
                        controller: confirmedController,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: size.height * 0.3,
                child: Column(
                  children: [
                    Container(
                        width: size.width * 0.4,
                        child: RegisterButtonWidget(
                          email: emailController.text,
                          password: passwordController.text,
                          confirmed: confirmedController.text,
                          name: nameController.text,
                        )),
                    Container(
                      width: size.width * 0.4,
                      child: CustomButtonWidget(
                        color: AppColors.white,
                        hint: 'Cancelar',
                        textStyle: AppFonts.robotobold20red,
                        onPressed: () {
                          Navigator.pushNamed(context, "/login");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
