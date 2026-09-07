import 'package:flutter/material.dart';
import '../widgets/common.dart';
import 'auth_screen.dart';

class OnboardingScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  const OnboardingScreen({super.key, required this.onThemeChanged});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}
class _OnboardingScreenState extends State<OnboardingScreen> {
  int page = 0;
  final items = [
    ('Plan Your Day', 'Turn your goals into daily actions and build the life you want.', Icons.calendar_month_rounded),
    ('Track Your Habits', 'Build good habits, break bad ones, and watch your progress.', Icons.track_changes_rounded),
    ('Achieve Your Goals', 'Set your goals, track progress, and never give up.', Icons.flag_rounded),
  ];
  @override
  Widget build(BuildContext context) {
    final x=items[page];
    return Scaffold(body: SafeArea(child: Padding(
      padding: const EdgeInsets.all(28),
      child: Column(children:[
        Align(alignment: Alignment.centerRight, child: TextButton(onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder:(_)=>AuthScreen(onThemeChanged:widget.onThemeChanged))), child: const Text('Skip'))),
        const Spacer(),
        Container(height:220,width:220, decoration: BoxDecoration(shape:BoxShape.circle,color:Theme.of(context).cardColor),
          child: Icon(x.$3,size:100,color:const Color(0xFF7B61FF))),
        const SizedBox(height:42),
        Text(x.$1,style:const TextStyle(fontSize:30,fontWeight:FontWeight.bold)),
        const SizedBox(height:14),
        Text(x.$2,textAlign:TextAlign.center,style:const TextStyle(color:Colors.grey,fontSize:16)),
        const Spacer(),
        Row(mainAxisAlignment:MainAxisAlignment.center,children:List.generate(3,(i)=>AnimatedContainer(duration:const Duration(milliseconds:250),margin:const EdgeInsets.all(4),width:i==page?28:8,height:8,decoration:BoxDecoration(color:i==page?const Color(0xFF7B61FF):Colors.grey,borderRadius:BorderRadius.circular(8))))),
        const SizedBox(height:20),
        PrimaryButton(text: page==2?'Get Started':'Next', onTap:(){
          if(page<2){setState(()=>page++);} else {Navigator.pushReplacement(context,MaterialPageRoute(builder:(_)=>AuthScreen(onThemeChanged:widget.onThemeChanged)));}
        }),
      ]),
    )));
  }
}
