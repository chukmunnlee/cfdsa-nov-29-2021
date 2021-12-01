for I in *.png; do
	IFS="."
	set $I
	IFS=" "
	convert ${1}.png ${1}.gif
done
