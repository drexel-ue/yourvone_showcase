import 'package:flutter/material.dart';

class NavigationTile extends StatelessWidget {
  const NavigationTile({Key key, this.route, this.title, this.leading})
      : super(key: key);

  final String route;
  final String title;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
