library carousel_grid;

import 'dart:io';
import 'package:carousel_grid/gallery/gallery_model.dart';
import 'package:carousel_grid/gallery/gallery_image_view_wrapper.dart';
import 'package:carousel_grid/gallery/util.dart';
import 'package:flutter/material.dart';
import 'gallery/gallery_thumbnail.dart';

class CarouselGrid extends StatefulWidget {
  final int gridCount;
  final bool imageNetwork;
  final double gridMainExtent;
  final double gridMainSpacing;
  final double gridCrossSpacing;
  final double height;
  final double width;
  final List<String>? listUrlImages;
  final String? titleGallery;
  final Icon iconBack;

  const CarouselGrid({
    Key? key,
    required this.imageNetwork,
    required this.width,
    this.height = 285,
    this.listUrlImages,
    this.gridCount = 2,
    this.gridMainSpacing = 5.0,
    this.gridCrossSpacing = 5.0,
    this.gridMainExtent = 130.0,
    this.titleGallery,
    required this.iconBack,
  }) : super(key: key);

  @override
  State<CarouselGrid> createState() => _CarouselGridState();
}

class _CarouselGridState extends State<CarouselGrid> {
  List<GalleryItemModel> galleryItems = <GalleryItemModel>[];
  @override
  void initState() {
    buildItemsList(widget.listUrlImages!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height,
        width: widget.width,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: galleryItems.isEmpty
                ? getEmptyWidget()
                : GridView.builder(
                    primary: false,
                    itemCount:
                        galleryItems.length > 4 ? 4 : galleryItems.length,
                    padding: const EdgeInsets.all(0),
                    semanticChildCount: 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: widget.gridCount,
                      crossAxisSpacing: widget.gridCrossSpacing,
                      mainAxisSpacing: widget.gridMainSpacing,
                      mainAxisExtent: widget.gridMainExtent,
                    ),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(4)),
                          child: galleryItems.length > 4 && index == 3
                              ? buildImageNumbers(index)
                              : GalleryItemThumbnail(
                                  galleryItem: galleryItems[index],
                                  onTap: () {
                                    openImageFullScreen(index);
                                  },
                                )
                      );
                    }
                )
        )
    );
  }

// build image with number for other images
  Widget buildImageNumbers(int index) {
    return GestureDetector(
      onTap: () {
        openImageFullScreen(index);
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: <Widget>[
          GalleryItemThumbnail(
            galleryItem: galleryItems[index],
          ),
          Container(
            color: Colors.black.withOpacity(.7),
            child: Center(
              child: Text(
                "+${galleryItems.length - 4}",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // to open gallery image in full screen
  void openImageFullScreen(final int indexOfImage) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryImageViewWrapper(
          titleGallery: widget.titleGallery,
          galleryItems: galleryItems,
          backgroundDecoration: const BoxDecoration(color: Colors.black,),
          initialIndex: indexOfImage,
          scrollDirection: Axis.horizontal,
          iconBack: widget.iconBack,
        ),
      ),
    );
  }

// clear and build list
  buildItemsList(List<String> items) {
    galleryItems.clear();
    for (var item in items) {
      galleryItems.add(
        GalleryItemModel(id: item, imageUrl: item),
      );
    }
  }
}
