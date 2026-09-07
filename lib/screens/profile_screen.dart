import 'package:flutter/material.dart';
import '../widgets/common.dart';
import '../data/app_data.dart';
import 'home_shell.dart';

class ProfileScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  const ProfileScreen({super.key, required this.onThemeChanged});
  @override
  State<ProfileScreen> createState()=>_ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen>{
  final controller=TextEditingController(text:'Hassan Ibrahim');
  @override
  Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Create Your Profile')),body:Padding(
    padding:const EdgeInsets.all(24),child:Column(children:[
      const SizedBox(height:20),
      const CircleAvatar(radius:55,child:Icon(Icons.person,size:55)),
      const SizedBox(height:28),
      TextField(controller:controller,decoration:const InputDecoration(labelText:'Full Name',border:OutlineInputBorder())),
      const SizedBox(height:16),
      const TextField(decoration:InputDecoration(labelText:'What is your main goal?',border:OutlineInputBorder())),
      const Spacer(),
      PrimaryButton(text:'Continue to NEXA',icon:Icons.arrow_forward,onTap:(){
        AppData.userName=controller.text.isEmpty?'Hassan Ibrahim':controller.text;
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(_)=>HomeShell(onThemeChanged:widget.onThemeChanged)));
      }),
    ])));
}
