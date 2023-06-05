import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:injector/injector.dart';
import 'package:lottie/lottie.dart';
import 'package:password_validator/app/home/components/password_widget.dart';
import 'package:password_validator/app/home/components/passwords_filter_widget.dart';
import 'package:password_validator/app/home/controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Injector.appInstance.get<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.fetchPasswords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
          width: 200,
          height: 50,
          image: AssetImage(
            'assets/logo/logo-negative.png',
          ),
        ),
        centerTitle: true,
        elevation: 10,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () {},
            child: const FaIcon(FontAwesomeIcons.plus, size: 30),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 13),
                child: PasswordsFilterWidget(isSelected: controller.isSelected),
              ),
              ValueListenableBuilder(
                valueListenable: controller.isLoaded,
                builder: (context, isLoaded, child) {
                  return Visibility(
                    visible: isLoaded,
                    replacement: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Lottie.asset(
                        "assets/animations/progress_indicator.json",
                      ),
                    ),
                    child: Expanded(
                      child: ValueListenableBuilder(
                        valueListenable: controller.listViewLength,
                        builder: (context, length, child) {
                          return ListView.builder(
                            itemCount: length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: PasswordWidget(
                                  textPassword: controller.getPassword(index),
                                  editFunction: () {},
                                  deleteFunction: () {},
                                ),
                              );
                            }),
                          );
                        },
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
