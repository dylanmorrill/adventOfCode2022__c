public class Advent2022_handler {
  private Integer day;
  private Integer part;

  public Advent2022_handler(Integer day, Integer part) {
    this.day = day;
    this.part = part;
  }

  public void execute() {
    String debugString = debugStartPrint();
    Advent2022_dayGeneric currentDayClass = (Advent2022_dayGeneric)
      Type.forName('Advent2022_day' + day).newInstance();
    switch on part{
      when 1 {
        debugString += currentDayClass.part1();
      } when 2 {
        debugString += currentDayClass.part2();
      }
    }
    debugString += debugEndPrint();
    System.debug(LoggingLevel.ERROR, debugString);
  }

  private String debugStartPrint() {
    String debugString = '\n';
    for (Integer i=0; i<40; i+=2) {
      for (Integer j=0; j<i; j++) {
        debugString += '*';
      }
        debugString += '\n';
    }
    debugString += '\n' + DEBUG_SPACER_LINE + ' DAY ' + day + ' ' +
      DEBUG_SPACER_LINE + '\n\n' +
      DEBUG_SPACER_LINE + ' PART ' + part + ' ' +
      DEBUG_SPACER_LINE + '\n\n' + DEBUG_SPACER_LINE + ' ANSWER: ';

    return debugString;
  }


  private String debugEndPrint() {
    String debugString = DEBUG_SPACER_LINE + '\n\n';
    for (Integer i=40; i>0; i-=2) {
      for (Integer j=0; j<i; j++) {
        debugString += '*';
      }
      debugString += '\n';
    }
    return debugString;
  }

  private static final String DEBUG_SPACER_STAR = '**************************' +
    '************************************************************';
  private static final String DEBUG_SPACER_LINE  = '-------------------------' +
    '-------------------';
}