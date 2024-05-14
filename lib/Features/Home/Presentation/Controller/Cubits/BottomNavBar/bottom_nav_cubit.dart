import 'package:bloc/bloc.dart';
import 'bottom_nav_state.dart';




class BottomNavCubit extends Cubit<BottomNavStates>
{
  BottomNavCubit() : super(BottomNavInitial());

  int currentIndex = 3;

  changeSelectedIndex(int newIndex)
  {
    currentIndex = newIndex;
    emit(IndexChanged());
  }
}
