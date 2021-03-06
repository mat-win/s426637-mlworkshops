wc -l wikiniews_results.tsv > lwierszy.txt

cut -f2 wikiniews_results.tsv > hypothesis.txt
cut -f3 wikiniews_results.tsv > reference.txt


awk 'BEGIN{FS=OFS="\t"}{print $0,"(sp1_"NR")"}' < reference.txt > reference.trn

awk 'BEGIN{FS=OFS="\t"}{print $0,"(sp1_"NR")"}' < hypothesis.txt > hypothesis.trn

sclite -f 0 -r reference.trn trn -h hypothesis.trn trn -e utf-8 -i rm -o all stdout | grep 'Scores' > score

cat score | tail -n 10

cat score | awk 'BEGIN{OFS="\t"}{print $6, $7, $8, $9}' | awk '{print ($2 + $3 + $4)/($2 + $3 + $1)}' | tail -n 10

cat score | awk 'BEGIN{OFS="\t"}{print $6, $7, $8, $9}' | awk '{print ($2 + $3 + $4)/($2 + $3 + $1)}' > wer_all.txt


awk '{ sum += $1; n++ } END { print sum / n; }' < wer_all.txt >> wer.tsv

paste wikiniews_results.tsv wer.txt > wikinews_results.tsv
rm wikiniews_results.tsv

calc(){ awk "BEGIN { print "$*" }"; }
all_lines=$( wc -l < wer_all.txt )
lines_with_0=$( grep -c '^0$' wer_all.txt )
calc $lines_with_0/$all_lines >> srr.txt

tail -n 50 wer.txt | sponge wer.txt
tail -n 50 srr.txt | sponge srr.txt






