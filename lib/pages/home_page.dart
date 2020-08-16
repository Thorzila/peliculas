import 'package:flutter/material.dart';
import 'package:peliculas/models/pelicula_model.dart';
import 'package:peliculas/providers/peliculas_provider.dart';

import 'package:peliculas/widgets/card_swiper_widget.dart';
import 'package:peliculas/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {

  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Películas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                _swiperTarjetas(context),
                _footer(context),
              ],
          ),
        ),
      )
    );
  }

  Widget _swiperTarjetas(context) {
    
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.6,
      child: FutureBuilder(
        future: peliculasProvider.getEnCines(),
        builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
          if(snapshot.hasData){
            return CardSwiper( peliculas: snapshot.data );
          }else{
            return Container(height: 400, child: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );

  }

  Widget _footer(context){

    final _screenSize = MediaQuery.of(context).size;
    
    return Container(
      height: _screenSize.height * 0.4,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          Container(padding: EdgeInsets.only(left: 20.0), child: Text('Populares', style: Theme.of(context).textTheme.subtitle1,)),

          SizedBox(height: 10.0,),

          FutureBuilder(
            future: peliculasProvider.getPopulares(),
            builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
              
              if (snapshot.hasData) {
                return MovieHorizontal(peliculas: snapshot.data,);
              }else{
                return Center(child: CircularProgressIndicator());
              }

            },
          ),
        ],
      ),
    );
  }

}