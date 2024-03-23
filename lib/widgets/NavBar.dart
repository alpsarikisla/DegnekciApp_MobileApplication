import 'package:deynekcidb/screens/BeginPage.dart';
import 'package:deynekcidb/screens/createpage.dart';
import 'package:deynekcidb/screens/ListPage.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Alp Sarıkışla"),
            accountEmail: const Text("alpsarikisla@hotmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                    'https://avatars.githubusercontent.com/u/50963484?v=4',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: NetworkImage(
                    'https://img.freepik.com/free-photo/abstract-smooth-orange-background-layout-designstudioroom-web-template-business-report-with-smooth-c_1258-54783.jpg?t=st=1709366230~exp=1709369830~hmac=e88d92fa1292dcc6542e787a3cd0c7f01f39cb081cc8cab67550345d9349b515&w=826',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Anasayfa'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const BeginPage(title: "Değnekçi App")),
                );
              }),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.add_box),
              title: const Text('Araç Ekle'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const CreatePage(title: "Araç Ekle")),
                );
              }),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Araçları Listele'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const ListPage(title: "Araçları Listele")),
              );
            },
            trailing: ClipOval(
              child: Container(
                color: Colors.orange,
                width: 20,
                height: 20,
                child: const Center(
                  child: Text(
                    '8',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
