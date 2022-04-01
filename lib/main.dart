import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'CardWidget';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: MyCard(),
      ),
    );
  }
}

//Creating MyCard Class
class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Card(
            elevation: 5.0,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                debugPrint('Card tapped');
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ListTile(
                    leading: Icon(
                      Icons.album,
                      color: Colors.blue,
                    ),
                    title: Text('Hashimukh'),
                    subtitle: Text('Band: Shironamhin'),
                    //isThreeLine: true,
                    trailing: Icon(
                      Icons.play_arrow_outlined,
                      color: Colors.blue,
                      size: 36.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          'Download',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          'Play Online',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Card(
            elevation: 5.0,
            borderOnForeground: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ListTile(
                  leading: Icon(
                    Icons.album,
                    color: Colors.blue,
                  ),
                  title: Text('Bohemian'),
                  subtitle: Text('Band: Shironamhin'),
                  //isThreeLine: true,
                  trailing: Icon(
                    Icons.play_arrow_outlined,
                    color: Colors.blue,
                    size: 36.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Download',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Play Online',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
