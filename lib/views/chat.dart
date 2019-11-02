import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yourvone_showcase/auth_services/firebase_auth_service.dart';
import 'package:yourvone_showcase/auth_services/user.dart';

class Chat extends StatefulWidget {
  const Chat({Key key, this.user}) : super(key: key);

  final User user;

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _auth = FirebaseAuthService();
  final _fireStore = Firestore();
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();

  Future<void> _sendMessage() async {
    if (_messageController.text.length > 0) {
      await _fireStore.collection('messages').add({
        'message': _messageController.text,
        'from': widget.user.uid,
        'sender_name': widget.user.name,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      });
      _messageController.clear();
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 300),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Hero(
          tag: 'logo',
          child: Container(
            child: Image.asset('assets/full_logo.png'),
          ),
        ),
        title: const Text('Chat'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _fireStore.collection('messages').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());

                  final _messages = snapshot.data.documents
                      .map(
                        (DocumentSnapshot document) => Message(
                            from: document.data['sender_name'],
                            message: document.data['message'],
                            me: widget.user.uid == document.data['from'],
                            timestamp: document.data['timestamp']),
                      )
                      .toList();

                  _messages.sort((Message messageA, Message messageB) =>
                      messageA.timestamp.compareTo(messageB.timestamp));

                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        controller: _scrollController,
                        children: _messages,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              height: 50,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onSubmitted: (String value) => _sendMessage(),
                      controller: _messageController,
                      keyboardAppearance: Brightness.dark,
                      decoration: const InputDecoration(
                        hintText: 'Your thoughts here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  SendButton(
                    callback: _sendMessage,
                    text: 'send',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({Key key, this.callback, this.text}) : super(key: key);

  final VoidCallback callback;
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: FlatButton(
          onPressed: callback,
          color: Colors.teal,
          child: Text(text),
        ),
      );
}

class Message extends StatelessWidget {
  const Message({Key key, this.from, this.message, this.me, this.timestamp})
      : super(key: key);

  final String from;
  final String message;
  final bool me;
  final int timestamp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment:
              me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Text(from),
            Material(
              color: me ? Colors.teal : Colors.grey,
              borderRadius: BorderRadius.circular(10),
              elevation: 6,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text(message),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
