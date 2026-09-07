import 'package:flutter/material.dart';
import '../widgets/common.dart';
import 'profile_screen.dart';

class AuthScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  const AuthScreen({super.key, required this.onThemeChanged});
  @override
  State<AuthScreen> createState()=>_AuthScreenState();
}
class _AuthScreenState extends State<AuthScreen>{
  bool login=true, hide=true;
  Widget field(String label,{bool pass=false})=>Padding(
    padding:const EdgeInsets.only(bottom:14),
    child:TextField(obscureText:pass&&hide,decoration:InputDecoration(
      labelText:label,border:OutlineInputBorder(borderRadius:BorderRadius.circular(14)),
      suffixIcon:pass?IconButton(icon:Icon(hide?Icons.visibility_off:Icons.visibility),onPressed:()=>setState(()=>hide=!hide)):null)));
  @override
  Widget build(BuildContext context)=>Scaffold(body:SafeArea(child:SingleChildScrollView(padding:const EdgeInsets.all(24),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    const SizedBox(height:40),
    Text(login?'Welcome Back':'Create Account',style:const TextStyle(fontSize:32,fontWeight:FontWeight.bold)),
    const SizedBox(height:8),Text(login?'Good to see you again!':'Start organizing your life today.',style:const TextStyle(color:Colors.grey)),
    const SizedBox(height:36),
    if(!login) field('Full Name'),
    field('Email or Phone'),
    field('Password',pass:true),
    if(!login) field('Confirm Password',pass:true),
    const SizedBox(height:8),
    PrimaryButton(text:login?'Login':'Sign Up',onTap:()=>Navigator.pushReplacement(context,MaterialPageRoute(builder:(_)=>ProfileScreen(onThemeChanged:widget.onThemeChanged)))),
    const SizedBox(height:16),
    Row(mainAxisAlignment:MainAxisAlignment.center,children:[
      Text(login?"Don't have an account? ":"Already have an account? "),
      TextButton(onPressed:()=>setState(()=>login=!login),child:Text(login?'Sign Up':'Login'))
    ]),
  ]))));
}
