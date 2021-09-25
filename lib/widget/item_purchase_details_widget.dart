import 'package:equipment/model/Details.dart';
import 'package:flutter/material.dart';

class ItemPurchaseDetailsWidget extends StatelessWidget {
  final Details details;

  ItemPurchaseDetailsWidget({Key? key, required this.details}) : super(key: key);

  final List<String> networkImage = ["","","","","","","","",""];

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
                  "Custody number : ",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline1,
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        details.custodyNumber.toString(),
                      )),
                ),
                Text(
                  details.date.toString(),
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Description:",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline1,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      details.description!,
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
                  "Cost:",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline1,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      details.cost.toString(),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: networkImage.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 60,
                      width: 70,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FadeInImage(
                          image: NetworkImage(networkImage[index]),
                          placeholder: AssetImage("assets/images/bg_no_image.png"),
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/images/bg_no_image.png',
                                fit: BoxFit.cover);
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
