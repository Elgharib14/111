import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/DioHelper/dio.dart';
import 'package:newsapp/NwesBloc/cubit/newscubit_cubit.dart';
import 'bottemnav.dart';

void main() {
  runApp(const MyApp());
  DioHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewscubitCubit()..getnews()..getbusiness()..getentertainment()..gethealth()..getscince()..getsports()..gettechnology(),
          
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  BottemNaveScreen(),
      ),
    );
  }
}

