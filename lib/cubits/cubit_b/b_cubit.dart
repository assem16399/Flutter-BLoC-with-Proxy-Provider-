import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'b_states.dart';

class BCubit extends Cubit<BState> with ChangeNotifier {
  BCubit(this.numbersList) : super(BInitialState());

  List<int>? numbersList;

  void updateNumbers(List<int>? numbersList) {
    this.numbersList = numbersList;
    print(this.numbersList!.length.toString());
    emit(BChangeState());
  }

  List<int> get numbers {
    return [...?numbersList];
  }
}
