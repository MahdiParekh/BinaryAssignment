import 'package:assignment/StateManagement/poviderStateM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MovieDetail extends StatefulWidget {
late int index;
MovieDetail({required this.index});

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override

  initState() {
    super.initState();
    context.read<Notifiers>().fetchMovies(context);
  }


  Widget build(BuildContext context) {
    return Scaffold(body:Consumer<Notifiers>(
        builder: (context, notifier, child) {
          return  Container(child: Center(child: Text("Movie Title : ${notifier.movielist[widget.index].title}"),),);
        }));

  }
}
