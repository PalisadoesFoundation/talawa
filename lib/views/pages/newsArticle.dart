import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:talawa/utils/uidata.dart';

class NewsArticle extends StatefulWidget {
  NewsArticle({Key key}) : super(key: key);

  @override
  _NewsArticleState createState() => _NewsArticleState();
}

class _NewsArticleState extends State<NewsArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(lipsum.createWord(numWords: 4).toString()),
              background: FittedBox(
                child: Image.asset(UIData.shoppingImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverToBoxAdapter(
        child:Text(lipsum.createWord(numWords: 200).toString()),
        ),
      ),
            SliverToBoxAdapter(
        child: 
          Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.chat),
                title: Text('0 Comments'),
              ),
          ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(UIData.pkImage),
                      
                    ),
                    title:  TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        hintText: 'Leave a Comment')
                        ),
                  )
            ],
          )
        
          
        ),

        ],
      ),
    );
  }
}
