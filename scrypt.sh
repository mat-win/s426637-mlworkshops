wc -l wikiniews_results.tsv > lwierszy.txt
awk 'BEGIN{FS=OFS="\t"}{print $0,"(sp1_"NR")"}' wikiniews_results.tsv > wikiniews_results.trn
ls -l
