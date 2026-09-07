import 'package:flutter/material.dart';
import '../widgets/common.dart';
class AchievementsScreen extends StatelessWidget{const AchievementsScreen({super.key});
 @override Widget build(BuildContext context){final a=[('First 7 Day Streak','Keep your streak alive!','🔥'),('Productivity Master','Complete 20 tasks','⭐'),('Focus Champion','Focus for 10 hours','🧠'),('Goal Getter','Complete 3 goals','🎯')];return Scaffold(appBar:AppBar(title:const Text('Achievements')),body:ListView(padding:const EdgeInsets.all(18),children:[
 const Text('Your Achievements',style:TextStyle(fontSize:24,fontWeight:FontWeight.bold)),const SizedBox(height:18),
 ...a.map((x)=>Padding(padding:const EdgeInsets.only(bottom:12),child:AppCard(child:ListTile(leading:Text(x.$3,style:const TextStyle(fontSize:30)),title:Text(x.$1,style:const TextStyle(fontWeight:FontWeight.bold)),subtitle:Text(x.$2),trailing:const Icon(Icons.check_circle,color:Colors.green)))))
 ]));}
}
