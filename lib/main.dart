import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum FootballSite { site1, site2 }

class _MyHomePageState extends State<MyHomePage> {
  bool valuefisrt = false;
  bool valuesecond = false;
  bool valuethird = false;
  FootballSite _site = FootballSite.site1;
  bool _loading = false;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          bottom: createTabBar(),
          centerTitle: true,
          title: const Text('My app'),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: Colors.greenAccent),
                  accountName: const Text('Adil Flutter dev'),
                  accountEmail: const Text("taipovadilgmail@!#@.com"),
                  currentAccountPicture: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: const Text("My Profile"),
                leading: const Icon(Icons.account_box_outlined),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Settings"),
                leading: const Icon(Icons.settings),
                onTap: () {},
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Game started'),
                            content: const Text('LAL - GSW'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Watch"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Close'),
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Basketball game'),
                  );
                },
              ),
            ),
            Center(
              child: Container(
                width: 300,
                height: 200,
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.blue,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.account_box_outlined, size: 45),
                        title: Text('Best player:',
                            style: TextStyle(fontSize: 20.0)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Edward',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                            Text(
                              'Agree?',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: () {}, child: const Text('Yes')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('No'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.place),
                  title: const Text('Places'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.sports_baseball),
                  title: const Text('List of games'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.account_box),
                  title: const Text('All Players'),
                  onTap: () {},
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Checkbox to mark watched games',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  CheckboxListTile(
                      title: const Text('game 1'),
                      value: valuefisrt,
                      onChanged: (bool? value) {
                        setState(() {
                          valuefisrt = value ?? false;
                        });
                      }),
                  CheckboxListTile(
                      title: const Text('game 2'),
                      value: valuesecond,
                      onChanged: (bool? value) {
                        setState(() {
                          valuesecond = value ?? false;
                        });
                      }),
                  CheckboxListTile(
                      title: const Text('game 3'),
                      value: valuethird,
                      onChanged: (bool? value) {
                        setState(() {
                          valuethird = value ?? false;
                        });
                      }),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      onPressed: () {},
                      child: const Text(
                        'Clear',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: const Text('www.footbal1.com'),
                  leading: Radio<FootballSite>(
                      value: FootballSite.site1,
                      groupValue: _site,
                      onChanged: (FootballSite? value) {
                        setState(() {
                          _site = value!;
                        });
                      }),
                ),
                ListTile(
                  title: const Text('www.footbal2.com'),
                  leading: Radio<FootballSite>(
                      value: FootballSite.site2,
                      groupValue: _site,
                      onChanged: (FootballSite? value) {
                        setState(() {
                          _site = value!;
                        });
                      }),
                )
              ],
            ),
            Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    child: _loading
                        ? const LinearProgressIndicator()
                        : const Text(
                            "Press button for downloading",
                            style: TextStyle(fontSize: 25),
                          ),
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: 30,
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _loading = !_loading;
                      });
                    },
                    tooltip: 'Download',
                    child: const Icon(Icons.cloud_download),
                  ),
                ),
              ],
            ),
            const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
                strokeWidth: 8,
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    content: Text('Hello'),
                    duration: Duration(seconds: 3),
                    action: SnackBarAction(label: 'Undo', onPressed: () {}),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text('show snackbar'),
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Table(
                      defaultColumnWidth: FixedColumnWidth(120.0),
                      border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2),
                      children: [
                        TableRow(children: [
                          Column(
                            children: [
                              Text('game', style: TextStyle(fontSize: 20.0))
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'price',
                                style: TextStyle(fontSize: 20.0),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'platform',
                                style: TextStyle(fontSize: 20.0),
                              )
                            ],
                          ),
                        ]),
                        TableRow(children: [
                          Column(
                            children: [Text('game 1')],
                          ),
                          Column(
                            children: [Text('20')],
                          ),
                          Column(
                            children: [Text('pc')],
                          )
                        ]),
                        TableRow(children: [
                          Column(
                            children: [Text('game 2')],
                          ),
                          Column(
                            children: [Text('30')],
                          ),
                          Column(
                            children: [Text('ps')],
                          )
                        ]),
                        TableRow(children: [
                          Column(
                            children: [Text('game 3')],
                          ),
                          Column(
                            children: [Text('30')],
                          ),
                          Column(
                            children: [Text('xbox')],
                          )
                        ])
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List')
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  TabBar createTabBar() {
    return const TabBar(
      tabs: [
        Row(children: [
          Icon(Icons.sports_basketball_rounded),
          SizedBox(width: 5),
          Text("Basketball")
        ]),
        Row(children: [
          Icon(Icons.sports_football_outlined),
          SizedBox(width: 5),
          Text("Footbal")
        ]),
        Row(children: [
          Icon(Icons.sports_baseball_outlined),
          SizedBox(width: 5),
          Text("Baseball")
        ]),
        Row(children: [
          Icon(Icons.sports_tennis_outlined),
          SizedBox(width: 5),
          Text("Tennis")
        ]),
        Row(
          children: [
            Icon(Icons.sports_soccer),
            SizedBox(width: 5),
            Text("Soccer")
          ],
        ),
        Row(
          children: [
            Icon(Icons.sports_golf),
            SizedBox(
              width: 5,
            ),
            Text('Golf'),
          ],
        ),
        Row(children: [
          Icon(Icons.sports_volleyball),
          SizedBox(
            width: 5,
          ),
          Text("Volleyball")
        ]),
        Row(
          children: [
            Icon(Icons.sports_cricket),
            SizedBox(
              width: 5,
            ),
            Text('Cricket'),
          ],
        ),
        Row(
          children: [
            Icon(Icons.sports_esports),
            SizedBox(
              width: 5,
            ),
            Text('Cybersport')
          ],
        ),
      ],
      isScrollable: true,
    );
  }
}
