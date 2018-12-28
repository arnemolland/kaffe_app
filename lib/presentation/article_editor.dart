import 'package:flutter/material.dart';
import 'package:zefyr/zefyr.dart';
import 'package:kaffe_app/models/models.dart';

class ArticleEditor extends StatefulWidget {
  @override
  _ArticleEditorState createState() => _ArticleEditorState();
}

class _ArticleEditorState extends State<ArticleEditor> {
  ZefyrController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    final document = NotusDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    final mainEditor = ZefyrField(
      height: 250.0,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        border: InputBorder.none,
        labelStyle: TextStyle(
            color: Theme.of(context).primaryColorLight,
            fontFamily: 'Raleway',
            fontSize: 18,
            fontWeight: FontWeight.w300),
        filled: false,
        labelText: 'Body',
      ),
      controller: _controller,
      focusNode: _focusNode,
      autofocus: false,
      physics: ClampingScrollPhysics(),
    );
    final articleForm = ListView(
      children: <Widget>[
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: TextField(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              border: InputBorder.none,
              labelStyle: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontFamily: 'Raleway',
                  fontSize: 18,
                  fontWeight: FontWeight.w300),
              filled: false,
              labelText: 'Title',
            ),
          ),
        ),
        SizedBox(height: 10),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: mainEditor,
        ),
        SizedBox(
          height: 10,
        ),
        
        RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          child: Text('Post ☕', style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 18,
            
          ),),
          onPressed: () {

          },
        ),
      ],
    );
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.image, color: Theme.of(context).primaryColor),
            splashColor: Theme.of(context).primaryColorLight,
            highlightColor: Theme.of(context).primaryColorLight,
            onPressed: () {},
          )
        ],
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () => Navigator.pop(context)),
        title: Text(
          'New post',
          style: TextStyle(
              fontFamily: 'Raleway',
              color: Theme.of(context).primaryColor,
              fontSize: 18),
        ),
      ),
      body: ZefyrScaffold(
          child: Padding(
        padding: EdgeInsets.all(8),
        child: articleForm,
      )),
    );
  }
}
