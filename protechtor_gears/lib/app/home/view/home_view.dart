import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:password_validator/app/home/components/add_edit/add_edit_pop_up_widget.dart';
import 'package:password_validator/app/home/components/delete/delete_pop_up.dart';
import 'package:password_validator/app/home/components/password_widget.dart';
import 'package:password_validator/app/home/components/passwords_filter_widget.dart';
import 'package:password_validator/app/home/controller/home_controller.dart';
import 'package:password_validator/app/home/model/credential.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const routeName = "/";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
    controller.fetchPasswords();
  }

  @override
  Widget build(BuildContext context) {
    List<Credential>? filteredCredentials = controller.filteredCredentials;
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
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AddEditPopUpWidget(
                    title: "ADICIONAR SENHA",
                    buttonPrompt: "ADICIONAR",
                    onDone: (password) {
                      controller.addCredential(
                        Credential.fromPassword(password),
                      );
                    },
                  );
                },
              );
            },
            child: const FaIcon(FontAwesomeIcons.plus, size: 30),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 13,
                ),
                child: PasswordsFilterWidget(
                  isSelected: controller.isSelected,
                  controller: controller,
                ),
              ),
              Visibility(
                visible: filteredCredentials != null,
                replacement: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Lottie.asset(
                    "assets/animations/progress_indicator.json",
                  ),
                ),
                child: Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await controller.fetchPasswords();
                    },
                    child: ListView.builder(
                      itemCount: filteredCredentials != null
                          ? filteredCredentials.length + 1
                          : 0,
                      itemBuilder: ((context, index) {
                        if (index == filteredCredentials!.length) {
                          return const SizedBox(height: 150);
                        }
                        Credential credential = filteredCredentials[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: PasswordWidget(
                            controller: controller,
                            textPassword: credential.password,
                            editFunction: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AddEditPopUpWidget(
                                    title: "EDITAR SENHA",
                                    buttonPrompt: "EDITAR",
                                    password: credential.password,
                                    onDone: (password) {
                                      controller.editCredential(
                                        oldCredential: credential,
                                        newCredential: credential.copyWith(
                                          password: password,
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            deleteFunction: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return DeletePopUp(
                                    password: credential.password,
                                    delete: () {
                                      controller.deleteCredential(credential);
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
