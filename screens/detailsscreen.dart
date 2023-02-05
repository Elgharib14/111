import 'package:flutter/material.dart';
import 'package:newsapp/Models/newsmodell.dart';

class DetailsScreen extends StatelessWidget {
 
final Articles modell;
  
DetailsScreen(this.modell);
build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.grey,
            title: Text(
              'Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 490,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(15))),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      if(modell.urlToImage ==null)
                      Image(
                        image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCM-PBpfCAEZRVATHKtKKAvittqpct4ashtQ&usqp=CAU'
                            ),
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 490,
                      ),
                      if(modell.urlToImage !=null)
                      Image(
                        image: NetworkImage(
                          modell.urlToImage!
                            ),
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 490,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Author : ',
                            style: TextStyle(fontSize: 20),
                          ),
                           if(modell.author ==null)
                           Text('Not found', style: TextStyle(fontSize: 20)),
                            if(modell.author !=null)
                          Text(modell.author!, style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                if(modell.description ==null)
                Text('Not found', style: TextStyle(fontSize: 20)),
                if(modell.description !=null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  
                  child: Text(
                    modell.description!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    maxLines: 20,
                  ),
                )
              ],
            ),
          ),
        );
      }
} 
 
