# PARAMETER_GUIDE FILE
****Hudgkin-Huxley model****
dv/dt=(I-g_K*n^4(v-v_K)-g_Na*m^3*h(v-v_Na)-g_L(v-v_L))/C
dn/dt=(n_infty(v)-n)/tau_n(v)
dm/dt=(m_infty(v)-m)/tau_m(v)
dh/dt=(h_infty(v)-h)/tau_h(v)

v(t) is the electrical potential across the membrane
n(t) is activation variable of potassium channel
m(t) is activation variable of sodium channel
h(t) is inactivation variable of sodium channel

I    is an external current applying to the membrane
C    is the membrane capacity
g_K  is maximal conductance of the potassium ion channel
g_Na is maximal conductance of the sodium ion channel
g_L  is maximal conductance of the leak channel
v_K  is  the Nernst equilibrium potential of the potassium ion channel
v_Na is  the Nernst equilibrium potential of the sodium ion channel
v_L  is  the Nernst equilibrium potential of the leak channel

------References------
Hodgkin, Alan L., and Andrew F. Huxley.
 "A quantitative description of membrane current and its
 application to conduction and excitation in nerve."
 The Journal of physiology 117.4 (1952): 500-544.‏
 
 Hodgkin, Allan L., and Andrew F. Huxley.
"Currents carried by sodium and potassium ions through 
the membrane of the giant axon of Loligo." 
The Journal of physiology 116.4 (1952): 449-472.‏
---------------------- 
 

****Fitzhugh-Nagumo model****
dv/dt=v-v^3/3-w+I
dw/dt=a(v+b-cw)

v(t) is the electrical potential across the membrane
w(t) is the recovery variable showing activation of an outward current

I    is an external current applying to the membrane
a, b and c are constants

------References------
FitzHugh, Richard.
"Mathematical models of threshold phenomena in the
nerve membrane." 
The bulletin of mathematical biophysics 17.4 (1955): 257-278.‏

FitzHugh, Richard.
"Impulses and physiological states in theoretical
models of nerve membrane."
Biophysical journal 1.6 (1961): 445-466.‏
---------------------- 

****Rose-Hindmarsh model****
dx/dt=y-ax^3+bx^2-z+I 
dy/dt=c-dx^2-y 
dz/dt=r(s(x-X_r)-z)

x(t) is the electrical potential across the membrane
y(t) is the spiking variable and measures the rate of transportation of sodium and potassium ions
z(t) adaptation current

I    is an external current applying to the membrane
a, b, c and d modeld the working of the fast ion channels
r models the working of the slow ion channels       
s and X_r allow the model to describe the a great variety of dynamic behavior such as chaotic dynamics
 
------References------
‏Rose, R. M., and J. L. Hindmarsh.
"The assembly of ionic currents in a thalamic neuron I.
The three-dimensional model."
Proceedings of the Royal Society of London. B. Biological Sciences 237.1288 (1989): 267-288.‏

Hindmarsh, James L., and R. M. Rose. 
"A model of neuronal bursting using three coupled first
order differential equations." 
Proceedings of the Royal society of London. Series B. Biological sciences 221.1222 (1984): 87-102.‏
---------------------- 

****Thalamic model****
dv/dt=(-g_L(v-e_L)-g_Na*m_infty^3*h(v-e_Na)-g_K((0.75(1-h))^4)(v-e_K)-g_T*p_infty^2(v-e_T)+I)/C
dh/dt=(h_infty-h)/tau_h
dr/dt=(r_infty-r)/tau_r

v(t) is membrane voltage
h(t), r(t)  are the gating variables of the neuron describing the modulation of the flow of ions across the neural membrane

I    is an external current applying to the membrane
C    is the membrane capacity
g_K  is maximal conductance of the potassium ion channel
g_Na is maximal conductance of the sodium ion channel
g_L  is maximal conductance of the leak channel
g_T  is maximal conductance of the low-throshold calcium channel 
e_K  is  the Nernst equilibrium potential of the potassium ion channel
e_Na is  the Nernst equilibrium potential of the sodium ion channel
e_L  is  the Nernst equilibrium potential of the leak ion channel
e_T  is  the Nernst equilibrium potential of the low-throshold calcium ion channel

------References------
Rubin, Jonathan E., and David Terman.
"High frequency stimulation of the subthalamic nucleus
eliminates pathological thalamic rhythmicity in a computational model."
Journal of computational neuroscience 16.3 (2004): 211-235.‏
---------------------- 