import 'dart:convert';
import 'dart:io';

import 'package:equipment/features/detail_custody/edit_operation_details.dart';
import 'package:equipment/localization/generated/l10n.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/custody_operation_.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils.dart';

class ItemPurchaseDetailsWidget extends StatelessWidget {
  final CustodyOper details;
  final Function clickDelete;
  final Function clickEdit;
  final int custodyStatus;
  ItemPurchaseDetailsWidget({Key? key, required this.details,required this.clickDelete,required this.clickEdit,required this.custodyStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context)!.invoiceNumber} : ",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        details.invoiceNumber == null
                            ? ""
                            : details.invoiceNumber.toString(),
                      )),
                ),
                custodyStatus==1?
                IconButton(
                    onPressed: () {
                      //Navigator.of(context).pushNamed(EditCustodyDetails( amount: details.operAmount.toString(), description: details.operDetails, images: details.images))
                      //Navigator.of(context).pushNamed(EditCustodyDetails.routeName,arguments: {'details':details});
                      clickEdit(details);
                    },
                    icon: Icon(Icons.edit,color: Colors.cyan,)):Container(),
                custodyStatus==1?IconButton(
                    onPressed: () {
                      //   showDeleteAlert(context,list,index);
                      clickDelete(details);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )):Container(),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "${S.of(context)!.custodyDetailsDate} : ",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  details.OperDate!.split('T')[0],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context)!.itemPurchaseDescription} : ",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      details.operDetails!,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  S.of(context)!.itemPurchaseCost,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      "${details.operAmount.toString()} ${S.of(context)!.currency}",
                    ),
                  ),
                ),
              ],
            ),
            details.images != null && details.images!.isNotEmpty
                ? Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: details.images!.length,
                        itemBuilder: (context, index) {
                          return details.images!.isNotEmpty
                              ? Container(
                                  height: 60,
                                  width: 70,
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: FadeInImage(
                                        image: NetworkImage(
                                            details.images![index].imageData),
                                        placeholder: AssetImage(
                                            "assets/images/bg_no_image.png"),
                                        imageErrorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                              'assets/images/bg_no_image.png',
                                              fit: BoxFit.cover);
                                        },
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                )
                              : Container();
                        }),
                  )
                : SizedBox(
                    height: 3,
                  ),
          ],
        ),
      ),
    );
  }
}
