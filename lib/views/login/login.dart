import 'package:coindcx/constant/routes.dart';
import 'package:flutter/material.dart';

class Startingpage extends StatefulWidget {
  const Startingpage({super.key});

  @override
  State<Startingpage> createState() => _StartingpageState();
}

class _StartingpageState extends State<Startingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    "assets/splash.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    // height: MediaQuery.of(context).size.height / 2.5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              const Positioned(
                child: Center(
                  child: Text(
                    "Welcome to The \n CoinDCX App",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Color(0xFF142142),
                  ),
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width,
                  // height: 100,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(registerRoute);
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(300, 50),
                                backgroundColor:
                                    const Color.fromARGB(255, 41, 83, 190)),
                            child: const Text("Create account for free")),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(loginRoute);
                          },
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color.fromARGB(255, 41, 85, 196),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



//------------------------------------------------------------------------------------------------------------------------//

// final List<String> imgList = [
//   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80'
// ];

// final List<Widget> imageSliders = imgList
//     .map((item) => Container(
//           margin: const EdgeInsets.all(5.0),
//           child: ClipRRect(
//               borderRadius: const BorderRadius.all(Radius.circular(5.0)),
//               child: Stack(
//                 children: <Widget>[
//                   Image.network(item, fit: BoxFit.cover, width: 1000.0),
//                 ],
//               )),
//         ))
//     .toList();


  // int _current = 0;
  // final CarouselController _controller = CarouselController();

// CarouselSlider(
//   carouselController: _controller,
//   options: CarouselOptions(
//     height: MediaQuery.of(context).size.height / 2.2,
//     autoPlay: true,
//     autoPlayInterval: const Duration(seconds: 5),
//     autoPlayAnimationDuration:
//         const Duration(milliseconds: 500),
//     onPageChanged: (index, reason) {
//       setState(() {
//         _current = index;
//       });
//     },
//   ),
//   items: imageSliders,
// ),
// Padding(
//   padding: const EdgeInsets.all(16.0),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: imgList.asMap().entries.map((entry) {
//       return GestureDetector(
//         onTap: () => _controller.animateToPage(entry.key),
//         child: Column(
//           children: [
//             Container(
//               width: 6.0,
//               height: 6.0,
//               margin: const EdgeInsets.symmetric(
//                   vertical: 8.0, horizontal: 4.0),
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: (Theme.of(context).brightness ==
//                               Brightness.dark
//                           ? Colors.white
//                           : const Color.fromARGB(
//                               255, 255, 255, 255))
//                       .withOpacity(
//                           _current == entry.key ? 0.9 : 0.4)),
//             ),

//           ],
//         ),
//       );
//     }).toList(),
//   ),
// ),
// CarouselSlider(
//   options: CarouselOptions(
//     height: 120,
//     autoPlay: true,
//     autoPlayInterval: const Duration(seconds: 5),
//     autoPlayAnimationDuration:
//         const Duration(milliseconds: 500),
//     onPageChanged: (index, reason) {
//       setState(() {
//         _current = index;
//       });
//     },
//   ),
//   items: [
//     "Buy & Sell from\n100+ Crypto Assets",
//     "track your Portfolio\n & See it grow",
//     "Secured returns on your\n Crypto with Earn",
//     "Beat volatility with\n Crypto SIP"
//   ].map((i) {
//     return Builder(
//       builder: (BuildContext context) {
//         return Container(
//             width: MediaQuery.of(context).size.width,
//             margin: const EdgeInsets.symmetric(horizontal: 5.0),
//             // decoration: BoxDecoration(color: Colors.amber),
//             child: Column(
//               children: [
//                 Text(
//                   i,
//                   style: const TextStyle(
//                     fontSize: 22.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ));
//       },
//     );
//   }).toList(),
// ),
//----------------------------------------------------------------------------------------------//