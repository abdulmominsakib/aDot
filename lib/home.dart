import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:easy_localization/easy_localization.dart';

import 'components.dart';
import 'data.dart';
import 'detailsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bool currentLanguage = false;
  String dropDownValue = 'en';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ).tr(),
                    Container(
                      child: DropdownButton<String>(
                          dropdownColor: Colors.blueAccent,
                          iconEnabledColor: secondaryTextColor,
                          underline: SizedBox(),
                          value: 'home',
                          items: [
                            DropdownMenuItem(
                              value: 'home',
                              child: Text(
                                'Milky Way Galaxy',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white54),
                              ).tr(),
                            ),
                          ],
                          onChanged: (value) {}),
                    ),
                  ],
                ),
                Column(
                  children: [
                    DropdownButton<String>(
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.white),
                      value: dropDownValue,
                      iconEnabledColor: Colors.white,
                      dropdownColor: Colors.blue,
                      items: [
                        DropdownMenuItem(
                          value: 'en',
                          child: Text(
                            '🇺🇸 English',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'bn',
                          child: Text(
                            '🇧🇩 বাংলা',
                            style: TextStyle(
                              fontFamily: 'Solaiman',
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'ar',
                          child: Text(
                            'عربى 🇸🇦 ',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'es',
                          child: Text(
                            '🇪🇸 Spanish',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ),
                      ],
                      onChanged: (String value) {
                        setState(
                          () {
                            dropDownValue = value;
                            if (dropDownValue == 'en') {
                              context.locale = Locale('en', 'US');
                            } else if (dropDownValue == 'bn') {
                              context.locale = Locale('bn', 'BN');
                            } else if (dropDownValue == 'ar') {
                              context.locale = Locale('ar', 'SA');
                            } else if (dropDownValue == 'es') {
                              context.locale = Locale('es', 'ES');
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Main Content Of The Page
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 20,
                  bottom: MediaQuery.of(context).size.height / 10),
              child: Swiper(
                layout: SwiperLayout.STACK,
                itemCount: planets.length,
                itemWidth: MediaQuery.of(context).size.width - 2 * 60,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    activeSize: 15,
                  ),
                ),
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => DetailPage(
                                planetInfo: planets[index],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 100),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32)),
                                  elevation: 8,
                                  child: Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 100,
                                        ),
                                        Text(
                                          planets[index].name,
                                          style: TextStyle(
                                            fontSize: 44,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ).tr(),
                                        Text(
                                          'Planet',
                                          style: TextStyle(
                                            fontSize: 23,
                                            color: primaryTextColor,
                                          ),
                                        ).tr(),
                                        Row(children: [
                                          Text(
                                            'Know More',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: secondaryTextColor,
                                            ),
                                          ).tr(),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: secondaryTextColor,
                                          ),
                                        ]),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Hero(
                              tag: planets[index].position,
                              child: Image.asset('${planets[index].iconImage}'),
                            ),
                            Positioned(
                              right: 0,
                              bottom: -20,
                              child: Text(
                                planets[index].position.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 200,
                                  color: primaryTextColor.withOpacity(0.08),
                                ),
                              ).tr(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
