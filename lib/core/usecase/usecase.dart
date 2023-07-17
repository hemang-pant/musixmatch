import '../resources/data_state.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params); 
}