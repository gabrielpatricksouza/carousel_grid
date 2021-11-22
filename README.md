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
  <img src="https://github.com/gabrielpatricksouza/carousel_grid/blob/master/example/demo/example.gif" alt="Carousel Grid" width="300" height="650" />
</p>


## Features
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

## License

Copyright (c) 2021 Gabriel Patrick Souza

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
