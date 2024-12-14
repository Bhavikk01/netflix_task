import 'package:flutter/material.dart';

import '../models/show_model.dart';

class SearchShowCard extends StatelessWidget {
  final ShowModel show;
  const SearchShowCard({required this.show, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          height: 250.0,
          width: 160.0,
          decoration: BoxDecoration(
            image: show.show!.image == null
                ? const DecorationImage(
              image: AssetImage(
                "assets/icons/no_image.jpg",
              ),
              fit: BoxFit.cover,
            )
                : DecorationImage(
              image: NetworkImage(
                "${show.show!.image!['original']?? ''}",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 160.0,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24.0),
          child: Text(
            show.show!.name?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
