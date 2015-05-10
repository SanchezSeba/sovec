def generateSeatsPos(reserved):
	s = []
	for seat in reserved:
		s.append(seats[seat[0]])
	return s

def generatePosSeats(reserved):
	return pos[reserved]


# Math entre numero de asiento y ubicacion
seats = {}
for i in range(1,13):
	seats[i] = str(1) + '_' + str(i + 2)
for i in range(13,25):
	seats[i] = str(2) + '_' + str(i - 10)
for i in range(0,7):
	for j in range(25+12*i,28+12*i):
		seats[j] = str(4+i) + '_' + str(j - (24 + 12*i))
	for j in range(28+12*i,34+12*i):
		seats[j] = str(4+i) + '_' + str(j - (22 + 12*i))
	for j in range(34+12*i,37+12*i):
		seats[j] = str(4+i) + '_' + str(j - (20 + 12*i))

pos = {v: k for k, v in seats.items()}