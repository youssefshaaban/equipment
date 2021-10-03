import 'package:equipment/localization/generated/l10n.dart';
import 'package:equipment/model/Equipment.dart';
import 'package:equipment/pages/custody_details.dart';
import 'package:equipment/repositery/retrofit/model/custody/custody_data.dart';
import 'package:flutter/material.dart';

class ItemCustody extends StatelessWidget {
  final CustodyData custody;

  ItemCustody({required this.custody});

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
            buildRow(context,  S.of(context)!.itemCustodyPageReferenceNum, custody.referenceCode.toString(),),
            buildRow(context, S.of(context)!.custodyReceivingNumber, custody.receivingNumber.toString()),
            buildRow(context, S.of(context)!.custodyDetailsDate, custody.custodyDate.toString().split('T')[0]),
            buildRow(context, S.of(context)!.itemCustodyPageTotal,"${custody.totalAmount.toString()} ${S.of(context)!.currency}" ),
            buildRow(context, S.of(context)!.itemCustodyPageSpent,"${ custody.totalSpent.toString()} ${S.of(context)!.currency}"),
          ],
        ),
      ),
    );
  }

  Widget buildRow(BuildContext context,String header,String value){
    return   Padding(
      padding: EdgeInsets.all(3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(color: Colors.blueGrey),
          ),
          Expanded(
            child: Container(
                margin:
                EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  value,
                  style: TextStyle(color: Colors.blueGrey),
                )),
          ),
        ],
      ),
    );
  }
}
