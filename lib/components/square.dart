import 'package:chess/components/piece.dart';
import 'package:chess/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  final void Function() onSquareTap;
  final bool isValidMove;

  const Square(
      {super.key,
      required this.isWhite,
      required this.piece,
      required this.isSelected,
      required this.isValidMove,
      required this.onSquareTap});

  @override
  Widget build(BuildContext context) {
    Color? squareColor;

    // if selected, square is green
    if (isSelected) {
      squareColor = Colors.green;
    }

    // if valid move, square is lite green
    else if (isValidMove) {
      squareColor = Colors.green[300];
    }

    // otherwise, it's white or black
    else {
      squareColor = isWhite ? foregroundColor : backgroundColor;
    }

    return GestureDetector(
      onTap: onSquareTap,
      child: Container(
        color: squareColor,
        margin: EdgeInsets.all(isValidMove ? 2 : 0),
        child: piece != null
            ? SvgPicture.asset(
                piece!.imagePath,
                colorFilter: ColorFilter.mode(
                    piece!.isWhite ? Colors.white : Colors.black,
                    BlendMode.srcIn),
              )
            : null,
      ),
    );
  }
}
