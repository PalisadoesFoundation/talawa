import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quito/views/widgets/common_scaffold.dart';
class ResponsibilityPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return scaffold();
  }

  scaffold() => CommonScaffold(appTitle: 'Responsibility',bodyData: bodyData(),);

  bodyData(){
    return Container();
  }
}