import os

path = os.getcwd()

dirs = os.listdir(path)

for d in dirs:
	if d.count(".") == 0:
		arq = os.listdir(path + "/" + d)

		for a in arq:
			if a.count(".html.haml") > 0:
				f = open(path + "/" + d + "/" + a, "r")
				lines = f.readlines()
				f.close()
				mudou = False
				for l in range(len(lines)):
					if lines[l].count(":unit => \"R$\")") > 0:
						mudou = True
						print lines[l]
						lines[l] = lines[l].replace(')', ', :separator => ",", :delimiter => ".")')
						print lines[l]

				if mudou:
					print path + "/" + d + "/" + a
					f = open(path + "/" + d + "/" + a, "w")
					for l in lines:
						f.write(l)
					f.close()

