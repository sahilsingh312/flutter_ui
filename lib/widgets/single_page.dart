import 'package:flutter/material.dart';

class SinglePage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final bool isFirstSlide;
  const SinglePage({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.isFirstSlide = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fitWidth),
      ),
      child: Column(
        children: [
          isFirstSlide
              ? Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.43,
                    ),
                    Image.asset('assets/images/logo.png'),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Text(
                      '#MOVEYOURMIND',
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ],
                ),
          SizedBox(
            height: isFirstSlide ? screenHeight * 0.24 : screenHeight * 0.50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              isFirstSlide ? subtitle : title,
              style: isFirstSlide
                  ? Theme.of(context).textTheme.bodyText1
                  : Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              isFirstSlide ? title : subtitle,
              style: isFirstSlide
                  ? Theme.of(context).textTheme.headline1
                  : Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
