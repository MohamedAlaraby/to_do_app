abstract class CubitStates {}
class CounterInitialState extends CubitStates{
}
class CounterPlusState extends CubitStates{
  final int counterValue;
  CounterPlusState(this.counterValue);
}
class CounterMinusState extends CubitStates{
  final int CounterValue;
  CounterMinusState(this.CounterValue);
}