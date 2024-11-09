import 'package:flutter/material.dart';

extension DoubleToEdgeInsets on double {
  EdgeInsets get paddingAll => EdgeInsets.all(this);
  EdgeInsets get paddingOnlyBottom => EdgeInsets.only(bottom: this);
  EdgeInsets get paddingOnlyTop => EdgeInsets.only(top: this);
  EdgeInsets get paddingOnlyLeft => EdgeInsets.only(left: this);
  EdgeInsets get paddingOnlyRight => EdgeInsets.only(right: this);
}

extension ListOfDoubleToEdgeInsets on List<double> {
  EdgeInsets get fromLTRB {
    if (length != 4) {
      // TODO Handle this case
      return EdgeInsets.zero;
    }
    return EdgeInsets.fromLTRB(this[0], this[1], this[2], this[3]);
  }
}

extension DoubleToSizedBox on double {
  SizedBox get verticalSpace => SizedBox(height: this);
  SizedBox get horizontalSpace => SizedBox(width: this);
}