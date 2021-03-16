import 'package:flutter/material.dart';

const MAX_MEALS = 5;

class Nutrition extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function updateData;
  final int goal;
  final int count;

  const Nutrition({
    Key key,
    @required this.name,
    @required this.icon,
    @required this.count,
    this.goal,
    this.updateData,
  }) : super(key: key);

  Color getCorrectColor() {
    if (goal == null) return Colors.white;
    if (count == goal) return Colors.greenAccent;
    if (count > goal) return Colors.redAccent;
    return Colors.yellowAccent; // Under the goal
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 50.0,
        child: GestureDetector(
          onLongPress: () {
            updateData(0);
          },
          onTap: () {
            int tempCount = count + 1;
            updateData(tempCount % MAX_MEALS);
          },
          child: Card(
            elevation: 15.0,
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Icon(icon, color: Colors.white, size: 20.0),
                  Text(name),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          count.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w800,
                            color: getCorrectColor(),
                          ),
                        ),
                      ),
                      goal == null
                          ? Container()
                          : Text(
                              "(${goal.toString()})",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
