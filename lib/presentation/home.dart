import 'package:bloc_skel/application/bloc/getdata_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<GetdataBloc>(context)
          .add(const GetdataEvent.initilized());
    });
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocBuilder<GetdataBloc, GetdataState>(
          builder: (context, state) {
            state.isLoading;
            return ListView.separated(
                itemBuilder: (context, index) {
                  return const ListTile(
                    leading: Image(image: AssetImage("assetName")),
                    title: Text("data"),
                    subtitle: Text("sub title"),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: 10);
          },
        );
      },
    );
  }
}
