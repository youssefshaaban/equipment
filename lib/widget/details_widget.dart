

import 'package:equipment/model/Details.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {

  final Details details;

  DetailsWidget({Key? key,required this.details}) : super(key: key);
  
  final List<NetworkImage> networkImage=[];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "custody number:",
                    style: Theme.of(context).textTheme.headline1,
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
             const SizedBox(height:10),
             Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Cost:",
                    style: Theme.of(context).textTheme.headline1,
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
            const SizedBox(height:10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Description:",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      details.description!,
                    ),
                  ),
                ),
                const SizedBox(height:10),
                if(networkImage.isEmpty)
                    Container(
                      height:100,
                      width:100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:Colors.grey
                      ),
                      child: Image(image: AssetImage('assets/images/bg_no_image.png'),fit: BoxFit.cover,),
                    )/*:
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: networkImage.length,
                    itemBuilder: (context,index){
                  return Container(
                    height: 100,
                    width: 100,
                    child: FadeInImage(placeholder: AssetImage(assetName), image: NetworkImage(networkImage[index]));,
                  );
                })*/
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
