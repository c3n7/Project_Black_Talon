import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: new Text('John Doe'),
          accountEmail: new Text('john.doe@bandaschool.com'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            child: Text('J', style: TextStyle(color: Colors.white)),
          ),
          decoration: new BoxDecoration(
            color: Color(0xFF5B2326),
          ),
        ),
        new ListTile(
          title: new Text('Home'),
          onTap: () => Navigator.pushNamed(context, '/home'),
        ),
        new ListTile(
          title: new Text('Contractors'),
          onTap: () => Navigator.pushNamed(context, '/contractors'),
        ),
        new ListTile(
          title: new Text('Delivery'),
          onTap: () => Navigator.pushNamed(context, '/delivery'),
        ),
        new ListTile(
          title: new Text('Domestic and Teachers'),
          onTap: () => Navigator.pushNamed(context, '/domestic_and_teachers'),
        ),
        new ListTile(
          title: new Text('Garden Art'),
          onTap: () => Navigator.pushNamed(context, '/garden_art'),
        ),
        new ListTile(
          title: new Text('Item Movement'),
          onTap: () => Navigator.pushNamed(context, '/item_movement'),
        ),
        new ListTile(
          title: new Text('Keys'),
          onTap: () => Navigator.pushNamed(context, '/keys'),
        ),
        new ListTile(
          title: new Text('Receiving Parcels'),
          onTap: () => Navigator.pushNamed(context, '/receiving_parcels'),
        ),
        new ListTile(
          title: new Text('Sports'),
          onTap: () => Navigator.pushNamed(context, '/sports'),
        ),
        new ListTile(
          title: new Text('Students'),
          onTap: () => Navigator.pushNamed(context, '/students'),
        ),
        new ListTile(
          title: new Text('Visitors'),
          onTap: () => Navigator.pushNamed(context, '/visitors'),
        ),
        new ListTile(
          title: new Text('White as Snow'),
          onTap: () => Navigator.pushNamed(context, '/white_as_snow'),
        ),
      ]),
    );
  }
}
