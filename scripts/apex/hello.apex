// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

new Advent2022_handler(4,2).execute();

String alphabet = 'abcdefghijklmnopqrstuvwxyz';
String alphabetCaps = alphabet.toUpperCase();

List<Integer> alphabetListLower = alphabet.getChars();
List<Integer> alphabetListUpper = alphabetCaps.getChars();

List<Integer> alphabetListLowerFixed = new List<Integer>();
List<Integer> alphabetListUpperFixed = new List<Integer>();

for (Integer i : alphabetListLower) {
  alphabetListLowerFixed.add(i-96);
}
for (Integer i : alphabetListUpper) {
  alphabetListUpperFixed.add(i-38);
}

System.debug(LoggingLevel.ERROR, 'LOWER');
for (Integer i : alphabetListLowerFixed) {
  System.debug(LoggingLevel.ERROR, i);
}
System.debug(LoggingLevel.ERROR, 'UPPER');
for (Integer i : alphabetListUpperFixed) {
  System.debug(LoggingLevel.ERROR, i);
}

