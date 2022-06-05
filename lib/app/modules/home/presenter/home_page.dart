import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconly/iconly.dart';

import '../../../core/constants/strings.dart';
import 'controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homeController = Modular.get<HomeController>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.homeTitle,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  IconButton(
                    icon: Icon(
                      IconlyLight.logout,
                      color: Theme.of(context).primaryColorDark,
                      size: 28,
                    ),
                    onPressed: () async => await homeController.handleLogout(),
                  )
                ],
              ),
              SizedBox(height: size.height * 0.04),
              ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      width: double.infinity,
                      height: size.height * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).dialogBackgroundColor.withOpacity(0.5),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
