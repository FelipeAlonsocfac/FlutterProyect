import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 22.0),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => _CastCard(),
      ),
    );
  }
}

class _CastCard extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18.0),
            child: FadeInImage(
              placeholder: AssetImage("assets/no-image.jpg"), 
              image: NetworkImage("https://via.placeholder.com/150x300"),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            "actor.name",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,

          )
        ],
      ),
    );
  }
}