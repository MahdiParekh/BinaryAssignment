import 'package:flutter/material.dart';
class MovieComp extends StatefulWidget {
  @override

  late String imageUrl;
  MovieComp({required this.imageUrl});

  _MovieCompState createState() => _MovieCompState();
}

class _MovieCompState extends State<MovieComp> {
  @override



  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(borderRadius: BorderRadius.circular(5),
          child: Image.network(widget.imageUrl,)),);
  }
}
