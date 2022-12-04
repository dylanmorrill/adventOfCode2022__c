public class Advent2022_handler {
  private Integer day;
  private Integer part;
  private final String DEBUG_STRING_TEMPLATE = 'Solve: {0} CPU: {1}';

  public Advent2022_handler(Integer day, Integer part) {
    this.day = day;
    this.part = part;
  }

  public void execute() {
    Advent2022_dayGeneric currentDayClass = (Advent2022_dayGeneric) Type.forName(
        'Advent2022_day' + day
      )
      .newInstance();
    List<Integer> solveValues;
    switch on part {
      when 1 {
        solveValues = currentDayClass.part1();
      }
      when 2 {
        solveValues = currentDayClass.part2();
      }
    }
    System.debug(
      LoggingLevel.ERROR,
      String.format(DEBUG_STRING_TEMPLATE, solveValues)
    );
  }
}
