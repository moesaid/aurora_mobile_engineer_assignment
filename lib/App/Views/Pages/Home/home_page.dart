import 'package:aurora/App/Controllers/Home/home_controller.dart';
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
                  const FlutterLogo(size: 80),
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
                    onPressed: () => controller.toggleThemeMode(),
                    child: const Text('Toggle Theme Mode'),
                  ),
                  const Divider(height: 40, thickness: 0.1),
                  Text(
                    'navigate to'.capitalize!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () {
                      Get.toNamed('/counter');
                    },
                    child: const Text('Counter Page'),
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
