import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kisan_mitra1/editprofile.dart';
import 'package:kisan_mitra1/login.dart';


class FarmerHome extends StatefulWidget {
  @override
  _FarmerHomeState createState() => _FarmerHomeState();
}

class _FarmerHomeState extends State<FarmerHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(

      ),
      appBar: AppBar(),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.cyan,
        items: <Widget>[
          Icon(Icons.home, size: 22.5),
          Icon(Icons.receipt, size: 22.5),
          Icon(Icons.person, size: 22.5),
          Icon(Icons.person, size: 22.5),
        ],
        onTap: (index) {
          //Handle button tap

        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Farmer Name"),
              accountEmail: Text("+91 1234567890"),
              currentAccountPicture: CircleAvatar(
//                child: Text('You'),
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://thumbs.dreamstime.com/z/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg"),
                backgroundColor: Colors.transparent,
              ),
            ),
            ListTile(
              title: Text(
                'Language',
                textDirection: TextDirection.ltr,
              ),
//              subtitle: Text("English"),
              leading: Icon(Icons.language),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () async {
                final Language langName = await _asyncSimpleDialog(context);
                print("Selected Language is $langName");
              },
              subtitle: Text("English"),
            ),
            ListTile(
              title: Text(
                'Address',
                textDirection: TextDirection.ltr,
              ),
              subtitle: Text("Loation"),
              leading: Icon(Icons.location_on),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Edit Profile',
                textDirection: TextDirection.ltr,
              ),
              leading: Icon(Icons.edit),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Logout',
                textDirection: TextDirection.ltr,
              ),
              leading: Icon(Icons.logout),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
            Divider(
              height: 220.0,
            ),
            ListTile(
              title: Text(
                'Close',
                textDirection: TextDirection.ltr,
              ),
              leading: Icon(Icons.close_fullscreen),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Container(color: Colors.blueAccent),
    );
  }
}
  enum Language { English, Hindi }

Future<Language> _asyncSimpleDialog(BuildContext context) async {
  return await showDialog<Language>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Language '),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Language.English);
              },
              child: const Text('English'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Language.Hindi);
              },
              child: const Text('Hindi'),
            ),
          ],
        );
      });
}

