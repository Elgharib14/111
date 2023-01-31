import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
 final String? urlimag;
 final String? title;
 final String? auther;
 final String? discribtion;
  
DetailsScreen(this.auther,this.discribtion,this.title,this.urlimag);
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
                      Image(
                        image: NetworkImage(
                            auther!.toString()),
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
                          Text(title!.toString(), style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    urlimag!.toString(),
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
 
