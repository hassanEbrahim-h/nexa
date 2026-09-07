import 'package:flutter/material.dart';
import '../widgets/common.dart';
class SettingsScreen extends StatefulWidget{final ValueChanged<bool> onThemeChanged;const SettingsScreen({super.key,required this.onThemeChanged});@override State<SettingsScreen> createState()=>_SettingsScreenState();}
class _SettingsScreenState extends State<SettingsScreen>{bool dark=true,notifications=true;
 @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Settings')),body:ListView(padding:const EdgeInsets.all(18),children:[
 const AppCard(child:ListTile(leading:CircleAvatar(child:Icon(Icons.person)),title:Text('Hassan Ibrahim'),subtitle:Text('Your Life. Organized.'))),
 const SizedBox(height:18),
 AppCard(padding:EdgeInsets.zero,child:Column(children:[
  SwitchListTile(value:dark,onChanged:(v){setState(()=>dark=v);widget.onThemeChanged(v);},title:const Text('Dark Mode'),secondary:const Icon(Icons.dark_mode)),
  const Divider(height:1),
  SwitchListTile(value:notifications,onChanged:(v)=>setState(()=>notifications=v),title:const Text('Notifications'),secondary:const Icon(Icons.notifications)),
  const Divider(height:1),
  const ListTile(leading:Icon(Icons.lock),title:Text('Privacy & Security'),trailing:Icon(Icons.chevron_right)),
  const ListTile(leading:Icon(Icons.storage),title:Text('Data & Storage'),trailing:Icon(Icons.chevron_right)),
  const ListTile(leading:Icon(Icons.help_outline),title:Text('Help & Support'),trailing:Icon(Icons.chevron_right)),
 ]))
 ]));}

