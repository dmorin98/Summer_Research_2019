import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
import glob, os
from pathlib import Path
import math
from numpy.polynomial.polynomial import polyfit

innerDiameter = 0.76 #In cm
initalFlow = 200
finalFlow = 1300
incrementFlow = 100

fname = Path.home() / 'Desktop' / 'DevinFlowData'
finalFlow += 1
currFlow = initalFlow


files = []
for r, d, f in os.walk(fname):
    for file in f:
        if '.txt' in file:
            files.append(os.path.join(r, file))


def processdata(fname, titleFlow):
	data = np.genfromtxt(fname, delimiter='\t')

	magn = np.sqrt(data[:, 0]**2 + data[:, 1]**2)

	first = 13
	spacing = 16

	peaks = []
	times = []

	i = first + spacing
	while i < len(magn)/3:
		peaks.append(magn[i])
		times.append(data[i, 2])
		i += 2 * spacing

	func = lambda x, a, b : a + b*x

	popt,_ = curve_fit(func, times, peaks)

	plt.plot(times, peaks)
	plt.plot(times, popt[0] + np.multiply(times, popt[1]))
	plt.plot(data[:, 2], magn)
	plt.xlabel('Time(us)')
	plt.ylabel('Magnitude (arbitrary)')
	plt.title(""+str(titleFlow)+"CCM Flow")
	# plt.show()
	# plt.close("all")

	plt.show(block=False)
	plt.pause(0.2)
	plt.close()
	

	print('A = ' + str(popt[0]))
	print('B = ' + str(popt[1]))

	return -popt[1]/popt[0]
	# return data
	


points = []
for f in files:
	points.append(processdata(f,currFlow))
	currFlow += incrementFlow

# data = processdata(files[0])

# print(str(data))

area = math.pi*(innerDiameter/2)**2 #Area of cross section in cm^2
flowVel = list(range(initalFlow, finalFlow, incrementFlow))
flowVel1= np.multiply(flowVel, 1/(100*area*60))

plt.plot(flowVel1, points)
plt.xlabel('Flow Velocity (m/s)')
plt.ylabel('-B/A')
# Fit with polyfit

# b, m = polyfit(flowVel1, points, 1)
# plt.plot(flowVel1, b + np.multiply(m, points), '-')

plt.show()