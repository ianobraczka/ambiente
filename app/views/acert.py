import os

path = os.getcwd()

dirs = os.listdir(path)

for d in dirs:
	if d.count(".") == 0:
		arq = os.listdir(path + "/" + d)

		for a in arq:
			print a
			if a.count(".html.haml") > 0:
				f = open(a, "r")
				lines = f.readlines()
				f.close()
				mudou = False
				for l in lines:
					if l.count(":unit => \"R$\")") > 0:
						mudou = True
						l.replace(":unit => \"R$\")", ":unit => \"R$\", :separator => \",\", :delimiter => \".\")")

				if mudou:
					f = open(a, "w")
					for l in lines:
						f.write(l)
					f.close()

