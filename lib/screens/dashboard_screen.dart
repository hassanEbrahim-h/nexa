import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../widgets/common.dart';

class DashboardScreen extends StatefulWidget{
  final ValueChanged<bool> onThemeChanged;
  const DashboardScreen({super.key,required this.onThemeChanged});
  @override State<DashboardScreen> createState()=>_DashboardScreenState();
}
class _DashboardScreenState extends State<DashboardScreen>{
  @override Widget build(BuildContext context)=>SafeArea(child:SingleChildScrollView(padding:const EdgeInsets.all(18),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    Row(children:[Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Text('Hello, ${AppData.userName.split(" ").first} 👋',style:const TextStyle(fontSize:24,fontWeight:FontWeight.bold)),
      const Text('Let’s make today productive!',style:TextStyle(color:Colors.grey))
    ])),const CircleAvatar(child:Icon(Icons.person))]),
    const SizedBox(height:22),
    Container(width:double.infinity,padding:const EdgeInsets.all(20),decoration:BoxDecoration(
      gradient:const LinearGradient(colors:[Color(0xFF27265B),Color(0xFF15354B)]),borderRadius:BorderRadius.circular(24)),
      child:Row(children:[
        SizedBox(width:110,height:110,child:Stack(alignment:Alignment.center,children:[
          CircularProgressIndicator(value:.82,strokeWidth:10,backgroundColor:Colors.white12,color:Colors.amber),
          Text('${AppData.lifeScore}',style:const TextStyle(fontSize:30,fontWeight:FontWeight.bold))
        ])),
        const SizedBox(width:18),const Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
          Text('Life Score',style:TextStyle(color:Colors.white70)),
          Text('82 / 100',style:TextStyle(fontSize:26,fontWeight:FontWeight.bold)),
          SizedBox(height:8),Text('Great progress! Keep going 🚀',style:TextStyle(color:Colors.greenAccent))
        ]))
      ])),
    const SizedBox(height:18),
    Row(children:const[
      StatTile(value:'5/8',label:'Tasks',icon:Icons.check_circle_outline),
      SizedBox(width:8),StatTile(value:'4/5',label:'Habits',icon:Icons.local_fire_department),
      SizedBox(width:8),StatTile(value:'2/4',label:'Goals',icon:Icons.flag_outlined),
      SizedBox(width:8),StatTile(value:'3h',label:'Focus',icon:Icons.timer_outlined),
    ]),
    const SizedBox(height:24),const SectionTitle("Today's Tasks",action:'See All'),
    const SizedBox(height:12),
    ...tasks.take(3).map((t)=>Padding(padding:const EdgeInsets.only(bottom:10),child:AppCard(child:Row(children:[
      CircleAvatar(child:Icon(t.icon,size:18)),const SizedBox(width:12),
      Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(t.title,style:const TextStyle(fontWeight:FontWeight.bold)),Text(t.time,style:const TextStyle(color:Colors.grey,fontSize:12))])),
      Checkbox(value:t.done,onChanged:(v)=>setState(()=>t.done=v??false))
    ])))),
  ])));
}
