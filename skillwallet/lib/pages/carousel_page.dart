import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skillwallet/helpers/Common.dart';
import 'package:skillwallet/models/interaction_result.dart';

class CarouselPage extends StatefulWidget {
  List<InteractionResult?>? data;

  CarouselPage({Key? key, required this.data}) : super(key: key);

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  int selectedIndex = 0;

  Widget _generateText(title, subtitle) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: Common.textStyle.copyWith(fontSize: 14.0)),
          const SizedBox(
            height: 5.0,
          ),
          Text(subtitle, style: Common.textStyle.copyWith(fontSize: 14.0)),
          const SizedBox(
            height: 10.0,
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Interaction NFTs",
            style: Common.textStyle.copyWith(fontSize: 18.0)),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Text(widget.data![selectedIndex]!.title!,
                  style: Common.textStyle.copyWith(fontSize: 20.0)),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: CarouselSlider(
                options: CarouselOptions(
                    height: 290.0,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    enlargeCenterPage: true),
                items: widget.data!.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border:
                                  Border.all(color: Colors.white, width: 3.0)),
                          child: Image.network(i!.image.toString().trim(),
                              fit: BoxFit.cover));
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _generateText(
                    "COMMUNITY:", widget.data![selectedIndex]!.communityName),
                _generateText("MEMBERSHIP ID:",
                    "#${widget.data![selectedIndex]!.membershipID.toString().padLeft(3, '0')}"),
                _generateText("DATE:", widget.data![selectedIndex]!.date),
              ],
            ),

            // Center(
            //   child: Text(widget.data![selectedIndex]!.description!,
            //       style: Common.textStyle),
            // ),
          ],
        ),
      ),
    );
  }
}
