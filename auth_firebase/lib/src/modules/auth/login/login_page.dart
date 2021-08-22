import 'package:auth_firebase/src/core/models/user_model.dart';
import 'package:auth_firebase/src/core/themes/app_colors/app_colors.dart';
import 'package:auth_firebase/src/core/themes/app_fonts/app_fonts.dart';
import 'package:auth_firebase/src/core/widgets/custom_button_widget.dart';
import 'package:auth_firebase/src/core/widgets/custom_passwordfield_widget.dart';
import 'package:auth_firebase/src/core/widgets/custom_textfield_widget.dart';
import 'package:auth_firebase/src/modules/auth/auth_controller.dart';
import 'package:auth_firebase/src/modules/home/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = AuthController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscure = true;
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
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 180),
                child: Container(
                  height: size.height * 0.3,
                  child: Column(
                    children: [
                      CustomTextFieldWidget(
                        height: 40,
                        size: size.width * 0.6,
                        controller: emailController,
                        inputType: TextInputType.emailAddress,
                        function: (value) {},
                        hint: 'Email',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: CustomPasswordfieldWidget(
                          height: 40,
                          function: (value) {},
                          hint: "Senha",
                          size: size.width * 0.6,
                          controller: passwordController,
                        ),
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
                      child: CustomButtonWidget(
                          color: AppColors.white,
                          hint: 'Entrar',
                          textStyle: AppFonts.robotobold20blue,
                          onPressed: () async {
                            var response = await controller.signin(
                                emailController.text, passwordController.text);
                            print(response);
                            var user = await UserModel(response.displayName,
                                response.email, response.uid);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (builder) => HomePage(
                                    user: user,
                                  ),
                                ));
                          }),
                    ),
                    Container(
                      width: size.width * 0.4,
                      child: CustomButtonWidget(
                        color: AppColors.darkBlue,
                        hint: 'Cadastrar',
                        textStyle: AppFonts.robotobold20,
                        onPressed: () {
                          Navigator.pushNamed(context, "/register");
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
