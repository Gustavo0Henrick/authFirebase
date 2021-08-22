import 'package:auth_firebase/src/core/models/user_model.dart';
import 'package:auth_firebase/src/core/themes/app_colors/app_colors.dart';
import 'package:auth_firebase/src/core/themes/app_fonts/app_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final UserModel? user;
  HomePage({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, "/login");
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
                      '${user!.name[0]}',
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
