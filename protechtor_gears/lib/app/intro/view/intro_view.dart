import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:injector/injector.dart';
import 'package:password_validator/app/home/view/home_view.dart';
import 'package:password_validator/app/intro/component/intro_dots_indicator.dart';
import 'package:password_validator/app/intro/component/page_widget.dart';
import 'package:password_validator/app/intro/controller/intro_controller.dart';
import 'package:password_validator/app/shared/theme/color%20scheme/color_scheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroView extends StatefulWidget {
  static const routeName = "intro";
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  IntroController controller = IntroController();

  Future<void> goToHome() async {
    SharedPreferences preferences = Injector.appInstance.get<SharedPreferences>();
    preferences.setBool("isFirstEntry", false);
    Navigator.of(context).pushReplacementNamed(HomeView.routeName);
  }

  @override
  void dispose() {
    controller.value.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, pageController, child) {
            return Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: controller.introContent.length,
                    onPageChanged: (newIndex) {
                      controller.newPageIndex(newIndex);
                    },
                    itemBuilder: (context, index) => PageWidget(
                      title: controller.introContent[index].title,
                      assetImage: controller.introContent[index].assetImage,
                      description: controller.introContent[index].description,
                    ),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: controller.pageIndex,
                  builder: (context, pageIndex, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      child: pageIndex != 2
                          ? Row(
                              children: [
                                const SizedBox(width: 20),
                                InkWell(
                                  onTap: goToHome,
                                  child: Text(
                                    "Pular",
                                    style: textTheme.bodySmall,
                                  ),
                                ),
                                const Expanded(
                                  child: SizedBox(),
                                ),
                                ...List.generate(
                                  controller.introContent.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: IntroDotsIndicator(
                                      isActive: index == pageIndex,
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  child: SizedBox(),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
                                  },
                                  child:
                                      const FaIcon(FontAwesomeIcons.arrowRight),
                                ),
                                const SizedBox(width: 20),
                              ],
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: goToHome,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "COMEÇAR",
                                          style: textTheme.displaySmall!
                                              .copyWith(
                                                  color: colorScheme.background,
                                                  fontSize: 35),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
