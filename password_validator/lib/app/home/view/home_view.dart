import 'package:flutter/material.dart';
import 'package:password_validator/app/home/controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.fetchPasswords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password Validator"),
        centerTitle: true,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: controller.isLoaded,
            builder: (context, isLoaded, child) {
              return Visibility(
                visible: isLoaded,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: ListView.builder(
                  itemCount: controller.passwords?.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(controller.passwords![index].password),
                      contentPadding: const EdgeInsets.all(5),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
