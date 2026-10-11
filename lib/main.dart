import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Project(),
    );
  }
}

///*    --> GridView.builder & GridView
///         (gridDelegate is required and it contains some widgets)
///*    --> GridView.count (gridDelegate is not required, but, its internal
///                        widgets all of them are available
///                        except mainAxisExtent: 200,
///                        you can call them inside
///                        the GridView.count directly)

///*     --> ListTile widget contain these properties:
///*         inThreeLine: true;
///          Whether this list tile is intended to display three lines of text.
///*         leading: Text('Leading')
///          A widget to display before the title.
///*         title:   Text('Title')
///          The primary content of the list tile.
///*         subtitle: Text('Title')
///          Additional content displayed below the title.
///*         trailing: Text('trailing')
///          A widget to display after the title.
///*         onTap: () {},
///          Called when the user taps this list tile.
///          Inoperative if [enabled] is false.
///*         onLongPress: () {},
///          Called when the user long-presses on this list tile.
///          Inoperative if [enabled] is false.
///*         enabled: true;
///          Whether this list tile is interactive.

///*         Card widget contain these properties:
///*          shape: const RoundedRectangleBorder(
///                         borderRadius:
///                             BorderRadius.only(topLeft: Radius.circular(5))),
///*          elevation: 5;
///           This controls the size of the shadow below the card.
///*          margin: const EdgeInsets.only(top: 5),
///           The empty space that surrounds the card.

///*          Icon(Icons.calendar_view_day),

class Project extends StatelessWidget {
  final List days = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

  final List weathers = [
    'Sunny',
    'Cloudy',
    'Foggy',
    'Stormy',
    'Rainy',
    'Windy',
    'Snowy'
  ];
  final List dates = [
    '05/10',
    '06/10',
    '07/10',
    '08/10',
    '09/10',
    '10/10',
    '11/10'
  ];

  Project({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        drawer: const Drawer(),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/weather.jpg'), fit: BoxFit.fill)),
          child: GridView.builder(
              padding: const EdgeInsets.only(top: 280),
              scrollDirection: Axis.vertical,
              // reverse: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 0.5,
                // crossAxisSpacing: 0,
                mainAxisExtent: 55,
                childAspectRatio: 1,
              ),
              itemCount: weathers.length + 1,
              itemBuilder: (context, index) {
                // index = weathers.length - index;
                // print(index);
                if (index == 0) {
                  return Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(5))),
                    color: const Color.fromARGB(255, 190, 209, 174),
                    child: ListTile(
                      leading: const Icon(Icons.calendar_view_day),
                      title: const Icon(Icons.wb_cloudy_outlined),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: () {},
                      onLongPress: () {},
                      // tileColor: const Color.fromARGB(135, 1, 0, 0),
                    ),
                  );
                } else {
                  return Card(
                    color: const Color.fromARGB(255, 190, 209, 174),
                    child: ListTile(
                      leading: Text(days[index - 1]),
                      title: Text(weathers[index - 1],
                          textAlign: TextAlign.center),
                      trailing: Text(dates[index - 1]),
                      onTap: () {},
                      onLongPress: () {},
                      // tileColor: const Color.fromARGB(135, 1, 0, 0),
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
