#!/bin/bash

file="alice.txt"

letters=$(grep -o '[а-яА-ЯёЁ]' $file | wc -l)
echo "Количество букв в книге: $letters"

words=$(cat $file | wc -w)
echo "Количество слов в книге: $words"

firstQueenSentence=$(grep -oE -m 1 '[^.!?]*\bКоролев[а-я]\b[^.!?]*[.!?]' $file)
echo "Первое преложение, в котором упоминается королева: $firstQueenSentence"

teaParticipants=$(grep -oE 'Шляпа|Садовая Соня|Заяц' $file | sort | uniq | tr '\n' ',' | sed 's/,$/\./' | sed 's/,/, /g')
echo "Участники чаепития: $teaParticipants"
