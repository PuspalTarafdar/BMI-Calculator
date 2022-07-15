
class Calculator {
  Calculator({required this.height, required this.weight});
  final int height;
  final int weight;

  late double _bmi;

String calculateBMI(){
  _bmi = weight/(height*height/10000);
  
  return _bmi.toStringAsFixed(1);
}

String getresults(){
  if(_bmi>=25)
  {
    return 'OVERWEIGHT';
  }
  else if(_bmi>18.5)
  {
    return 'NORMAL';
  }
  else
  {
    return 'UNDERWEIGHT';
  }
}

String resultinterpretation(){
  if(_bmi>=25)
  {
    return 'You are overweight, control your diet and Exercise more';
  }
  else if(_bmi>18.5)
  {
    return 'Your BMI is normal';
  }
  else
  {
    return 'You are underweight, increase your diet';
  }
}


}
