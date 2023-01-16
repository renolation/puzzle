import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart';

import '../domains/puzzle.dart';



final listImageControllerProvider = StateNotifierProvider.autoDispose<ListImageController, List<List<Puzzle>>>((ref){
  return ListImageController();
});

class ListImageController extends StateNotifier<List<List<Puzzle>>> {
  ListImageController(): super([]);

   splitImage(Uint8List input)  {
    img.Image?  image =  cropCenterSquare(img.decodeImage(input));
    int x = 0, y = 0;
    int width = (image!.width / 3).floor();
    int height = (image.height / 3).floor();

    // split image to parts
    List<img.Image> parts = <img.Image>[];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        parts.add(img.copyCrop(image, x: x, y: y, width: width, height: height));
        x += width;
      }
      x = 0;
      y += height;
    }

    List<Puzzle> output = [];

    for(int i = 0; i< parts.length;i++){
      img.Color color = img.ColorRgba8(Colors.red.red,Colors.red.green,Colors.red.blue,Colors.red.alpha);
      Puzzle puzzle = Puzzle(unit8List: img.encodeJpg(parts[i]), index: i);
      if(i == parts.length -1){
        img.fill(parts[i], color: color);
        puzzle=  puzzle.copyWith(unit8List: img.encodeJpg(parts[i]));
        puzzle = puzzle.copyWith(isHide: true);
      }
      output.add(puzzle);
     }
    List<List<Puzzle>> matrix = List.generate(3, (i) => output.sublist(i*3, i*3+3));

    state = matrix;
    // return output;
  }

  img.Image? cropCenterSquare(img.Image? image) {
    int width = image!.width;
    int height = image.height;
    int left = 0;
    int top = 0;
    int right = 0;
    int bottom = 0;

    final shorterSide = width > height ? height : width;
    img.Image cropped = img.copyCrop(image,
        x: width ~/ 2 - shorterSide ~/ 2,
        y: height ~/ 2 - shorterSide ~/ 2,
        width: shorterSide,
        height: shorterSide);
    return cropped;
  }

  List<List<int>> detectNeighbors(List<List<Puzzle>> matrix, List<int> location) {
    List<List<int>> result = [];
    int x = location[0];
    int y = location[1];

    for (int i = x - 1; i <= x + 1; i++) {
      for (int j = y - 1; j <= y + 1; j++) {
        if (i >= 0 && i < 3 && j >= 0 && j < 3) {
          if (matrix[i][j].isHide) {
            result.add([i, j]);
          }
        }
      }
    }
    return result;
  }

  List<List<Puzzle>>  swapNeighbors(List<List<Puzzle>> matrix, List<int> location1, List<int> location2) {
    int x1 = location1[0];
    int y1 = location1[1];
    int x2 = location2[0];
    int y2 = location2[1];

    Puzzle temp = matrix[x1][y1];
    matrix[x1][y1] = matrix[x2][y2];
    matrix[x2][y2] = temp;
    return matrix;
  }

  void swapNeighborsWithValueZero(List<int> location) {
    List<List<int>> neighborsWithValueZero = detectNeighbors(state, location);
    List<List<Puzzle>> matrix = [];
    if (neighborsWithValueZero.isNotEmpty) {
      for (var n in neighborsWithValueZero) {
        matrix = swapNeighbors(state, location, n);
        state = [...matrix];
        print('build');
      }
    } else {
      print('wrong');
    }

  }


}