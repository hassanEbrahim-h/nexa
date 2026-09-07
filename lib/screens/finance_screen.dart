import 'package:flutter/material.dart';
import '../widgets/common.dart';
class FinanceScreen extends StatelessWidget{const FinanceScreen({super.key});
 @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Finance Tracker')),body:ListView(padding:const EdgeInsets.all(18),children:[
  AppCard(child:Column(children:[const Text('Total Balance',style:TextStyle(color:Colors.grey)),const SizedBox(height:8),const Text('\$1,250',style:TextStyle(fontSize:36,fontWeight:FontWeight.bold)),const SizedBox(height:12),Row(children:const[StatTile(value:'\$1,800',label:'Income',icon:Icons.arrow_downward),SizedBox(width:10),StatTile(value:'\$550',label:'Expense',icon:Icons.arrow_upward)])])),
  const SizedBox(height:20),const SectionTitle('Recent Transactions'),
  ...['Food - \$15','Transport - \$5','Freelance + \$300','Shopping - \$40'].map((e)=>Padding(padding:const EdgeInsets.only(top:10),child:AppCard(child:ListTile(leading:const CircleAvatar(child:Icon(Icons.receipt_long)),title:Text(e),subtitle:const Text('Today')))))
 ]));
}
