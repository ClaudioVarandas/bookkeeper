import 'package:bookkeeper/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreen> {
  List<BottomNavigationBarItem> _items = new List();
  int _index = 0;

  @override
  //initState() is the default state or something which runs before the actual state or before the setState
  void initState() {
    super.initState();

    _items.add(BottomNavigationBarItem(icon: Icon(Icons.dashboard), title: Text('Dashboard')));
    _items.add(BottomNavigationBarItem(icon: Icon(Icons.attach_money), title: Text('Finances')));
    _items.add(BottomNavigationBarItem(icon: Icon(Icons.camera_enhance), title: Text('Scans')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        leading: PopupMenuButton(
          icon: Icon(Icons.perm_identity, color: Colors.black),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("Logout"),
                value: 0,
              ),
            ];
          },
          onSelected: (value) {
            Navigator.of(context).pushNamed(routeLogout);
          },
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Dashboard',
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.w800, color: Colors.black
          ),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.notifications_none),
            color: Colors.black,
            iconSize: 30,
            onPressed: () {
              print("pressed");
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Text("Content"),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        fixedColor: Colors.blue,
        currentIndex: _index,
        onTap: (int item) {
          _index = item;
        },
      ),
    );
  }
}
