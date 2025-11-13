import 'package:aurora/App/Controllers/Global/theme_controller.dart';
import 'package:aurora/App/Controllers/Home/home_controller.dart';
import 'package:aurora/App/Views/Global/Organisms/build_image_card.dart';
import 'package:aurora/Helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
          body: Stack(
            children: [
              AnimatedContainer(
                duration: 500.ms,
                width: double.infinity,
                height: context.height,
                padding: EdgeInsets.all(context.width * 0.05),
                decoration: BoxDecoration(
                  gradient: controller.bgColor == null
                      ? null
                      : LinearGradient(
                          colors: [
                            ColorHelper.lighten(controller.bgColor!, 0.2),
                            ColorHelper.darken(controller.bgColor!),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                  color:
                      controller.bgColor ??
                      Theme.of(context).colorScheme.surface,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildImageCard(
                      isLoading: controller.isLoading,
                      activeImageUrl: controller.activeImageUrl,
                      setErrorState: controller.setErrorState,
                      size: context.width * 0.6,
                    ),
                    SizedBox(height: context.height * 0.05),
                    FilledButton.icon(
                      onPressed: controller.fetchRandomImage,
                      style: FilledButton.styleFrom(
                        backgroundColor: controller.bgColor == null
                            ? Theme.of(context).colorScheme.primary
                            : ColorHelper.darken(controller.bgColor!),

                        padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.1,
                          vertical: context.height * 0.015,
                        ),
                      ),
                      label: Text(
                        'Another',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: controller.bgColor != null
                              ? ColorHelper.lighten(controller.bgColor!, 0.4)
                              : Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      icon: Icon(
                        Icons.refresh,
                        size: context.width * 0.05,
                        color: controller.bgColor != null
                            ? ColorHelper.lighten(controller.bgColor!, 0.2)
                            : Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: context.height * 0.05,
                right: context.width * 0.05,
                child: IconButton(
                  onPressed: ThemeController.instance.toggleThemeMode,
                  icon: Icon(
                    Icons.brightness_4,
                    color: controller.bgColor == null
                        ? Theme.of(context).colorScheme.onSurface
                        : ColorHelper.darken(controller.bgColor!, 0.4),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
