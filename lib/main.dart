import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday/controller/navigation_controller.dart';
import 'package:holiday/ui/page/event_page.dart';
import 'package:holiday/ui/page/home_page.dart';
import 'package:holiday/ui/page/new_event_page.dart';
import 'package:holiday/ui/page/profile_page.dart';
import 'package:holiday/ui/page/user_page.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MainPage extends ConsumerWidget {
  MainPage({Key? key, required this.title}) : super(key: key);
  final String title;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final screen = [
    const HomeScreen(),
    const EventScreen(),
    const NewEventScreen(),
    const UserScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {    
    var _page = ref.watch(navigationControllerProvider).page;
    return Container(
      color: Colors.lightBlue,
      child: ClipRect(
        child: SafeArea(
          top: false,
          child: Scaffold(
              body: screen[_page],
              bottomNavigationBar: buildBottomNavigation(ref)),
        ),
      ),
    );
  }

  Widget buildBottomNavigation(WidgetRef ref) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: 0,
      height: 64.0,
      items: const <Widget>[
        Icon(Icons.home_outlined, size: 30, color: Colors.lightBlue),
        Icon(Icons.event_note_outlined, size: 30, color: Colors.lightBlue),
        Icon(Icons.add, size: 30, color: Colors.lightBlue),
        Icon(Icons.group_outlined, size: 30, color: Colors.lightBlue),
        Icon(Icons.person_outline, size: 30, color: Colors.lightBlue),
      ],
      color: Colors.grey[200]!,
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.lightBlue,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 400),
      onTap: (index) {
        ref.read(navigationControllerProvider.notifier).setPage(index);
      },
      letIndexChange: (index) => true,
    );
  }
}
