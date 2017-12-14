#!/usr/bin/env python
# -*- coding: utf-8 -*-

def runCmd(cmd, timeout = 1200):
	if config.IS_WIN:
		print(u'cmd can not run on window!', cmd)
	else:
		# print(u'run cmd => %s' % cmd)
		# process = subprocess.Popen('%s >>%s 2>&1' % (cmd, logfile), shell = True)
		process = subprocess.Popen(cmd, shell = True)
		# process.wait()
		start = datetime.datetime.now()
		while process.poll() is None:
			time.sleep(0.1)
			now = datetime.datetime.now()
			if (now - start).seconds > timeout:
				try:
					process.terminate()
				except Exception,e:
					return None
				return None
		out = process.communicate()[0]
		if process.stdin:
			process.stdin.close()
		if process.stdout:
			process.stdout.close()
		if process.stderr:
			process.stderr.close()
		try:
			process.kill()
		except OSError:
			pass
		return out

if __name__ == '__main__':
	runCmd('python /Users/eddie104/Documents/hongjie/Quick-Cocos2dx/quick/bin/PackageScripts.py -p /Users/eddie104/Documents/hongjie/TimeTown/timetown -o game -b 32')
	# python /Users/eddie104/Documents/hongjie/TimeTown/timetown/tools/encodeRes.py -p /Users/eddie104/Documents/hongjie/TimeTown/timetown -s hongjie104 -k /Users/eddie104/Documents/hongjie/TimeTown/timetown/tools/logo@2x.png
	# python /Users/eddie104/Documents/hongjie/TimeTown/timetown/frameworks/runtime-src/proj.android/build_native.py