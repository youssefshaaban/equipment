import 'package:equipment/localization/generated/l10n.dart';
import 'package:equipment/model/Details.dart';
import 'package:equipment/features/purchase/purchase_process.dart';
import 'package:equipment/repositery/retrofit/model/custody/custody_data.dart';
import 'package:equipment/widget/item_purchase_details_widget.dart';
import 'package:flutter/material.dart';

class CustodyDetails extends StatelessWidget {
  static const routeName = '/custodyDetailsRouteName';


  final List<Details> detailsList1 = detailsList;


  @override
  Widget build(BuildContext context) {
    final routesArgument=ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    CustodyData data = routesArgument['data'];
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context)!.custodyDetailsAppBarTitle),
        ),
        body: Stack(
          children: [
            Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildCardInfo(context,data.custodyStatus.toString(),data.custodyDate!,data.totalAmount.toString(),data.totalAmount.toString()),
                      Container(
                        height: MediaQuery.of(context).size.height * .62,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: detailsList1.length,
                            itemBuilder: (context, index) {
                              return ItemPurchaseDetailsWidget(
                                details: detailsList1[index],
                              );
                            }),
                      ),
                    ],
                  ),
                )),

            buildAlign(data.custodyStatus!, context,data.custodyId)


          ],
        ));
  }

  Widget buildCardInfo(BuildContext context,String custodyNumber,String date,String cost,String remainAmount,) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  S.of(context)!.custodyDetailsCustodyNumber,
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(custodyNumber,

                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(S.of(context)!.custodyDetailsDate,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 5,
                ),
                Text(date,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(S.of(context)!.custodyDetailsCost,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 5,
                ),
                Text(cost,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(S.of(context)!.custodyDetailsRemainAmount,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 5,
                ),
                Text(remainAmount,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(S.of(context)!.custodyDetailsCustodyNumber1,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 5,
                ),
                Text(S.of(context)!.custodyDetailsValue5,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAlign(int status,BuildContext context,int custodyId){
    if(status==1){
      return  Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: ElevatedButton.icon(
                  icon: Icon(
                      Icons.add, size: 20, color: Colors.white),
                  label: Text(
                    S.of(context)!.custodyDetailsAddButton,
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(PurchaseProcess.routeName,arguments: {'custodyId':custodyId});
                  },
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton.icon(
                icon: Icon(Icons.add, size: 20, color: Colors.white),
                label: Text(
                  S.of(context)!.custodyDetailsRaisingButton,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                      Icons.close, size: 20, color: Colors.white),
                  label: Text(
                    S.of(context)!.custodyDetailsCloseButton,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }else if(status==0){
      return Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(

                  child: Text(
                    S.of(context)!.custodyDetailsAddButton,
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(PurchaseProcess.routeName);
                  },
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                child: Text(
                  S.of(context)!.custodyDetailsRaisingButton,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),

          ],
        ),
      );
    }else{
      return Container();
    }
  }
}
