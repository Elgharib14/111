import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/NwesBloc/cubit/newscubit_cubit.dart';

class BottemNaveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = NewscubitCubit.get(context);
    return BlocConsumer<NewscubitCubit, NewscubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            // appBar: AppBar(
            //   elevation: 0.0,
            //   backgroundColor: Colors.white,
            //   title: Text('News'),
            //   centerTitle: true,
            // ),
            body: cubit.screen[cubit.curntindex],
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0.0,
              currentIndex: cubit.curntindex,
              onTap: (index){
                cubit.changeBottemNave(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: '')
              ],
            ),
          ),
        );
      },
    );
  }
}
