wc -l wikiniews_results.tsv > lwierszy.txt

cut -f2 wikiniews_results.tsv > hypothesis.txt
cut -f3 wikiniews_results.tsv > reference.txt


awk 'BEGIN{FS=OFS="\t"}{print $0,"(sp1_"NR")"}' < reference.txt > reference.trn

awk 'BEGIN{FS=OFS="\t"}{print $0,"(sp1_"NR")"}' < hypothesis.txt > hypothesis.trn

sclite -f 0 -r reference.trn trn -h hypothesis.trn trn -e utf-8 -i rm -o all stdout | grep 'Scores' > score

cat score | tail -n 20

cat score | awk 'BEGIN{FS=OFS="\t"}{print $6, $7, $8, $9}' | awk 'BEGIN{FS=OFS="\t"}{print ($2, $3, $4)/($2, $3, $1}' tail -n 20




