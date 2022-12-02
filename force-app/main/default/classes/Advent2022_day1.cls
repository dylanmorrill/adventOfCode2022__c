public with sharing class Advent2022_day1 extends Advent2022_dayGeneric {
  public Advent2022_day1() {
    super('1');
  }

  public override Integer part1() {
    Integer howMuchDoesBigBoyElfHave;
    Integer currentSum = 0;
    for (String calorieCount : INPUT) {
      if (String.isblank(calorieCount)) {
        if (howMuchDoesBigBoyElfHave == null ||
          currentSum > howMuchDoesBigBoyElfHave) {

          howMuchDoesBigBoyElfHave = currentSum;
        }
        currentSum = 0;
        continue;
      }
      currentSum += Integer.valueOf(calorieCount);
    }
    return howMuchDoesBigBoyElfHave;
  }

  public override Integer part2() {
    Integer currentSum = 0;
    List<Integer> allTheElfsCalories = new List<Integer>();
    for (String calorieCount : INPUT) {
      if (String.isblank(calorieCount)) {
        allTheElfsCalories.add(currentSum);
        currentSum = 0;
        continue;
      }
      currentSum += Integer.valueOf(calorieCount);
    }
    Integer howManyElfs = allTheElfsCalories.size()-1;
    allTheElfsCalories.sort();
    return allTheElfsCalories[howManyElfs-2]
      + allTheElfsCalories[howManyElfs-1] + allTheElfsCalories[howManyElfs];
  }
}