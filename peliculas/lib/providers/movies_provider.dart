import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier{

  String _apiKey = "956576936d433fbab382b93b1cfb8a83";
  String _baseUrl = "api.themoviedb.org";
  String _language = "es-ES";

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularPage = 0;

  MoviesProvider(){
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async{
    var url =
    Uri.https(_baseUrl, endpoint, { 
      'api_key'   : _apiKey,
      'language'  : _language,
      'page'      : '$page'
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {

    final jsonData = await _getJsonData("3/movie/now_playing");
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    
    this.onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;

    final jsonData = await _getJsonData("3/movie/popular", _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    
    this.popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();

  }
}