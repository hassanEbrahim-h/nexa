import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'planner_screen.dart';
import 'focus_screen.dart';
import 'goals_screen.dart';
import 'more_screen.dart';

class HomeShell extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  const HomeShell({super.key, required this.onThemeChanged});
  @override
  State<HomeShell> createState()=>_HomeShellState();
}
class _HomeShellState extends State<HomeShell>{
  int index=0;
  @override
  Widget build(BuildContext context){
    final pages=[
      DashboardScreen(onThemeChanged:widget.onThemeChanged),
      const PlannerScreen(),
      const FocusScreen(),
      const GoalsScreen(),
      MoreScreen(onThemeChanged:widget.onThemeChanged),
    ];
    return Scaffold(
      body:pages[index],
      bottomNavigationBar:NavigationBar(
        selectedIndex:index,onDestinationSelected:(v)=>setState(()=>index=v),
        destinations:const[
          NavigationDestination(icon:Icon(Icons.home_outlined),selectedIcon:Icon(Icons.home),label:'Home'),
          NavigationDestination(icon:Icon(Icons.calendar_today_outlined),selectedIcon:Icon(Icons.calendar_today),label:'Planner'),
          NavigationDestination(icon:Icon(Icons.timer_outlined),selectedIcon:Icon(Icons.timer),label:'Focus'),
          NavigationDestination(icon:Icon(Icons.flag_outlined),selectedIcon:Icon(Icons.flag),label:'Goals'),
          NavigationDestination(icon:Icon(Icons.grid_view_rounded),selectedIcon:Icon(Icons.grid_view),label:'More'),
        ]),
    );
  }
}
