public virtual class Advent2022_dayGeneric {
  protected Integer cpuTimeStart;
  protected final List<String> INPUT;
  protected final Integer INPUT_SIZE;
  protected final String WHAT_FUCKING_DAY_IS_IT;

  public Advent2022_dayGeneric(String WHAT_FUCKING_DAY_IS_IT) {
    this.WHAT_FUCKING_DAY_IS_IT = WHAT_FUCKING_DAY_IS_IT;
    String fileName = 'advent22Day' + WHAT_FUCKING_DAY_IS_IT;
    if (!Advent2022_handler.isFullRun) {
      fileName += 'TEST';
    }
    INPUT = [
        SELECT Body
        FROM StaticResource
        WHERE Name = :fileName
        LIMIT 1
      ][0]
      .Body.toString()
      .split('\n');
    INPUT_SIZE = INPUT.size();
    cpuTimeStart = Limits.getCpuTime();
  }

  public virtual List<Integer> part1() {
    return null;
  }
  public virtual List<Integer> part2() {
    return null;
  }

  public class ReturnWrapper {
    Integer solveValue;
    Integer cpuUsed;

    public ReturnWrapper(Integer solveValue, Integer cpuUsed) {
      this.solveValue = solveValue;
      this.cpuUsed = cpuUsed;
    }
  }
}
