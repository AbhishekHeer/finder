import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location_finder/backend.dart';
import 'package:location_finder/find.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> photo = [
  "https://i.pinimg.com/236x/31/f2/9b/31f29b5a77ea667b9d7e3fd1c846cd7d.jpg",
  "https://i.pinimg.com/236x/11/ae/e4/11aee4961f00ea1d7fc6ad7a9a08ad18.jpg",
  "https://i.pinimg.com/236x/8d/fa/5d/8dfa5d497d91bc3c0f6905318327a37c.jpg",
  'https://i.pinimg.com/236x/5a/16/0c/5a160cf5a3736110b473fc2f95624869.jpg',
  "https://i.pinimg.com/236x/bd/86/66/bd8666ff165fd82be5f81cc1c1004215.jpg"
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: height,
          width: width,
          child: CarouselSlider(
              items: photo
                  .map((item) => SizedBox(
                        child: Center(
                          child: Image.network(
                            item,
                            fit: BoxFit.contain,
                            height: height,
                          ),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                height: height,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              )),
        ),
        Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.redAccent]),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: height * .4),
          child: Center(
              child: Align(
            alignment: Alignment.center,
            child: SizedBox(
                height: height * .3,
                width: width * .9,
                child: Text(
                  "No Need Of SignUp Just Click On Call...",
                  style: GoogleFonts.poppins(fontSize: width * .04),
                )),
          )),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: height * .6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(width * .05)),
                  ),
                  height: width > 600 ? height * .14 : height * .1,
                  width: width * .25,
                  child: InkWell(
                    onTap: () {
                      Position().getCurrentLocation();
                      showAdaptiveDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Text("Please wait..."),
                              content: Text(
                                  "You Are Connect Shotly With Random Girl"),
                            );
                          });
                      Future.delayed(const Duration(hours: 1), () {
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FindMatch()),
                        );
                      });
                    },
                    child: Center(
                      child: Text(
                        'Call A Girl',
                        style: GoogleFonts.poppins(
                            fontSize: width * .03, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(width * .05)),
                  ),
                  height: width > 600 ? height * .14 : height * .1,
                  width: width * .25,
                  child: InkWell(
                    onTap: () {
                      Position().getCurrentLocation();

                      showAdaptiveDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Text("Please wait..."),
                              content: Text(
                                  "You Are Connect Shotly With Random Boy"),
                            );
                          });
                      Future.delayed(const Duration(hours: 1), () {
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FindMatch()),
                        );
                      });
                    },
                    child: Center(
                      child: Text(
                        'Call A Boy',
                        style: GoogleFonts.poppins(
                            fontSize: width * .03, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
