class Calculator {

  int numberA;
  int numberB;

  int sum;
  int wrongSumA;
  int wrongSumB;


  Calculator() {
    generateRandomNumbers();
    calculateSum();
    generateAltAnswers();
  }

  void generateRandomNumbers() {
    numberA = (int)random(1, 5);
    numberB = (int)random(1, 5);
  }

  void calculateSum() {
    sum = numberA + numberB;
  }

  void generateAltAnswers() {
    do {
      wrongSumA = (int)random(1, 8);
    } while (wrongSumA == sum);

    do {
      wrongSumB = (int)random(1, 8);
    } while (wrongSumB == sum || wrongSumB == wrongSumA);
  }

  boolean checkAnswer(int answer) {
    if (answer == sum) {
      return true;
    }
    return false;
  }

  int getNumberA() {
    return numberA;
  }

  int getNumberB() {
    return numberB;
  }

  int getSum() {
    return sum;
  }

  int getWrongSumA() {
    return wrongSumA;
  }

  int getWrongSumB() {
    return wrongSumB;
  }
}
