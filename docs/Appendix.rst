.. _sec-appendix:

Appendix
------------------------
In this section we provide a summary about the task of each file in the toolbox in Table (:numref:`toolbox_functions1`).

.. csv-table:: **Summary of NPDS Toolbox functions (1)**
   :name: toolbox_functions1
   :header: "Function", "Task"
   :widths: 80,60

   ":math:`\texttt{error\_number=Check\_inputs}` :math:`\texttt{(hObject,type,varargin)}`","Check inputs of parameters to determine possible errors in the neural dynamic simulation part."
   ":math:`\texttt{validation=Check\_inputs\_NPD(handles)}`", "Check inputs of parameters to determine possible errors in  neural populations (de)synchronization part."
   ":math:`\texttt{runable=check\_port\_eval(handles)}`", "Activate/deactivate check boxes according to the number of selected options in the neural dynamic simulation part."
   ":math:`\texttt{check\_port\_show(handles,flag)}`", "Make checkboxes visible/invisible according to the selected models in the neural dynamic simulation part."
   ":math:`\texttt{u=control\_input(handles,domain,}` :math:`\texttt{Z,Zp,L2,omega,i,dt,varargin)}`", "Specify the value of control input according to the control strategy in  neural populations (de)synchronization part."
   ":math:`\texttt{control\_user\_defined\_choise(handles)}`", "If there exists the user-defined control input file, open it; otherwise, create a new Matlab file."
   ":math:`\texttt{[phi,L2,thetas,u,sim\_time,x]=}` :math:`\texttt{decoupled\_FD(handles,M,flag)}`", "Apply the finite difference method to solve the population-level partial differential equation of uncoupled neural oscillators."
   ":math:`\texttt{[rho,V,thetas,U,sim\_time,domain]=}` :math:`\texttt{decoupled\_Fourier(handles,M,flag)}`", "Apply the Fourier decomposition method to solve population-level partial differential equation of uncoupled neural oscillators."
   ":math:`\texttt{[phi,L2,thetas,u,sim\_time,domain]=}` :math:`\texttt{decoupled\_RBF(handles,M,flag)}`", "Applying the radial basis function method to solve the population-level partial differential equation of uncoupled neural oscillators."
   ":math:`\texttt{[phi,L2,thetas,u,sim\_time,domain]=}` :math:`\texttt{decoupled\_RBFFD(handles,M,flag)}`", "Apply the radial basis function generated finite difference method to solve the population-level partial differential equation of uncoupled neural oscillators."
   ":math:`\texttt{[phi,L2,thetas,u,sim\_time,domain]=}` :math:`\texttt{decoupled\_spectral(handles,M,flag)}`", "Apply the spectral method to solve the population-level partial differential equation of uncoupled neural oscillators."
   ":math:`\texttt{[dist,diff\_dist]=dist\_def(dist\_model,}` :math:`\texttt{location,concentration,omega,i,}` :math:`\texttt{dt,domain)}`", "Specify the initial and final distributions in neural populations (de)synchronization part."
   
   
.. csv-table:: **Summary of NPDS Toolbox functions (2)**
   :name: toolbox_functions2
   :header: "Function", "Task"
   :widths: 80,60
   
   ":math:`\texttt{[DM] = DistanceMatrix(ds,cnt,differ)}`", "Construct the distance matrix of radial basis function.`"
   ":math:`\texttt{valid=error\_handling(handles,type)}`", "Handle the possible errors and extensions."
   ":math:`\texttt{par=getparams(handles)}`", "Set the values of parameters in the neural dynamic simulation part."
   ":math:`\texttt{temp4=init\_tetha(population,}` :math:`\texttt{phi,N,domain)}`", "Set the initial phases of neural oscillators in the neural populations (de)synchronization part."
   ":math:`\texttt{Initialize\_Dynamic(handles,varargin)}`", "Initialize the parameter of the HH dynamical system by loading the neural dynamic simulation part for the first time."
   ":math:`\texttt{varargout = NeuronDynamic(varargin)}`", "Load the neural dynamic simulation window."
   ":math:`\texttt{u=noisy\_control\_input(handles,domain,}` :math:`\texttt{Z,Zp,L2,B,omega,i,dt,varargin)}`", "Specify the value of noisy system control input according to the control strategy in  neural populations (de)synchronization part."
   ":math:`\texttt{[phi,L2,thetas,u,sim\_time,x]=}` :math:`\texttt{noisy\_decoupled\_FD}` :math:`\texttt{(handles,M,flag)}`", "Apply the finite difference method to solve the noisy population-level partial differential equation of uncoupled neural oscillators."
   ":math:`\texttt{[rho,V,thetas,U,sim\_time,domain]=}` :math:`\texttt{noisy\_decoupled\_Fourier}` :math:`\texttt{(handles,M,flag)}`", "Apply the Fourier decomposition method to solve the noisy population-level partial differential equation of uncoupled neural oscillators."
   ":math:`\texttt{[phi,L2,thetas,u,sim\_time,domain]=}` :math:`\texttt{noisy\_decoupled\_RBF}` :math:`\texttt{(handles,M,flag)}`", "Applying the radial basis function method to solve the noisy population-level partial differential equation of uncoupled neural oscillators."
   ":math:`\texttt{[phi,L2,thetas,u,sim\_time,domain]=}` :math:`\texttt{noisy\_decoupled\_RBFFD}` :math:`\texttt{(handles,M,flag)}`", "Apply the radial basis function generated finite difference method to solve the noisy population-level partial differential equation of uncoupled neural oscillators."
   ":math:`\texttt{[phi,L2,thetas,u,sim\_time,domain]=}` :math:`\texttt{noisy\_decoupled\_spectral}` :math:`\texttt{(handles,M,flag)}`", "Apply the spectral method to solve the noisy population-level partial differential equation of uncoupled neural oscillators."
   ":math:`\texttt{varargout = NPDlab(varargin)}`", "The first function which runs by starting the toolbox."
   ":math:`\texttt{OK\_Panel(handles)}`", "Set upper and lower bounds in the neural dynamic simulation part."
   ":math:`\texttt{OptionPanelActive(handles,flag)}`", "Make slide bar and checkboxes enable or disable according to the models the neural dynamic simulation."
   ":math:`\texttt{Output\_plots(handles,peak,durT,x,phi}` :math:`\texttt{,phif,sim\_time,u,L2,cos\_thetas,}` :math:`\texttt{sin\_th)}`", "Display the results of the control model in the figures in the neural dynamic simulation part."
   ":math:`\texttt{pause\_popup\_change(handles)}`","Do proper actions when the pause button is pressed in neural populations (de)synchronization part."
   ":math:`\texttt{[STEPS,result]=PlotsDynamic(handles)}`", "Display the selected variables figures."
   ":math:`\texttt{Popup\_changes\_init(handles)}`", "Prepare the options of the neural dynamic simulation panel according to the selected dynamical model."
   ":math:`\texttt{popup\_Distribution\_change}` :math:`\texttt{(H,handles,type)}`", "Prepare the option of initial or final distributions according to the selected distribution in neural populations (de)synchronization part."
   ":math:`\texttt{popup\_PRC\_change(H,handles)}`", "Consider a default value for the period according to the selected model in neural populations (de)synchronization part."
   
.. csv-table:: **Summary of NPDS Toolbox functions (3)**
   :name: toolbox_functions3
   :header: "Function", "Task"
   :widths: 80,60
   
   
   ":math:`\texttt{Portrait(handles,H,vector,}` :math:`\texttt{ flag,varargin)}`", "Display the phase portrait, stream, and vector field figure in the neural dynamic simulation part."
   ":math:`\texttt{PortraitDynamic(handles)}`", "Send the parameters to :math:`\texttt{Portrait}` function."
   ":math:`\texttt{[z,zp]=PRC\_function(model,}` :math:`\texttt{method,domain)}`", "Compute PRC function and its derivative according to the selected neural model in the neural populations (de)synchronization part."
   ":math:`\texttt{[prc,dprc] = PRC\_interpol}` :math:`\texttt{(domReg,type)}`", "Interpolate HH and Thalamic neuron PRC functions and their derivatives."
   ":math:`\texttt{Report(handles,varargin)}`", "Report some information in the bottom panel in the neural dynamic simulation part."
   ":math:`\texttt{report\_last(H,domain,u,L2,}` :math:`\texttt{thetas,phi,iter)}`", "Report some information in the bottom panel in the neural populations (de)synchronization part."
   ":math:`\texttt{report\_main(handles,location,}` :math:`\texttt{concentration,omega,i,dt,domain)}`", "Recognize the type in phenomena in the neural populations (de)synchronization part."
   ":math:`\texttt{L=RK\_stoc(tts,u,T,dt,D,prc,type)}`", "Apply fourth-order Runge-Kutta to solve the stochastic ODE to determine the phase of the noisy oscillator in the neural populations (de)synchronization part."
   ":math:`\texttt{L=RK4control(tts,u,T,dt,prc,type)}`", "Apply fourth-order Runge-Kutta to solve the ODE to determine the phase of the oscillator in the neural populations (de)synchronization part."
   ":math:`\texttt{[res,dt]=RKb(varargin)}`", "Solving the neural dynamical systems."
   ":math:`\texttt{[Dist,Error,Thetas,U,Sim\_time,}` :math:`\texttt{Domain]=Run\_test(handles,flag)}`", "Run the designed test case in the neural populations (de)synchronization part."
   ":math:`\texttt{show\_error(error\_number)}`", "Show the related error message when an error occurs in the toolbox."
   ":math:`\texttt{Start\_Action(handles)}`", "Make enable or disable the objects in the window when the simulation is started/paused/stopped in the neural populations (de)synchronization part."
   ":math:`\texttt{start\_model(handles)}`", "Call required functions when the start button is pressed to start the simulation in the neural populations (de)synchronization part."
   ":math:`\texttt{stream(H,func,y1val,y2val,}` :math:`\texttt{t,varargin)}`", "Draw the 2D stream of dynamical systems in the neural dynamic simulation part."
   ":math:`\texttt{stream3d(H,func,y1val,y2val,}` :math:`\texttt{t,varargin)}`", "Draw the 3D stream of dynamical systems in the neural dynamic simulation part."
   ":math:`\texttt{u=user\_defined\_control(varargin)}`", "The user can define his own control strategy in this function."
   ":math:`\texttt{[dist,diff\_dist]=}` :math:`\texttt{user\_defined\_final\_dist(domain,}` :math:`\texttt{omega,i,dt)}`", "The user can define a new final distribution in this function."
   ":math:`\texttt{[dist,diff\_dist]=}` :math:`\texttt{user\_defined\_initial\_dist}` :math:`\texttt{(domain,omega,i,dt)}`", "The user can define a new initial distribution in this function."
   ":math:`\texttt{vectfield(H,func,y1val,y2val,}` :math:`\texttt{t,varargin)}`", "Draw 2D vector field of dynamical systems in the neural dynamic simulation part."
   ":math:`\texttt{vectfield3d(H,func,y1val,y2val,}` :math:`\texttt{t,varargin)}`", "Draw 3D vector field of dynamical systems in the neural dynamic simulation part."
   ":math:`\texttt{[X,DX,DY,DDX,DDY,DXY] =}` :math:`\texttt{ Wendland(eps,differ,type,r,x,y)}`", "Define Wendland functions and their derivatives."
   
   
As you can see, NPDS Toolbox contains more than 50 functions. We provide a diagram (See Figure :numref:`Arch`) to display the architecture of the toolbox functions and relations between them. In this figure, the sources of graphical user interface files are represented by rectangles. We have two main part i.e :math:`\texttt{NPDSLab.m}` and :math:`\texttt{NeuronDynamic.m}`. These files are the main parts of the toolbox, which are represented by two diamonds and can be run from the command line directly. Moreover, :math:`\texttt{About.m}` can be run from the command line, but it is not one of the main files of the toolbox and just gives a brief overview of the toolbox. This file is shown by a diamond in the figure. There are some main functions. These functions call the other functions to do their task correctly. On the other hand, regular functions are called by the main ones and these functions do not need to call other functions. These two types of functions are displayed by two ellipses and one ellipse, respectively. Some functions invoke simple functions defined inside the same file. Simple functions are shown by the ellipse dotted line. A diamond inside a rectangle expresses a static file that creates a user-defined function file when the user intends to define a new function. Finally, the cloud-like shape is :math:`\texttt{PARAMETER\_GUIDE.md}` file which is a guide for model parameters.


.. only:: html

    .. figure:: ./Pictures/Arch.png
        :name: Arch
        :width: 200
        :height: 100
        :align: center
   
        The architecture of NPDS Toolbox (Click on the image to see it in the actual size)
   
.. only:: latex

    .. figure:: ./Pictures/Arch.png
        :name: Arch
        :scale: 80 %
        :align: center
        
        The architecture of NPDS Toolbox
   
 
