import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_test/cubits/cubit_a/a_state.dart';

class ACubit extends Cubit<AState> with ChangeNotifier {
  ACubit() : super(AInitialState());

  final List<int> _numbers = [];

  List<int> get numbers {
    return [..._numbers];
  }

  void addToNumbers() {
    _numbers.add(1);
    emit(AChangeState());
    notifyListeners();
  }
}
