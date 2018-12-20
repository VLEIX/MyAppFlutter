import 'package:flutter/material.dart';

class AnimationFirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: GestureDetector(
        child: _getHeroImage(),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AnimationSecondScreen())
          );
        },
      ),
    );
  }
}

class AnimationSecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Container(
            width: 200.0,
            child: _getHeroImage(),
          )
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

Hero _getHeroImage() {
  return Hero(
    tag: 'imageHero',
    child: Image.network('https://i.blogs.es/9873f2/650_1000_grumpy-cat/450_1000.jpg'),
  );
}
