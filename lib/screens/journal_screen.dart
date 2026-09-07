import 'package:flutter/material.dart';
import '../widgets/common.dart';
class JournalScreen extends StatefulWidget{const JournalScreen({super.key});@override State<JournalScreen> createState()=>_JournalScreenState();}
class _JournalScreenState extends State<JournalScreen>{int mood=0;final c=TextEditingController();
 @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Daily Journal')),body:Padding(padding:const EdgeInsets.all(18),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
 const Text('How was your day?',style:TextStyle(fontSize:24,fontWeight:FontWeight.bold)),const SizedBox(height:18),
 AppCard(child:TextField(controller:c,maxLines:8,decoration:const InputDecoration(border:InputBorder.none,hintText:'What happened today?'))),
 const SizedBox(height:20),const Text('How are you feeling?'),
 const SizedBox(height:12),Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children:List.generate(5,(i){const em=['😄','😊','😐','😔','😫'];return GestureDetector(onTap:()=>setState(()=>mood=i),child:Container(padding:const EdgeInsets.all(10),decoration:BoxDecoration(color:mood==i?Colors.deepPurple:Colors.transparent,borderRadius:BorderRadius.circular(16)),child:Text(em[i],style:const TextStyle(fontSize:28))));})),
 const Spacer(),PrimaryButton(text:'Save Entry',onTap:()=>ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Journal entry saved locally for this session!'))))
 ])));
}
