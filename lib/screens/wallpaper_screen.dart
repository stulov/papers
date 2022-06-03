import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';

class WallpaperScreen extends StatelessWidget {
  const WallpaperScreen({Key? key}) : super(key: key);

  static Page page(Wallpaper wallpaper) {
    return MaterialPage(
        name: PapersPages.wallpaper,
        key: ValueKey(PapersPages.wallpaper),
        child: const WallpaperScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Wallpaper Screen')),
    );
  }
}
