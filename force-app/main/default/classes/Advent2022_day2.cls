public with sharing class Advent2022_day2 extends Advent2022_dayGeneric {
  private Integer TIE_POINTS = 3;
  private Integer WIN_POINTS = 3;
  private Map<String, String> CHAR_TO_OPPS_MOVE = new Map<String, String> {
    'A' => 'R',
    'B' => 'P',
    'C' => 'S'};
  private Map<String, String> CHAR_TO_VALUE_MAP = new Map<String, String> {
    'X' => 'R',
    'Y' => 'P',
    'Z' => 'S'};
  private Map<String, InfoAboutRocksPapersAndScissors> CHAR_TO_SCORE_MAP =
    new Map<String, InfoAboutRocksPapersAndScissors> {
    'R' => new InfoAboutRocksPapersAndScissors('P', 'S', 1),
    'P' => new InfoAboutRocksPapersAndScissors('S', 'R', 2),
    'S' => new InfoAboutRocksPapersAndScissors('R', 'P', 3)};

  public Advent2022_day2() {
    super('2');
  }

  public override Integer part1() {
    Integer finalScore = 0;
    for (String gameInput : INPUT) {
      String oppsMove = CHAR_TO_OPPS_MOVE.GET(gameInput.split('')[0]);
      String myMove = CHAR_TO_VALUE_MAP.get(gameInput.split('')[2]);
      finalScore += CHAR_TO_SCORE_MAP.get(myMove).howMuchIsThisFuckingThingWorth;
      if (oppsMove == myMove) {
        finalScore += TIE_POINTS;
      } else if (CHAR_TO_SCORE_MAP.get(myMove).thingThatIKill == oppsMove) {
        finalScore += WIN_POINTS;
      }
    }
    return finalScore;
  }

  public override Integer part2() {
    Integer finalScore = 0;
    for (String gameInput : INPUT) {
      String oppsMove = CHAR_TO_OPPS_MOVE.GET(gameInput.split('')[0]);
      String myMoveEncrypted = gameInput.split('')[2];
      String myMove;
      switch on myMoveEncrypted {
        when 'X' {
          myMove = CHAR_TO_SCORE_MAP.get(oppsMove).thingThatIKill;
        } when 'Y' {
          myMove = oppsMove;
          finalScore += TIE_POINTS;
        } when 'Z' {
          myMove = CHAR_TO_SCORE_MAP.get(oppsMove).thingThatKillsMe;
          finalScore += WIN_POINTS;
        }
      }
      finalScore +=
        CHAR_TO_SCORE_MAP.get(myMove).howMuchIsThisFuckingThingWorth;
    }
    return finalScore;
  }

  private class InfoAboutRocksPapersAndScissors {
    private String thingThatKillsMe;
    private String thingThatIKill;
    private Integer howMuchIsThisFuckingThingWorth;

    private InfoAboutRocksPapersAndScissors(String thingThatKillsMe,
      String thingThatIKill, Integer howMuchIsThisFuckingThingWorth) {

      this.thingThatKillsMe = thingThatKillsMe;
      this.thingThatIKill = thingThatIKill;
      this.howMuchIsThisFuckingThingWorth = howMuchIsThisFuckingThingWorth;
    }
  }
}
