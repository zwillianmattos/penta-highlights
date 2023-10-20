import 'package:flutter/material.dart';
import 'package:penta/src/colors/color_theme.dart';

class PentaGameCard extends StatefulWidget {
  const PentaGameCard({super.key});

  @override
  State<PentaGameCard> createState() => _PentaGameCardState();
}

class _PentaGameCardState extends State<PentaGameCard> {
  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width / 2.45;
    

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width,
            height: width * 1.2,
            decoration: BoxDecoration(
              color: background,
              image: DecorationImage(
                  image: NetworkImage(
                    "https://notadogame.com/uploads/game/cover/150x185/5ec161df463ab.jpg",
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0)),
                  boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 3)
              ]
            ),
          ),
          Container(
            width: width,
            decoration: BoxDecoration(
              color: neutralDark,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Text(
                  'Valorant',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: neutralLight),
                ),
                Text(
                  '180k',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: neutralLight),
                ),
              ]),
            ),
          )
        ],
      );
  }
}
