import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Tile extends StatefulWidget {
  String name;
  int year;
  String imgUrl;
  Tile({required this.name, required this.imgUrl, required this.year});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        color: Colors.lightGreenAccent.withOpacity(0.2),
        // color: Colors.lightGreenAccent,
        alignment: Alignment.center,
        height: 100,
        width: double.infinity,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.imgUrl),
            radius: 30,
          ),
          title: Text(
            widget.name,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.black87),
          ),
          subtitle: Text(
            "Working since ${widget.year}",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Colors.black45),
          ),
          trailing: 2022 - widget.year >= 5
              ? Lottie.asset("assets/lotties/green flag.json")
              : null,
        ),
      ),
    ]);
  }
}
