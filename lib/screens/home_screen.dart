import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/blocs/covid_data_bloc.dart';
import 'package:flutter_bloc_pattern/models/covid_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    covidDataBloc.fetchCovidData();
  }

  @override
  void dispose() {
    covidDataBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest Covid Data'),
      ),
      body: StreamBuilder(
        stream: covidDataBloc.covidDataStream,
        builder: (context, AsyncSnapshot<List<CovidModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(snapshot.data![index].covidvariant.toString()),
                  trailing:
                      Text(snapshot.data![index].confirmedcases.toString()),
                  leading:
                      Text(snapshot.data![index].recoveredcases.toString()),
                ),
              );
            });
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
