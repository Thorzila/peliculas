import 'package:flutter/material.dart';

import 'package:peliculas/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;

  const MovieHorizontal({ @required this.peliculas });

  @override
  Widget build(BuildContext context) {
    
    final _screenSize = MediaQuery.of(context).size;
    
    return Container(

      height: _screenSize.height * 0.3,

      child: PageView(
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
        children: _tarjetas(),
      ),

    );
  }

  List<Widget> _tarjetas() {

    return peliculas.map((pelicula){

      return Container(
        margin: EdgeInsets.only(right: 15),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 160,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      );

    }).toList();

  }
}