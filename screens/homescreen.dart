import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/DioHelper/dio.dart';
import 'package:newsapp/Models/newsmodell.dart';
import 'package:newsapp/NwesBloc/cubit/newscubit_cubit.dart';
import 'package:newsapp/screens/business.dart';
import 'package:newsapp/screens/detailsscreen.dart';
import 'package:newsapp/screens/entertainment.dart';
import 'package:newsapp/screens/health.dart';
import 'package:newsapp/screens/scinence.dart';
import 'package:newsapp/screens/sports.dart';
import 'package:newsapp/screens/technology.dart';

import '../widgets/shardwidget.dart';

class HomeScreen extends StatelessWidget {

   
  @override
  Widget build(BuildContext context) {
    var cubit = NewscubitCubit.get(context);
    
    return BlocConsumer<NewscubitCubit, NewscubitState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: cubit.modell != null, 
          builder: (context) {
            return slider(cubit.modell,context );
          }, 
          fallback: (context) => Center(child: CircularProgressIndicator()),
          );
      },
    );
  }
}


 List<String> items =[
      'Business',
      'Entertainment',
      'Health',
      'Science',
      'Sports',
      'Technology',
    ] ;
    List <Widget> pages = [
      BusinessScreen(),
      Entertainmentscreen(),
      HealthScreen(),
      ScienceScreen(),
      sportsScreen(),
      TechnologyScreen(),
    ];
Widget slider (NewsModell? modell,context,){
  return  SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Breaking News',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
        CarouselSlider(
                    items:modell!.articles!.map((e) => sliderwidget(
                      e.urlToImage,
                      e.title,
                      (){
                        Navigator.push(context, MaterialPageRoute(builder:(context) => DetailsScreen(
                         
                          e
                        ),));
                      }
                      )).toList(),
                    options: CarouselOptions(
                      height: 450,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(seconds: 3),
                      autoPlayInterval:  Duration(seconds: 5),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                    )
                    ),
                    SizedBox(height: 30,),
                  
                  SizedBox(
                    height: 44,
                    child:  ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                             
                              GestureDetector(
                                onTap: () {
                
                                  NewscubitCubit.get(context).changepages(index);
                                 
                                },
                                //دا الشكل الي انا استلمت فيه الايتم من اللست
                                
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                    ),
                                    child: Container(
                                      
                                      child: Center(
                                        child: Text(items[index],style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold
                                        ),),
                                      ),
                                    ),
                                  ),
                                  
                                
                              ),
                             
                        SizedBox(height: 10,),
                              Visibility(
                                  visible: NewscubitCubit.get(context).screens == index,
                                  child: Padding(
                                   padding: const EdgeInsets.only(
                                      left: 15,
                                    ),
                                    child: Container(
                                      width: 90,
                                      height: 5,
                                      decoration: BoxDecoration(
                                       
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ))
                            ],
                          );
                        }),
                  ),
                   Container(
                               width: 10000,
                                height: 2,
                                color: Colors.grey[300],
                              ),
  
                   Container(
                    margin: EdgeInsets.only(top: 30),
                    width: double.infinity,
                    height: 4200,
                    child: pages[NewscubitCubit.get(context).screens],
                  )
      ],
    ),
  );
}
