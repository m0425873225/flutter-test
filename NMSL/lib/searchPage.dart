import 'package:flutter/material.dart';

class PersonPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Currency',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Market Cap/24h',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Price/24h',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.white,
            height: 10,
          ),
          Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                    ),
                  ],
                ),
              ))
          /*ListView.builder(
                  shrinkWrap: true,
                  itemCount: this.blockchaindata.length,
                  itemBuilder: (context,index){
                    return Container(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child:Column(
                              children: [
                                Text('${blockchaindata[index].symbol}',style: TextStyle(color:Colors.white,fontSize: 17),),
                              ],
                            ),
                          ),
                          Container(
                            child: Text('${blockchaindata[index].marketCapUsd}',style: TextStyle(color:Colors.white,fontSize: 17),),
                          ),
                          Container(
                            child: Text('${blockchaindata[index].priceUsd}',style: TextStyle(color:Colors.white,fontSize: 17),),
                          )
                        ],
                      ),
                    );
                  },
                ),*/
        ],
      ),
    );
  }
}

class ListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Currency',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                Text(
                  'volume24',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                Text(
                  'csupply',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.white,
            height: 10,
          ),
          Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                    ),
                  ],
                ),
              ))
          /*ListView.builder(
                  shrinkWrap: true,
                  itemCount: this.blockchaindata.length,
                  itemBuilder: (context,index){
                    return Container(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child:Column(
                              children: [
                                Text('${blockchaindata[index].symbol}',style: TextStyle(color:Colors.white,fontSize: 17),),
                              ],
                            ),
                          ),
                          Container(
                            child: Text('${blockchaindata[index].marketCapUsd}',style: TextStyle(color:Colors.white,fontSize: 17),),
                          ),
                          Container(
                            child: Text('${blockchaindata[index].priceUsd}',style: TextStyle(color:Colors.white,fontSize: 17),),
                          )
                        ],
                      ),
                    );
                  },
                ),*/
        ],
      ),
    );
  }
}