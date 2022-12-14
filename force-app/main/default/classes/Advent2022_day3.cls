public with sharing class Advent2022_day3 extends Advent2022_dayGeneric {
  private final Integer LOWER_CASE_SUBTRACTOR = 96;
  private final Integer UPPER_CASE_MAX = 90;
  private final Integer UPPER_CASE_SUBTRACTOR = 38;

  public Advent2022_day3() {
    super('3');
  }

  public override List<Integer> part1() {
    Integer sumScore = 0;
    for (String itemLists : INPUT) {
      Integer middleOfString = itemLists.length() / 2;
      Set<Integer> firstCompItems = getCompartmentInts(
        itemLists.substring(middleOfString)
      );
      Set<Integer> secondCompItems = getCompartmentInts(
        itemLists.substring(0, middleOfString)
      );
      firstCompItems.retainAll(secondCompItems);
      sumScore += new List<Integer>(firstCompItems)[0];
    }
    return new List<Integer>{ sumScore, Limits.getCpuTime() - cpuTimeStart };
  }

  public override List<Integer> part2() {
    Integer sumScore = 0;
    for (Integer i = 0; i < INPUT.size() - 2; i += 3) {
      Set<Integer> firstElfsStuff = getCompartmentInts(INPUT[i]);
      firstElfsStuff.retainAll(getCompartmentInts(INPUT[i + 1]));
      firstElfsStuff.retainAll(getCompartmentInts(INPUT[i + 2]));
      sumScore += new List<Integer>(firstElfsStuff)[0];
    }
    return new List<Integer>{ sumScore, Limits.getCpuTime() - cpuTimeStart };
  }

  private Set<Integer> getCompartmentInts(String itemList) {
    Set<Integer> returnList = new Set<Integer>();
    for (Integer i : itemList.trim().getChars()) {
      returnList.add(
        i <= UPPER_CASE_MAX
          ? i - UPPER_CASE_SUBTRACTOR
          : i - LOWER_CASE_SUBTRACTOR
      );
    }
    return returnList;
  }
}
