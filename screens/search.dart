import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/NwesBloc/cubit/newscubit_cubit.dart';

import '../widgets/shardwidget.dart';
import 'detailsscreen.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    var controller = TextEditingController();
    return BlocConsumer<NewscubitCubit, NewscubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller:controller ,
                  onChanged: (value){
                    NewscubitCubit.get(context).getsearch(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    label: Text('Search'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  )
                ),
              ),
              if(state is Searchsuccess)
             Expanded(
               child: ListView.separated(
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder:(context, index) => customnews(
                NewscubitCubit.get(context).search!.articles![index].urlToImage ,
                NewscubitCubit.get(context).search!.articles![index].title,
                NewscubitCubit.get(context).search!.articles![index].publishedAt ,
                (){
                   Navigator.push(context, MaterialPageRoute(builder:(context) => DetailsScreen(
                    
                    NewscubitCubit.get(context).search!.articles![index],
                   )));
                }
                         ) , 
                         separatorBuilder: (context, index) => Container(
                  margin: EdgeInsets.all(10),
                  height: 3,
                  width: double.infinity,
                  color: Colors.grey,
                ), 
                         itemCount: NewscubitCubit.get(context).search!.articles!.length
                         ),
             ),
            ]
          ),
        );
      },
    );
  }
}