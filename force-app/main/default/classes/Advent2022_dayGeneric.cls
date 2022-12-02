public virtual class Advent2022_dayGeneric {
  protected final List<String> INPUT;
  protected final Integer INPUT_SIZE;
  protected final String WHAT_FUCKING_DAY_IS_IT;

  public Advent2022_dayGeneric(String WHAT_FUCKING_DAY_IS_IT) {
    this.WHAT_FUCKING_DAY_IS_IT = WHAT_FUCKING_DAY_IS_IT;
    String fileName = 'advent22Day' + WHAT_FUCKING_DAY_IS_IT;
    INPUT = [select Body
            from StaticResource
            where Name = :fileName
            limit 1][0].Body.toString().split('\n');
    INPUT_SIZE = INPUT.size();
  }

  public virtual Integer part1(){return null;}
  public virtual Integer part2(){return null;}
}