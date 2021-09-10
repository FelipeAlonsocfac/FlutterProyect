import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

 class MovieSlider extends StatefulWidget {
 
  final String? title;
  final List<Movie> movies;
  final Function onNextPage;

  const MovieSlider({
    Key? key, 
    required this.movies,
    this.title,
    required this.onNextPage
  }) : super(key: key);

  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent * 0.8){
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title == null) 
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(this.widget.title! ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          SizedBox(height: 5.0),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (BuildContext context, int index) => _MoviePoster(widget.movies[index],)
            ),
          ),
        ],
      ),
    );
  }
}

 class _MoviePoster extends StatelessWidget {
   
  final Movie movie;

  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {

    
    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [

          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage(
                placeholder: AssetImage("assets/no-image.jpg"),
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            "${this.movie.title}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}