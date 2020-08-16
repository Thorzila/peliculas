
import 'package:peliculas/models/pelicula_model.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class PeliculasProvider {

  String _apikey   = '0db245e735b738d2976953a727d1f3c2';
  String _url      = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {

    final url = Uri.https(_url, '3/movie/now_playing',
    {
      'api_key'  : _apikey,
      'language' : _language,
    });

    final resp = await http.get(url);
    final decodedData = await json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    print(peliculas.items[1].title);

    return peliculas.items;

  } 

  Future<List<Pelicula>> getPopulares() async {

    final url = Uri.https(_url, '3/movie/popular',
    {
      'api_key'  : _apikey,
      'language' : _language,
    });

    final resp = await http.get(url);
    final decodedData = await json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    
    return peliculas.items;

  }

}