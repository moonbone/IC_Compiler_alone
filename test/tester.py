#!/usr/bin/python
import os
import sys
import subprocess

os.chdir(os.path.dirname(sys.argv[0]))
print os.getcwd()
for f in filter(lambda x:x.endswith('.ic'),os.listdir('.')):
	try:
		retText = subprocess.check_output('java -cp ../bin:/usr/share/java/cup.jar IC.Main %s 2>&1'%f,shell=True)
	except subprocess.CalledProcessError,e:
		retText = e.output
	if open(f[:-2]+'tokens','r').read() == retText.replace('\n','\r\n'):
		print "Success on %s" % f
	else:
		print "Failed on %s" % f
		open(f[:-2]+'result','w').write(retText.replace('\n','\r\n'))
	

