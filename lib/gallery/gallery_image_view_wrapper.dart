import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_network/image_network.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import './gallery_model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

// to view image in full screen
class GalleryImageViewWrapper extends StatefulWidget {
  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final int initialIndex;
  final List<GalleryItemModel> galleryItems;
  final Axis scrollDirection;
  final String? titleGallery;
  final Icon iconBack;
  final BoxFit fit;
  final bool loop;
  final bool activeCarouselList;

  const GalleryImageViewWrapper({
    Key? key,
    this.loadingBuilder,
    this.titleGallery,
    this.backgroundDecoration,
    required this.initialIndex,
    required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
    required this.iconBack,
    required this.fit,
    required this.loop,
    required this.activeCarouselList,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GalleryImageViewWrapperState();
  }
}

class _GalleryImageViewWrapperState extends State<GalleryImageViewWrapper> {
  final minScale = PhotoViewComputedScale.contained * 0.8;
  final maxScale = PhotoViewComputedScale.covered * 8;

  late PageController pageController;
  late InfiniteScrollController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = InfiniteScrollController(initialItem: widget.initialIndex);
    pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  clickImage(int itemIndex) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration.zero,
        pageBuilder: (_, __, ___) => GalleryImageViewWrapper(
          titleGallery: widget.titleGallery,
          galleryItems: widget.galleryItems,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: itemIndex,
          scrollDirection: Axis.horizontal,
          iconBack: widget.iconBack,
          fit: widget.fit,
          loop: widget.loop,
          activeCarouselList: widget.activeCarouselList,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: widget.backgroundDecoration,
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height,
            ),
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: _buildImage,
              itemCount: widget.galleryItems.length,
              loadingBuilder: widget.loadingBuilder,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: pageController,
              scrollDirection: widget.scrollDirection,
            ),
          ),
          SafeArea(
            child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 5.0, left: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8)),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: widget.iconBack)),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0, left: 20.0),
                        child: Text(
                          widget.titleGallery ?? "",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: InfiniteCarousel.builder(
                  itemCount: widget.galleryItems.length,
                  itemExtent: 150,
                  loop: widget.loop,
                  controller: _controller,
                  onIndexChanged: (index) {
                    if (_selectedIndex != index) {
                      setState(() => _selectedIndex = index);
                    }
                  },
                  itemBuilder: (context, itemIndex, realIndex) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: GestureDetector(
                          onTap: () {
                            clickImage(itemIndex);
                          },
                          child: widget.activeCarouselList
                              ? ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: kIsWeb
                                      ? ImageNetwork(
                                          image: widget
                                              .galleryItems[itemIndex].imageUrl,
                                          width: 200,
                                          height: 100,
                                          duration: 500,
                                          fitWeb: BoxFitWeb.cover,
                                          onTap: () {
                                            clickImage(itemIndex);
                                          },
                                        )
                                      : CachedNetworkImage(
                                          fit: widget.fit,
                                          imageUrl: widget
                                              .galleryItems[itemIndex].imageUrl,
                                          placeholder: (context, url) =>
                                              const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                )
                              : const SizedBox()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// build image with zooming
  PhotoViewGalleryPageOptions _buildImage(BuildContext context, int index) {
    final GalleryItemModel item = widget.galleryItems[index];
    return PhotoViewGalleryPageOptions.customChild(
      child: kIsWeb
          ? Center(
              child: ImageNetwork(
                image: item.imageUrl,
                fitWeb: BoxFitWeb.contain,
                duration: 500,
                width: 800,
                height: 800,
              ),
            )
          : CachedNetworkImage(
              imageUrl: item.imageUrl,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
      initialScale: PhotoViewComputedScale.contained,
      minScale: minScale,
      maxScale: maxScale,
      heroAttributes: PhotoViewHeroAttributes(tag: item.id),
    );
  }
}
