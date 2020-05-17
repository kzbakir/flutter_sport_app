import 'package:flutter/material.dart';
import 'package:flutter_sport_app/domain/workout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            title: Text('Jas Orda'),
            leading: Icon(Icons.fitness_center),
          ),
          body: WorkoutList(),
        ));
  }
}

class WorkoutList extends StatelessWidget {
  final workouts = <Workout>[
    Workout(
        title: 'Test1',
        author: 'Aidyn',
        description: 'This test',
        level: 'Beginner'),
    Workout(
        title: 'Test2',
        author: 'Janel',
        description: 'This test',
        level: 'Elementary'),
    Workout(
        title: 'Test3',
        author: 'Ernar',
        description: 'This test',
        level: 'Intermediate'),
    Workout(
        title: 'Test4',
        author: 'Tima',
        description: 'This test',
        level: 'Advanced'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          itemBuilder: (context, i) {
            return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                decoration:
                BoxDecoration(color: (Color.fromRGBO(50, 65, 85, 0.9))),
                child: ListTile(
                  title: Text(workouts[i].title,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.title.color,
                          fontWeight: FontWeight.bold)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(Icons.fitness_center,
                        color: Theme.of(context).textTheme.title.color),
                    decoration: BoxDecoration(
                        border: Border(
                            right:
                            BorderSide(width: 1, color: Colors.white24))),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right,
                      color: Theme.of(context).textTheme.title.color),
                  subtitle: subtitle(context, workouts[i]),
                ),
              ),
            );
          },
          itemCount: workouts.length,
        ),
      ),
    );
  }
}

Widget subtitle(BuildContext context, Workout workout) {
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch (workout.level) {
    case 'Beginner':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case 'Elementary':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;
    case 'Intermediate':
      color = Colors.orange;
      indicatorLevel = 0.86;
      break;
    case 'Advanced':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }
  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
            backgroundColor: Theme.of(context).textTheme.title.color,
            value: indicatorLevel,
            valueColor: AlwaysStoppedAnimation(color)),
      ),
      SizedBox(width: 10),
      Expanded(
          flex: 3,
          child: Text(workout.level,style: TextStyle(color: Theme.of(context).textTheme.title.color),
          ))
    ],
  );
}