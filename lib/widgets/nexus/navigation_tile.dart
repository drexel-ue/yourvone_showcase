import 'package:flutter/material.dart';

class NavigationTile extends StatelessWidget {
  const NavigationTile({
    Key key,
    @required this.route,
    @required this.title,
    @required this.leading,
  }) : super(key: key);

  final String route;
  final String title;
  final Widget leading;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: leading,
        title: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      );
}
