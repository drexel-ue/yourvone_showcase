import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourvone_showcase/blocs/notification_bloc.dart';
import 'package:yourvone_showcase/events/notification_event.dart';

class PushNotis extends StatelessWidget {
  const PushNotis({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notiBloc = Provider.of<NotificationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Hero(
          tag: 'logo',
          child: Image.asset('assets/full_logo.png'),
        ),
        title: const Text('Push Notifications'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<String>(
              stream: notiBloc.permissionStream,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return ListTile(
                  leading: Icon(snapshot.hasData
                      ? Icons.notifications_active
                      : Icons.notifications_off),
                  title: Text(snapshot.hasData
                      ? 'Disable Push Notifications'
                      : 'Enable Push Notifications'),
                  trailing: Switch.adaptive(
                    value: snapshot.hasData,
                    onChanged: (bool value) {
                      notiBloc.eventSubject.add(
                          snapshot.hasData ? RevokePermission() : Initialize());
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
