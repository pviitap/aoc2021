BEGIN { 
	FS=" -> "
	width=1000
	height=1000
	for (y=0;y<height;y++) {
		for (x=0;x<width;x++) {
			map[y][x] = "."
		}
	}
}
{
	split($1,line1,",")
	split($2,line2,",")
	x1 = line1[1]
	y1 = line1[2]
	x2 = line2[1]
	y2 = line2[2]

	for (y=y1;y<=y2;y++) {
		for (x=x1;x<=x2;x++) {
			if (x1 == x2 || y1 == y2) {
				if (map[y][x] == ".") {
					map[y][x] = 1
				} else {
					map[y][x]++
				}
			}
		}
	}
	for (y=y2;y<=y1;y++) {
		for (x=x2;x<=x1;x++) {
			if (x1 == x2 || y1 == y2) {
				if (map[y][x] == ".") {
					map[y][x] = 1
				} else {
					map[y][x]++
				}
			}
		}
	}

}
END {

	points = 0
	for (y=0;y<height;y++) {
		row = ""
		for (x=0;x<width;x++) {
			if (map[y][x] != ".") {
				if (map[y][x] > 1) points++
			}
			row = row map[y][x]
		}
		#print row
	}
	print points
	
}

