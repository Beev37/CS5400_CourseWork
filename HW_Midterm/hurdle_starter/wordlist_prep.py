# A simple Python script for converting the
# Collins Scrabble Wordlist into a Prolog
# knowledge base.

f = open('CollinsScrabbleWords.txt', "r")
out = open('wordlist.pl', 'w')
for line in f:
    line = line.strip().lower()
    if len(line) == 5:
        out.write('word('+str(list(line))+').\n')
