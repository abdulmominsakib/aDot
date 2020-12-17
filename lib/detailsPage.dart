import 'package:flutter/material.dart';
import 'package:aDot/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'data.dart';

class DetailPage extends StatelessWidget {
  DetailPage({this.planetInfo});

  final PlanetInfo planetInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 250),
                          Text(
                            planetInfo.name,
                            style: TextStyle(
                              color: primaryTextColor,
                              fontSize: 44,
                              fontWeight: FontWeight.bold,
                            ),
                          ).tr(),
                          Text(
                            'Solar System',
                            style: TextStyle(
                              color: primaryTextColor,
                              fontSize: 25,
                            ),
                          ).tr(),
                          Divider(),
                          SizedBox(height: 20),
                          Text(planetInfo.description).tr(),
                          SizedBox(height: 20),
                          Divider(),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        'Gallery',
                        style: TextStyle(
                          color: primaryTextColor,
                          fontSize: 20,
                        ),
                      ).tr(),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      height: 250,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: planetInfo.images.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GalleryView(
                                      currentIndex: index,
                                      planetInfo: planetInfo,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    planetInfo.images[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
              Positioned(
                right: -50,
                child: Hero(
                    tag: planetInfo.position,
                    child: Image.asset(planetInfo.iconImage)),
              ),
              Positioned(
                left: 30,
                top: 20,
                child: Text(
                  planetInfo.position.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 200,
                    color: primaryTextColor.withOpacity(0.08),
                  ),
                ).tr(),
              ),
              IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

// Gallery

class GalleryView extends StatelessWidget {
  GalleryView({this.currentIndex, this.planetInfo});

  final int currentIndex;
  final PlanetInfo planetInfo;

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: currentIndex);

    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: PhotoViewGallery.builder(
            pageController: pageController,
            itemCount: planetInfo.images.length,
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(
                  planetInfo.images[index],
                ),
                minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
                maxScale: PhotoViewComputedScale.covered * 4.1,
              );
            }));
  }
}
