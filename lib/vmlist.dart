import 'package:flutter/material.dart';

class VmListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171254),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text('Sharif', style: TextStyle(color: Colors.white, fontSize: 30)),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0, top: 15.0),
            child: Transform.scale(
              scale: 2.5,
              child: IconButton(
                icon: Icon(Icons.person, color: Color(0xFFF3AF48)),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: 600,
          width: 320,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: Color(0x2FFEFCFC),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView(
            children: [
              _listItem(context, "Manage profile"),
              _listItem(context, "My measurement"),
              _listItem(context, "Change password"),
              _listItem(context, "Contact us"),
              _listItem(context, "Private policy"),
              _listItem(context, "Terms and condition"),
              _listItem(context, "Feedback"),
              _listItem(context, "Logout"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xB55952A6),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 40),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, size: 40),
            label: '3D',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 40),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _listItem(BuildContext context, String title) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage(title: title)));
          },
        ),
        Divider(color: Colors.white, thickness: 1.0,), // this will add the line
      ],
    );
  }
}

class NextPage extends StatelessWidget {
  final String title;

  NextPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}
