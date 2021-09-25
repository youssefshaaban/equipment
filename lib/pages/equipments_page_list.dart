import 'package:equipment/model/Equipment.dart';
import 'package:equipment/widget/item_custody.dart';
import 'package:flutter/material.dart';

class EquipmentPageList extends StatelessWidget {
  final List<Equipment> list = getData();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return ItemCustody(
              equipment: list[index],
            );
          },
          itemCount: list.length,
        ),
    );
  }
}
