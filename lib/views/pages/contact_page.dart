import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quito/views/widgets/common_scaffold.dart';

class ContactPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return scaffold();
  }

  scaffold() => CommonScaffold(appTitle: 'Contact',bodyData: bodyData(),);

  bodyData(){
    return Container();
  }
}