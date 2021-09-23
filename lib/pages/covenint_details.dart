

/*class CovenantDetails extends StatefulWidget {
  const CovenantDetails({Key? key}) : super(key: key);

  @override
  _CovenantDetailsState createState() => _CovenantDetailsState();
}

class _CovenantDetailsState extends State<CovenantDetails> {
  final List<Details> detailsList1 = detailsList;

  TextEditingController custodyNumber = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController cost = TextEditingController();
  TextEditingController residual = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController processNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.grey,
            child:SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height:MediaQuery.of(context).size.height*.2,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Custody number:',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text('value',
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
                                Text('Date:',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text('value',
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
                                Text('Cost:',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text('value',
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
                                Text('Remain amount:',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text('value',
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
                                Text('Custody number:',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text('value',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        ),
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: detailsList1.length,
                        itemBuilder: (context, index) {
                          return DetailsWidget(
                            details: detailsList1[index],
                          );
                        }),
                  ),
                ],
              ),
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){}, child: Row(
                  children: [
                    Icon(Icons.add,size: 20,color:Colors.white),
                    const SizedBox(width:2),
                    Text('Add',style: TextStyle(color:Colors.white),)
                  ],
                )),
                ElevatedButton(onPressed: (){}, child: Row(
                  children: [
                    Icon(Icons.add,size: 20,color:Colors.white),
                    const SizedBox(width:2),
                    Text('Add',style: TextStyle(color:Colors.white),)
                  ],
                )),
                ElevatedButton(onPressed: (){}, child: Row(
                  children: [
                    Icon(Icons.close,size: 20,color:Colors.white),
                    const SizedBox(width:2),
                    Text('Close',style: TextStyle(color:Colors.white),)
                  ],
                )),
              ],
            ),
          )
        ],
      )
      /*SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Custody number:',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('value',
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
                          Text('Date:',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('value',
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
                          Text('Cost:',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('value',
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
                          Text('Remain amount:',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('value',
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
                          Text('Custody number:',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('value',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blueGrey, width: 1)),
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: detailsList1.length,
                    itemBuilder: (context, index) {
                      return DetailsWidget(
                        details: detailsList1[index],
                      );
                    }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){}, child: Row(
                      children: [
                        Icon(Icons.add,size: 20,color:Colors.white),
                        const SizedBox(width:2),
                        Text('Add',style: TextStyle(color:Colors.white),)
                      ],
                    )),
                    ElevatedButton(onPressed: (){}, child: Row(
                      children: [
                        Icon(Icons.add,size: 20,color:Colors.white),
                        const SizedBox(width:2),
                        Text('Add',style: TextStyle(color:Colors.white),)
                      ],
                    )),
                    ElevatedButton(onPressed: (){}, child: Row(
                      children: [
                        Icon(Icons.add,size: 20,color:Colors.white),
                        const SizedBox(width:2),
                        Text('Add',style: TextStyle(color:Colors.white),)
                      ],
                    )),
                  ],
                ),
              )

            ],
          ),
        ),
      ),*/
    );
  }
}
*/