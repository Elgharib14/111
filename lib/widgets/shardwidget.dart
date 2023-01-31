import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Models/newsmodell.dart';

Widget sliderwidget(
  String? image,
  String? titl,
  Function onTap,
){
  return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      onTap();
                    },
                    child: Container(
                      width: 420,
                      height: 490,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                       children: [
                        Image(
                            image: NetworkImage('${image}'),
                            fit: BoxFit.fill,
                            width: 380,
                            height: 490,
                          ),
                          Container(
                            width: 380,
                            height: 90,
                            color: Colors.black.withOpacity(.3),
                            child: Text('${titl}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26
                            ),
                            
                            ),
                          )
                       ],
                      ),
                    ),
                  ),
                ),
              );
}

Widget customnews(
   String? urltoimage,
   String? title,
   String? date, 
   Function ontap
){
  return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              ontap();
            },
            child: Row(
              children: [
                Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image(
                    image: NetworkImage('${urltoimage}'),
                    fit: BoxFit.fill,
                    ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${title!}',style: TextStyle(
                          fontSize: 25
                        ),
                        maxLines: 2,
                        ),
                        SizedBox(height: 40,),
                         Text(
                          '${date!}',
                          maxLines: 2,
                          ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
}

