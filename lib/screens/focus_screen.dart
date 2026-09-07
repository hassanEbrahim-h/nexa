import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/common.dart';

class FocusScreen extends StatefulWidget{const FocusScreen({super.key});@override State<FocusScreen> createState()=>_FocusScreenState();}
class _FocusScreenState extends State<FocusScreen>{
  int seconds=25*60; Timer? timer; bool running=false;
  String get time=>'${(seconds~/60).toString().padLeft(2,'0')}:${(seconds%60).toString().padLeft(2,'0')}';
  void toggle(){if(running){timer?.cancel();}else{timer=Timer.periodic(const Duration(seconds:1),(t){if(seconds>0)setState(()=>seconds--);else{t.cancel();setState(()=>running=false);}});}setState(()=>running=!running);}
  @override void dispose(){timer?.cancel();super.dispose();}
  @override Widget build(BuildContext context)=>SafeArea(child:Padding(padding:const EdgeInsets.all(22),child:Column(children:[
    const Align(alignment:Alignment.centerLeft,child:Text('Focus Mode',style:TextStyle(fontSize:28,fontWeight:FontWeight.bold))),
    const SizedBox(height:12),const Text('Pomodoro Timer',style:TextStyle(color:Colors.grey)),
    const Spacer(),
    SizedBox(width:250,height:250,child:Stack(alignment:Alignment.center,children:[
      SizedBox(width:250,height:250,child:CircularProgressIndicator(value:seconds/(25*60),strokeWidth:12,backgroundColor:Colors.white10)),
      Column(mainAxisSize:MainAxisSize.min,children:[Text(time,style:const TextStyle(fontSize:48,fontWeight:FontWeight.bold)),const Text('FOCUS',style:TextStyle(color:Colors.grey,letterSpacing:2))])
    ])),
    const SizedBox(height:50),
    Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children:[
      IconButton.filledTonal(onPressed:()=>setState(()=>seconds=25*60),icon:const Icon(Icons.refresh)),
      SizedBox(width:80,height:80,child:FloatingActionButton(onPressed:toggle,child:Icon(running?Icons.pause:Icons.play_arrow,size:35))),
      IconButton.filledTonal(onPressed:()=>setState(()=>seconds+=5*60),icon:const Icon(Icons.add)),
    ]),
    const Spacer(),
    Row(children:const[StatTile(value:'2h 45m',label:'Today',icon:Icons.today),SizedBox(width:10),StatTile(value:'18h 20m',label:'Weekly',icon:Icons.bar_chart)])
  ])));
}
