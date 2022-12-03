public class Advent2022_day2 extends Advent2022_dayGeneric {
  private Integer TIE_POINTS = 3;
  private Integer WIN_POINTS = 6;
  private Map<String, InfoAboutRocksPapersAndScissors> CHAR_TO_SCORE_MAP = new Map<String, InfoAboutRocksPapersAndScissors>{
    'R' => new InfoAboutRocksPapersAndScissors('P', 'S', 1),
    'P' => new InfoAboutRocksPapersAndScissors('S', 'R', 2),
    'S' => new InfoAboutRocksPapersAndScissors('R', 'P', 3)
  };
  private final Map<String, Integer> MOVE_TO_POINTS_MAP = new Map<String, Integer>{
    'X' => 0,
    'Y' => TIE_POINTS,
    'Z' => WIN_POINTS
  };

  public Advent2022_day2() {
    super('2');
  }

  public override List<Integer> part1() {
    Integer finalScore = 0;
    for (String gameInput : INPUT) {
      gameInput = formatBothMoves(gameInput);
      String oppsMove = gameInput.split('')[0];
      String myMove = gameInput.split('')[2];
      finalScore += CHAR_TO_SCORE_MAP.get(myMove)
        .howMuchIsThisFuckingThingWorth;
      if (oppsMove == myMove) {
        finalScore += TIE_POINTS;
      } else if (CHAR_TO_SCORE_MAP.get(myMove).thingThatIKill == oppsMove) {
        finalScore += WIN_POINTS;
      }
    }
    return new List<Integer>{ finalScore, Limits.getCpuTime() - cpuTimeStart };
  }

  public override List<Integer> part2() {
    Integer finalScore = 0;

    for (String gameInput : INPUT) {
      gameInput = formatOppsMove(gameInput);
      String myDesiredOutcome = gameInput.split('')[2];
      String myMove = getMyMoveForPart2(
        myDesiredOutcome,
        gameInput.split('')[0]
      );
      finalScore +=
        MOVE_TO_POINTS_MAP.get(myDesiredOutcome) +
        CHAR_TO_SCORE_MAP.get(myMove).howMuchIsThisFuckingThingWorth;
    }
    return new List<Integer>{ finalScore, Limits.getCpuTime() - cpuTimeStart };
  }

  private String getMyMoveForPart2(String myDesiredOutcome, String oppsMove) {
    switch on myDesiredOutcome {
      when 'X' {
        return CHAR_TO_SCORE_MAP.get(oppsMove).thingThatIKill;
      }
      when 'Y' {
        return oppsMove;
      }
      when 'Z' {
        return CHAR_TO_SCORE_MAP.get(oppsMove).thingThatKillsMe;
      }
      when else {
        return null;
      }
    }
  }

  private String formatMyMove(String gameInput) {
    return gameInput.replace('X', 'R').replace('Y', 'P').replace('Z', 'S');
  }

  private String formatOppsMove(String gameInput) {
    return gameInput.replace('A', 'R').replace('B', 'P').replace('C', 'S');
  }
  private String formatBothMoves(String gameInput) {
    gameInput = formatMyMove(gameInput);
    return formatOppsMove(gameInput);
  }

  private class InfoAboutRocksPapersAndScissors {
    private String thingThatKillsMe;
    private String thingThatIKill;
    private Integer howMuchIsThisFuckingThingWorth;

    private InfoAboutRocksPapersAndScissors(
      String thingThatKillsMe,
      String thingThatIKill,
      Integer howMuchIsThisFuckingThingWorth
    ) {
      this.thingThatKillsMe = thingThatKillsMe;
      this.thingThatIKill = thingThatIKill;
      this.howMuchIsThisFuckingThingWorth = howMuchIsThisFuckingThingWorth;
    }
  }
}
