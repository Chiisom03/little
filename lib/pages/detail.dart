import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little/widgets/app_large_text.dart';
import 'package:little/widgets/app_text.dart';
import 'package:little/widgets/responsive_button.dart';
import 'package:little/widgets/small_button.dart';

import '../cubit/little_cubit_states.dart';
import '../cubit/little_cubits.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 450,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'http://mark.bslmeiyu.com/uploads/' + detail.place.img,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 25,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 300,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                              text: detail.place.name,
                              color: Colors.black.withOpacity(0.8)),
                          AppLargeText(
                              text: '\$' + detail.place.price.toString(),
                              color: Colors.black54)
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.location_on_rounded,
                              color: Colors.purple),
                          const SizedBox(width: 5),
                          AppText(
                              text: detail.place.location, color: Colors.grey),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
                              (index) {
                                return Icon(
                                  Icons.star_outlined,
                                  color: index < detail.place.stars
                                      ? Colors.yellow
                                      : Colors.grey,
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          AppText(text: '(5.0)', color: Colors.black54)
                        ],
                      ),
                      const SizedBox(height: 20),
                      AppLargeText(
                        text: 'People',
                        color: Colors.black54,
                        size: 20,
                      ),
                      const SizedBox(height: 10),
                      AppText(
                          text: 'Number of people in your group',
                          color: Colors.grey,
                          size: 13),
                      const SizedBox(height: 10),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: SmallButton(
                                size: 50,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black12,
                                bgColor: selectedIndex == index
                                    ? Colors.black
                                    : Colors.black12,
                                borderColor: selectedIndex == index
                                    ? Colors.black
                                    : Colors.black12,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      AppLargeText(
                        text: 'Description',
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(height: 10),
                      AppText(
                        text: detail.place.description,
                        color: Colors.black54,
                      ),
                      const SizedBox(height: 30),
                      Positioned(
                          right: 20,
                          bottom: 20,
                          left: 20,
                          child: Row(
                            children: [
                              SmallButton(
                                size: 60,
                                color: Colors.black54,
                                bgColor: Colors.white,
                                borderColor: Colors.black54,
                                isIcon: true,
                                icon: Icons.favorite_outline_rounded,
                              ),
                              const SizedBox(width: 20),
                              ResponsiveButton(
                                isResponsive: true,
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
