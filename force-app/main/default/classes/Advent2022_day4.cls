public with sharing class Advent2022_day4 extends Advent2022_dayGeneric {
  public Advent2022_day4() {
    super('4');
  }

  public override List<Integer> part1() {
    Integer numFullyContained = 0;
    for (String assignmentsString : INPUT) {
      Assignment firstAssignment = new Assignment(
        assignmentsString.split(',')[0].trim()
      );
      Assignment secondAssignment = new Assignment(
        assignmentsString.split(',')[1].trim()
      );
      if (
        (firstAssignment.startPos >= secondAssignment.startPos &&
        firstAssignment.endPos <= secondAssignment.endPos) ||
        (secondAssignment.startPos >= firstAssignment.startPos &&
        secondAssignment.endPos <= firstAssignment.endPos)
      ) {
        numFullyContained++;
      }
    }
    return new List<Integer>{
      numFullyContained,
      Limits.getCpuTime() - cpuTimeStart
    };
  }

  public override List<Integer> part2() {
    Integer numFullyContained = 0;
    for (String assignmentsString : INPUT) {
      Assignment firstAssignment = new Assignment(
        assignmentsString.split(',')[0].trim()
      );
      Assignment secondAssignment = new Assignment(
        assignmentsString.split(',')[1].trim()
      );
      if (
        (firstAssignment.startPos >= secondAssignment.startPos &&
        firstAssignment.startPos <= secondAssignment.endPos) ||
        secondAssignment.startPos >= firstAssignment.startPos &&
        secondAssignment.startPos <= firstAssignment.endPos
      ) {
        numFullyContained++;
      }
    }
    return new List<Integer>{
      numFullyContained,
      Limits.getCpuTime() - cpuTimeStart
    };
  }

  private class Assignment {
    Integer startPos;
    Integer endPos;

    private Assignment(String assignmentString) {
      startPos = Integer.valueOf(assignmentString.split('-')[0]);
      endPos = Integer.valueOf(assignmentString.split('-')[1]);
    }
  }
}
