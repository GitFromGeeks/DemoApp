import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String username, password;
  const Home({
    required this.username,
    required this.password,
  });
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo App"),
      ),
      drawer: Drawer(
        child: Container(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(widget.username),
                accountEmail: Text("example@gmai.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
              ),
              ListTile(
                title: Text("Profile"),
                trailing: Icon(Icons.account_circle),
              ),
              ListTile(
                title: Text("settings"),
                trailing: Icon(Icons.settings),
              ),
              Divider(),
              ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.logout),
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(children: [
            Text("Welcome " + widget.username + " ! "),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text("Your password is  " + widget.password),
          ]),
        ),
      ),
    );
  }
}
