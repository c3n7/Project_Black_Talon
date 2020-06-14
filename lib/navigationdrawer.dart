import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        // home
        new ListTile(
          leading: Icon(Icons.home),
          title: new Text('Home'),
          onTap: () => Navigator.pushNamed(context, '/home'),
        ),
        // people
        new ListTile(
          leading: Icon(Icons.people),
          title: new Text('Contractors'),
          onTap: () => Navigator.pushNamed(context, '/contractors'),
        ),
        // motorcycle
        new ListTile(
          leading: Icon(Icons.motorcycle),
          title: new Text('Delivery'),
          onTap: () => Navigator.pushNamed(context, '/delivery'),
        ),
        // Icons.work
        new ListTile(
          leading: Icon(Icons.work),
          title: new Text('Domestic and Teachers'),
          onTap: () => Navigator.pushNamed(context, '/domestic_and_teachers'),
        ),
        // local_florist
        new ListTile(
          leading: Icon(Icons.local_florist),
          title: new Text('Garden Art'),
          onTap: () => Navigator.pushNamed(context, '/garden_art'),
        ),
        // transfer_within_a_station swap_horizontal_circle
        new ListTile(
          leading: Icon(Icons.swap_horiz),
          title: new Text('Item Movement'),
          onTap: () => Navigator.pushNamed(context, '/item_movement'),
        ),
        // Icons.vpn_key
        new ListTile(
          leading: Icon(Icons.vpn_key),
          title: new Text('Keys'),
          onTap: () => Navigator.pushNamed(context, '/keys'),
        ),
        // Icons.card_giftcard local_post_office
        new ListTile(
          leading: Icon(Icons.card_giftcard),
          title: new Text('Receiving Parcels'),
          onTap: () => Navigator.pushNamed(context, '/receiving_parcels'),
        ),
        new ListTile(
          leading: FaIcon(FontAwesomeIcons.qrcode),
          title: new Text('Scan'),
          onTap: () => Navigator.pushNamed(context, '/scan_to_check_in'),
        ),
        // Icons.videogame_asset golf_course pool
        new ListTile(
          leading: Icon(Icons.pool),
          title: new Text('Sports'),
          onTap: () => Navigator.pushNamed(context, '/sports'),
        ),
        // Icons.face p child_care
        new ListTile(
          leading: Icon(Icons.child_care),
          title: new Text('Students'),
          onTap: () => Navigator.pushNamed(context, '/students'),
        ),
        // Icons.wc
        new ListTile(
          leading: Icon(Icons.wc),
          title: new Text('Visitors'),
          onTap: () => Navigator.pushNamed(context, '/visitors'),
        ),
        // spa
        new ListTile(
          leading: Icon(Icons.spa),
          title: new Text('White as Snow'),
          onTap: () => Navigator.pushNamed(context, '/white_as_snow'),
        ),
      ]),
    );
  }
}
