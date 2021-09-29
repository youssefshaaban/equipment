import 'package:equipment/localization/generated/l10n.dart';
import 'package:equipment/model/Equipment.dart';
import 'package:equipment/pages/custody_details.dart';
import 'package:flutter/material.dart';

class ItemCustody extends StatelessWidget {
  final Equipment equipment;

  ItemCustody({required this.equipment});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CustodyDetails.routeName);
      },
      child: Card(
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
                    S.of(context)!.itemCustodyPageReferenceNum,
                    style: TextStyle(color:Colors.blueGrey),
                  ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          equipment.id!,
                          style: TextStyle(color:Colors.blueGrey),
                        )),
                  ),
                  Text(
                    equipment.date!,
                      style: TextStyle(color:Colors.blueGrey)
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
                    S.of(context)!.itemCustodyPageTotal,
                    style: TextStyle(color:Colors.blueGrey),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      equipment.totalAmount!,
                    ),
                  )),
                  Text(S.of(context)!.itemCustodyPageSpent, style: TextStyle(color:Colors.blueGrey)),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      equipment.remianAmount!,
                        style: TextStyle(color:Colors.blueGrey)
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
