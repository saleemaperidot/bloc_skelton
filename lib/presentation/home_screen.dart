import 'package:bloc_skel/presentation/home.dart';
import 'package:bloc_skel/presentation/people.dart';
import 'package:bloc_skel/presentation/shope.dart';
import 'package:flutter/material.dart';

ValueNotifier bottomnavigationNotifiier = ValueNotifier(0);

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final pages = const [Home(), People(), Shope()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("bloc skelton"),
      ),
      body: ValueListenableBuilder(
        valueListenable: bottomnavigationNotifiier,
        builder: (context, value, child) {
          return SafeArea(child: pages[value]);
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: bottomnavigationNotifiier,
        builder: (context, value, child) {
          return BottomNavigationBar(
              currentIndex: value,
              onTap: (index) {
                bottomnavigationNotifiier.value = index;
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: "home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), label: "people"),
                BottomNavigationBarItem(icon: Icon(Icons.shop), label: "shop")
              ]);
        },
      ),
    );
  }
}
