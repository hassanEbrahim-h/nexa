import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../widgets/common.dart';
class HabitScreen extends StatefulWidget{const HabitScreen({super.key});@override State<HabitScreen> createState()=>_HabitScreenState();}
class _HabitScreenState extends State<HabitScreen>{
 @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Habit Tracker')),body:ListView(padding:const EdgeInsets.all(18),children:[
  AppCard(child:Row(children:[const Icon(Icons.local_fire_department,color:Colors.orange,size:38),const SizedBox(width:12),const Expanded(child:Text('12 Days Streak',style:TextStyle(fontSize:20,fontWeight:FontWeight.bold))),Text('${habits.fold<int>(0,(a,b)=>a+b.done)}/${habits.fold<int>(0,(a,b)=>a+b.total)}')])),
  const SizedBox(height:18),
  ...habits.map((h)=>Padding(padding:const EdgeInsets.only(bottom:10),child:AppCard(child:Column(children:[Row(children:[CircleAvatar(child:Icon(h.icon)),const SizedBox(width:12),Expanded(child:Text(h.title,style:const TextStyle(fontWeight:FontWeight.bold))),Text('${h.done}/${h.total}')]),const SizedBox(height:12),LinearProgressIndicator(value:h.done/h.total,borderRadius:BorderRadius.circular(8))]))))
 ]));
}
