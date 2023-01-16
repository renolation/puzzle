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

   splitImage(Uint8List input, int length)  {
    img.Image?  image =  cropCenterSquare(img.decodeImage(input));
    int x = 0, y = 0;
    int width = (image!.width / length).floor();
    int height = (image.height / length).floor();

    // split image to parts
    List<img.Image> parts = <img.Image>[];
    for (int i = 0; i < length; i++) {
      for (int j = 0; j < length; j++) {
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
    List<List<Puzzle>> matrix = List.generate(length, (i) => output.sublist(i*length, i*length+length));
    matrix.shuffle();
    late int falseRow, falseCol;

    for (int row = 0; row < matrix.length; row++) {
      for (int col = 0; col < matrix[row].length; col++) {
        if (matrix[row][col].isHide) {
          falseRow = row;
          falseCol = col;
          break;
        }
      }
    }
    var falseItem = matrix[falseRow][falseCol];
    matrix[falseRow][falseCol] =
    matrix[matrix.length - 1][matrix[matrix.length - 1].length - 1];
    matrix[matrix.length - 1][matrix[matrix.length - 1].length - 1] = falseItem;
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

    if (x > 0 && matrix[x-1][y].isHide)  result.add([x-1, y]);
    if (x < matrix.length - 1 && matrix[x+1][y].isHide) result.add([x+1, y]);
    if (y > 0 && matrix[x][y-1].isHide) result.add([x, y-1]);
    if (y < matrix[0].length - 1 && matrix[x][y+1].isHide) result.add([x, y+1]);
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

  List<List<int>> swapNeighborsWithValueZero(List<int> location) {
    List<List<int>> neighborsWithValueZero = detectNeighbors(state, location);
    return neighborsWithValueZero;
  }
  void swap(List<List<int>> neighborsWithValueZero, List<int> location ){
    List<List<Puzzle>> matrix = [];
    for (var n in neighborsWithValueZero) {
      matrix = swapNeighbors(state, location, n);
      state = [...matrix];
      print('build');
    }
  }

}