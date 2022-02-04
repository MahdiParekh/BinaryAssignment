import 'dart:convert';
import 'dart:io';
import 'package:assignment/models/Movie.dart';
import 'package:assignment/StateManagement/poviderStateM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:io';


Future<List<Movie>> fetchMovieInfo(BuildContext context) async
{
var prov = Provider.of<Notifiers>(context,listen: false);
  var url = "http://www.omdbapi.com/?i=tt3896198&apikey=18089b9e&s=Movies";
var response;
try {
   response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 5));
}

catch (e) {
  print("error ${e.toString()}");
  prov.setIsProcessing(false);
  prov.geterror('No Internet Connection');
  throw Exception(e);
}
  var movies = List<Movie>.empty(growable: true);
  movies.clear();
  if (response.statusCode == 200) {
    prov.setIsProcessing(false);
    var itemsJson = jsonDecode(response.body);
    print(itemsJson);
    for (var itemjson in itemsJson["Search"]) {
      movies.add(Movie.fromJson(itemjson));
    }
  }
  else
       {
         print("in else");
         prov.setIsProcessing(false);
        throw Exception('No Internet connection');
    }

  print(movies);
  return movies;
}