import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie: movie),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie: movie),
              _Overview(movie: movie),
              _Overview(movie: movie),
              CastingCards(movie.id),
            ]),
          ),
        ],
      ),
    );
  }
}


class _CustomAppBar extends StatelessWidget {

  final Movie movie;

  const _CustomAppBar({
    Key? key, 
    required this.movie
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 8.0, left: 12, right: 12),
          child: Text(
            movie.title,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          width: double.infinity,
          color: Colors.black12,
        ),
        background: FadeInImage(
          placeholder: AssetImage("assets/loading.gif"), 
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
      
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  final Movie movie;

  const _PosterAndTitle({
    Key? key, 
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;


    return Container(
      margin: EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage(
                placeholder: AssetImage("assets/no-image.jpg"), 
                image: NetworkImage(movie.fullPosterImg),
                height: 150,
              ),
            ),
          ),
          SizedBox(width: 18.0),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 160),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 3),
                SizedBox(height: 5.0),
                Text(movie.originalTitle, style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2),
                Row(
                  children: [
                    Icon(Icons.star_outlined, size: 15, color: Colors.grey,),
                    SizedBox(width: 5.0,),
                    Text(movie.voteAverage.toString(), style: textTheme.caption),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {


  final Movie movie;

  const _Overview({
    Key? key, 
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 11.0),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}