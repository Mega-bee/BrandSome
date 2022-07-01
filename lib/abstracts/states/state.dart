import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class States  {
  bool lis;
  Widget getUI(BuildContext context);

  Widget getAlert(BuildContext context);

  States(this.lis);

}
