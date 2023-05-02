import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/Cancel_task_screen.dart';
import 'package:task_manager/ui/screens/Completed_task_screen.dart';
import 'package:task_manager/ui/screens/in_progress_task_screen.dart';
import 'package:task_manager/ui/screens/new_task_screen.dart';
import 'package:task_manager/ui/widgets/user_profile_widget.dart';

class MainBottonNavbar extends StatefulWidget {
  const MainBottonNavbar({Key? key}) : super(key: key);

  @override
  State<MainBottonNavbar> createState() => _MainBottonNavbarState();
}

class _MainBottonNavbarState extends State<MainBottonNavbar> {
  int currentIndex = 0;

  final List<Widget> _screens = [
    const NewTaskScreen(),
    const CompletedTaskScreen(),
    const CancelTaskScreen(),
    const InProgressTaskScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileWidget(),
            Expanded(child: _screens[currentIndex]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black38,
        selectedFontSize: 14,
        unselectedFontSize: 10,
        showUnselectedLabels: true,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.new_label), label: "New"),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_all_outlined), label: "Completed"),
          BottomNavigationBarItem(
              icon: Icon(Icons.close_outlined), label: "Canceled"),
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle), label: "Progress"),
        ],
      ),
    );
  }
}
