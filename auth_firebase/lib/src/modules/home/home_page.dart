import 'package:auth_firebase/src/core/models/user_model.dart';
import 'package:auth_firebase/src/core/themes/app_colors/app_colors.dart';
import 'package:auth_firebase/src/core/themes/app_fonts/app_fonts.dart';
import 'package:auth_firebase/src/modules/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserModel? user = globaUserModel;

  late final AuthController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<AuthController>();

    controller.addListener(() {
      if (controller.state == AuthState.erro) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Error')));
      } else if (controller.state == AuthState.sucess) {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuthController>();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await controller.signOut();
              },
              icon: Icon(Icons.logout))
        ],
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Home Page"),
      ),
      body: Center(
        child: Container(
          height: size.height * 0.4,
          width: size.width * 0.8,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: AppColors.blue,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 35),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.white,
                    child: Text(
                      user!.name[0],
                      style: TextStyle(fontSize: 27),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      height: size.height * 0.12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ID",
                                style: AppFonts.robotobold16,
                              ),
                              Text(
                                "NAME",
                                style: AppFonts.robotobold16,
                              ),
                              Text(
                                "EMAIL",
                                style: AppFonts.robotobold16,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user!.id,
                                style: AppFonts.abelregular14,
                              ),
                              Text(
                                user!.name,
                                style: AppFonts.abelregular14,
                              ),
                              Text(
                                user!.email,
                                style: AppFonts.abelregular14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
