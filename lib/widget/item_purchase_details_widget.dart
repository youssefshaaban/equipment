import 'dart:convert';
import 'dart:io';

import 'package:equipment/localization/generated/l10n.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/custody_operation_.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils.dart';

class ItemPurchaseDetailsWidget extends StatefulWidget {
  final CustodyOper details;

  ItemPurchaseDetailsWidget({Key? key, required this.details}) : super(key: key);

  @override
  State<ItemPurchaseDetailsWidget> createState() => _ItemPurchaseDetailsWidgetState();
}

class _ItemPurchaseDetailsWidgetState extends State<ItemPurchaseDetailsWidget> {

  TextEditingController cost= TextEditingController();
  TextEditingController amount= TextEditingController();
  TextEditingController desc= TextEditingController();


  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.all(50),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context)!.invoiceNumber} : ",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline1,
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                          widget.details.invoiceNumber==null? "":widget.details.invoiceNumber.toString(),
                      )),
                ),
                Text(
                  widget.details.OperDate!.split('T')[0],
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context)!.itemPurchaseDescription} ",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline1,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      widget.details.operDetails!,
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
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline1,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      "${widget.details.operAmount.toString()} ${S.of(context)!.currency}",
                    ),
                  ),
                ),
              ],
            ),
            widget.details.images!=null&&widget.details.images!.isNotEmpty?
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.details.images!.length,
                  itemBuilder: (context, index) {
                    return widget.details.images!.isNotEmpty? Container(
                      height: 60,
                      width: 70,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            image: NetworkImage(widget.details.images![index].imageData),
                            placeholder: AssetImage("assets/images/bg_no_image.png"),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset('assets/images/bg_no_image.png',
                                  fit: BoxFit.cover);
                            },
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ):
                        Container();
                  }),
            ):SizedBox(height: 3,),
          ],
        ),
      ),
    );
  }



  void deleteProcess(){

  }

  void editData() {

  }




}
