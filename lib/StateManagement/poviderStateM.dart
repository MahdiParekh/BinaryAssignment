import 'package:assignment/models/Movie.dart';
import 'package:assignment/api/api.dart';
import 'package:flutter/cupertino.dart';

class Notifiers extends ChangeNotifier
{
  List<Movie> movielist = List.empty(growable: true);

 bool _isProcessing = true;

 bool get isProcessing => _isProcessing;

 String _error = '';

 String get error => _error;


  fetchMovies(BuildContext context)
  {
    fetchMovieInfo(context).then((value) {
      movielist.addAll(value);
      notifyListeners();
    });
  }

  setIsProcessing(bool value)
  {
    _isProcessing = value;
    notifyListeners();
  }

  geterror(String e)
  {
    _error = e;
    notifyListeners();
  }

}

