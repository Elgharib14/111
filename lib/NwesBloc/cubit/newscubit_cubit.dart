import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/Models/newsmodell.dart';
import 'package:newsapp/screens/homescreen.dart';
import 'package:newsapp/screens/search.dart';

import '../../DioHelper/dio.dart';

part 'newscubit_state.dart';

class NewscubitCubit extends Cubit<NewscubitState> {
  NewscubitCubit() : super(NewscubitInitial());

  static NewscubitCubit get(context)=> BlocProvider.of(context);

List<Widget> screen =[
  HomeScreen(),
  SearchScreen(),
];
int curntindex = 0;
  void changeBottemNave(index){
    curntindex=index;
    emit(changesuccess());
  }

 int screens = 0;
  void changepages(index){
  screens = index;
  emit(changepagess());
  }

  NewsModell? modell;
  void getnews(){
     DioHelper.getdata(
          url:'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'general',
            'apiKey':'2a2f271b30d541acaa68e9469cce8883',
          }
           ).then((value){
            emit(getdatasucess());
            modell = NewsModell.fromJson(value.data);
            // print(modell!.articles![0].title);
           });
  }

  NewsModell? businessmodell;
  void getbusiness(){
     DioHelper.getdata(
          url:'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'business',
            'apiKey':'2a2f271b30d541acaa68e9469cce8883',
          }
           ).then((value){
            emit(getdatasucess());
            businessmodell = NewsModell.fromJson(value.data);
            
           });
  }

  NewsModell? entertainment;
  void getentertainment(){
     DioHelper.getdata(
          url:'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'entertainment',
            'apiKey':'2a2f271b30d541acaa68e9469cce8883',
          }
           ).then((value){
            emit(getdatasucess());
            entertainment = NewsModell.fromJson(value.data);
            
           });
  }



NewsModell? health ;
  void gethealth(){
     DioHelper.getdata(
          url:'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'health',
            'apiKey':'2a2f271b30d541acaa68e9469cce8883',
          }
           ).then((value){
            emit(getdatasucess());
            health = NewsModell.fromJson(value.data);
            
           });
  }

  NewsModell? scince ;
  void getscince(){
     DioHelper.getdata(
          url:'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'science',
            'apiKey':'2a2f271b30d541acaa68e9469cce8883',
          }
           ).then((value){
            emit(getdatasucess());
            scince = NewsModell.fromJson(value.data);
            
           });
  }

  NewsModell? sports ;
  void getsports(){
     DioHelper.getdata(
          url:'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'sports',
            'apiKey':'2a2f271b30d541acaa68e9469cce8883',
          }
           ).then((value){
            emit(getdatasucess());
            sports = NewsModell.fromJson(value.data);
            
           });
  }

  NewsModell? technology ;
  void gettechnology(){
     DioHelper.getdata(
          url:'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'technology',
            'apiKey':'2a2f271b30d541acaa68e9469cce8883',
          }
           ).then((value){
            emit(getdatasucess());
            technology = NewsModell.fromJson(value.data);
            
           });
  }


  NewsModell? search;
  void getsearch(String value){
    emit(searchloding());
     DioHelper.getdata(
          url:'v2/everything',
          query: {
            
            'q':'$value',
            'apiKey':'2a2f271b30d541acaa68e9469cce8883',
          }
           ).then((value){
            emit(Searchsuccess());
            search = NewsModell.fromJson(value.data);
            print(search!.status);
            
           });
  }

 

}
