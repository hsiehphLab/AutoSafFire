#!/bin/bash

DATASET="custom"
REF="CHM13_v2.0"

INPUT_FILE="$1"
working_dir="$PWD"
rm -rf ~/.config/chromium/Singleton*

declare -A groups

while read chr st en query gene; do
    key="${chr}_${st}_${en}_${query}"
    if [ -z "${groups[$key]}" ]; then
        groups[$key]="$gene"
    else
        groups[$key]="${groups[$key]}, $gene"
    fi
done < "$INPUT_FILE"



for key in "${!groups[@]}"; do
    IFS='_' read -r chr st en query <<< "$key"
    genes="${groups[$key]}"

    hash="#dataset=$DATASET&ref=$REF&query=${query}_T2T&pos=$chr:$st-$en&save=1&max_bed_items=5000"
    url="https://hsiehphlab.github.io/AutoSafFire/$hash"
#    echo "$url" > ${PWD}/urls.txt
    /bin/chromium-browser --new-window "$url" &
    sleep 16

    cd ~/Downloads
    svg_file="SafFire_${chr}_${st}-${en}.svg"

    new_svg="SafFire_${chr}_${st}-${en}_${query}.svg"
    mv "$svg_file" "$new_svg"

    annotate_text="${chr} ${st}-${en}  ${query}	,${genes}"
    png_file="${chr}_${st}-${en}_${query}.png"

    convert "${new_svg}" -gravity north -background white -fill black -pointsize 18 -size 1000x caption:"${annotate_text}" -gravity north -append "${png_file}"

done

timern=$(date +"%m_%d_%H:%M")


queries=$(ls *.png | cut -d'_' -f3- | sed 's/.png$//' | sort -u)

for q in $queries; do
    files=$(ls *_${q}.png)
    pdf_name="${q}_genes_overlap_${timern}.pdf"
    convert $files "$pdf_name"
done

sleep 5
rm ~/Downloads/*.svg ~/Downloads/*.png
cd $working_dir
mkdir -p plots_PDF
mv ~/Downloads/*.pdf plots_PDF/
killall chromium-browser

