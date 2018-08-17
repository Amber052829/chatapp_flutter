import 'package:flutter/material.dart';
import 'chatmessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final List<ChatMessage> _messages = <ChatMessage> [];


  final TextEditingController _textController = new TextEditingController();

  void _handleSubmitted(String text){
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textComposerWidget(){
    return new IconTheme(
      data: new IconThemeData(
        color: Colors.grey,
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Flexible(child: new TextField(
              decoration: new InputDecoration.collapsed(hintText: "Send a Message"),
              controller: _textController,
              onSubmitted: _handleSubmitted,
            ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: new IconButton(icon: new Icon(Icons.send),
                  onPressed: ()=> _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            padding: const EdgeInsets.all(5.0),
            reverse: true,
            itemBuilder: (_,int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        new Divider(
          height: 1.0,
        ),
        new Container(
          decoration: new BoxDecoration(
              color: Theme.of(context).cardColor
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
