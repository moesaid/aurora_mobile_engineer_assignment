import 'package:aurora/App/Controllers/Global/theme_controller.dart';
import 'package:aurora/App/Controllers/Home/home_controller.dart';
import 'package:aurora/App/Views/Global/Atoms/build_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('Home Page')),
          body: SafeArea(
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const BuildLogo(size: 80),
                  const SizedBox(height: 20),
                  Text(
                    'Home Page'.capitalize!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () => ThemeController.instance.toggleThemeMode(),
                    child: const Text('Toggle Theme Mode'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
