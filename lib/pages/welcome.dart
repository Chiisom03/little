import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little/widgets/app_large_text.dart';
import 'package:little/widgets/responsive_button.dart';

import '../cubit/little_cubits.dart';
import '../widgets/app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'Dark-white-in-Basic10.png',
    'Dark-white-in-Basic5.png',
    'Dark-white-in-Basic2.png',
  ];
  List bigText = [
    'Explore',
    'Features',
    'Be Amazed',
  ];
  List text = [
    'Craze stuffs',
    'Wierd is the motto',
    'Food is Bae',
  ];

  List desc = [
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Minus explicabo eligendi doloremque error accusamus, sequi omnis maxime dolorum quasi adipisci eaque recusandae. Commodi aliquid obcaecati itaque quide!',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Minus explicabo eligendi doloremque error accusamus, sequi omnis maxime dolorum quasi adipisci eaque recusandae. Commodi aliquid obcaecati!',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Minus explicabo eligendi doloremque error accusamus, sequi omnis maxime dolorum quasi adipisci eaque recusandae!',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/img/welcome/' + images[index],
                    ),
                    fit: BoxFit.cover),
              ),
              child: Container(
                  margin: const EdgeInsets.only(
                    top: 320,
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: bigText[index]),
                          AppLargeText(text: text[index], size: 30),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 250,
                            child: AppText(
                              text: desc[index],
                              color: Colors.black54,
                              size: 18,
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context).getData();
                            },
                            child: SizedBox(
                                width: 200,
                                child: Row(
                                    children: [ResponsiveButton(width: 120)])),
                          )
                        ],
                      ),
                      Column(
                        children: List.generate(
                          3,
                          (indexDot) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 3),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexDot
                                    ? Colors.purple
                                    : Colors.purple.withOpacity(0.3),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
