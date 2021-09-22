import 'package:equipment/model/Equipment.dart';
import 'package:flutter/material.dart';

class ItemEquipment extends StatelessWidget {
  final Equipment equipment;

  ItemEquipment({required this.equipment});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Refrance Num",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        equipment.id!,
                      )),
                ),
                Text(
                  equipment.date!,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Total",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    equipment.totalAmount!,
                  ),
                )),
                Text("Spent", style: Theme.of(context).textTheme.headline1),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    equipment.remianAmount!,
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
