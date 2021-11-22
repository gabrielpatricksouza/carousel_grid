# Carousel Grid

Carousel Grid is a Flutter package to display thumbnail grid images with cache and zoom.

<p align="start">
  <a href="https://pub.dev/packages/carousel_grid">
    <img src="https://img.shields.io/badge/build-passing-green"
         alt="Build">
  </a>
  <a href="https://pub.dev/packages/carousel_grid"><img src="https://img.shields.io/badge/pub-v1.0.0-blue"></a>
  
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/BeshoyMelika/flutter-gallery-package/master/images/example.gif" alt="Carousel Grid" width="300" height="600" />
</p>


## Key Features
* Images from Url
* Cached Images
* Infinite Carousel 
* Photos sorted 
* zoomable image

## Installation

Add `carousel_grid` as a dependency in your pubspec.yaml file .

Import Photo View:
```dart
import 'package:carousel_grid/carousel_grid.dart';
```

### Usage

#### URLs Images
``` dart
List<String> imagesUrls = [
    "https://scaffoldtecnologia.com.br/wp-content/uploads/2021/10/home4.jpg",
    "https://scaffoldtecnologia.com.br/wp-content/uploads/2021/10/app-2.png",
    "https://scaffoldtecnologia.com.br/wp-content/uploads/2021/10/app.jpg",
    "https://scaffoldtecnologia.com.br/wp-content/uploads/2021/10/home-1.jpg",
    "https://scaffoldtecnologia.com.br/wp-content/uploads/2021/10/page-1.png",
  ];
```


#### Carousel Grid;

```dart
CarouselGrid(
    height: 285,
    width: 400,
    imageNetwork: true,
    listUrlImages: imagesUrls,
    iconBack: const Icon(
      Icons.arrow_back,
      color: Colors.white,
    ),
  ),
```
