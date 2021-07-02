.. _sec-problem-statement:

Problem Statement
------------------------
In this toolbox different control inputs are applied on the populations of identical and uncoupled neural oscillators  with/without noise.

In this toolbox different control inputs are applied on the populations of identicaland uncoupled neural oscillators with/without noise.Phase reduction is a famous technique which reduces the dimensionality ofa  dynamical  system  to  a  single-phase  variable :math:`\theta` to  describe  dynamics  near  aperiodic orbit.  Consider the followingn-dimensional neural dynamical system :cite:`Monga2019_1,Monga2019_2`:

.. math::
    :label: dynamic_system
    
    \frac{d\textbf{x}}{dt}=\Psi(\textbf{x}),~~~\textbf{x}\in \mathbb{R}^n,

This system has a stable periodic orbit :math:`\gamma(t)` with period :math:`\tau`. For each point :math:`\textbf{x}^*` in basin of attraction of the periodic orbit, we have an unique phase :math:`\theta(\textbf{x}^*)` such that :cite:`Monga2018_2`:

.. math::
    :label: orbit
    
    \lim_{t\to\infty}\Big\vert \textbf{x}(t)-\gamma\Big(t+\frac{\tau}{2\pi}\theta(\textbf{x}^*)\Big)\Big\vert=0,

The aforementioned equation is true through the entire basin of attraction of the periodic orbit.

By expressing the population dynamics with the probability of their distribution, the problem converts to partial differential equation (PDEs). The presence or absence of noise changes the governing population-level different PDEs.

.. _sec-Phase_density_equation_of_decoupled_and_noise_free_neural_oscillators:

Phase density equation of decoupled and noise free neural oscillators
~~~~~~~~~~~~~~~~~
When the system is consider as a noise-free one, a neural dynamical system can be represented as:

.. math::
    :label: dynamic_system2
    
    \frac{d\textbf{x}}{dt}=\Psi(\textbf{x})+U(t)\in\mathbb{R}^n,
   
where :math:`U(t)` is an infinitesimal control input.

Using the phase reduction, the system :eq:`dynamic_system2` is reduced to the following one-dimensional system for each oscillator of the system :cite:`Monga2018_1`:

.. math::
    :label: osci
    
    \dot{\theta}_j=\omega+\mathcal{Z}(\theta)u(t),
  
where :math:`\mathcal{Z}(\theta)` is the phase response curve (PRC) depending on the neural dynamic model :cite:`Brown2004`. In addition, :math:`j=1, ..., M` is the number of noisy oscillators of the system.

The dynamics of the initial probability distribution :math:`\rho(\theta,t)` and the final probability distribution :math:`\rho_f(\theta,t)` implied in the advection and wave travelling equations are as follows :cite:`Monga2018_1`:

.. math::
    :label: main1
    
    \frac{\partial\rho(\theta,t)}{\partial t}=-\frac{\partial}{\partial\theta}\Big((\omega+ U(t)^T\mathcal{Z}(\theta))\rho(\theta,t)\Big),
    
.. math::
    :label: non
    
    \frac{\partial \rho_f(\theta,t)}{\partial t}=-\omega\frac{\partial \rho_f(\theta,t)}{\partial \theta}.
     
.. _sec-Phase_density_equation_of_decoupled_and_noisy_neural_oscillators:

Phase density equation of decoupled and noisy neural oscillators
~~~~~~~~~~~~~~~~~
Now consider the following system in presence of the noise :cite:`Monga2019_1`:

.. math::
    :label: dynamic_system_noise
    
     \frac{d\textbf{x}}{dt}=\Psi(\textbf{x})+U(t)+\sqrt{2D}\eta(t)~~~\textbf{x}\in R^n,
     
where :math:`U(t)` is the control input and :math:`\sqrt{2D}\eta(t)` is a Gaussian white noise with zero mean and variance :math:`2D` which exists at the system and affect the control input. Using the phase reduction and Ito's formula, the system :eq:`dynamic_system_noise` is reduced to the following one-dimensional system for each oscillator of the system ::cite:`Monga2019_1`:

.. math::
    :label: osci_noise
    
     \dot{\theta}_j=\delta+\mathcal{Z}(\theta)\big[u(t)+\sqrt{2D}\eta_j(t)\big],
     
The population dynamics of a population of noisy, identical, uncoupled oscillators all receiving the same control input are represent by their probability distribution, :math:`\rho(\theta,t)`, as the following equation according to the stochastic averaging :cite:`Moayeri2021,Wilson2016`:

.. math::
    :label: main1_noise
    
     \frac{\partial\rho(\theta,t)}{\partial t}=-\frac{\partial}{\partial\theta}\Big((\omega+ U(t)^T\mathcal{Z}(\theta))\rho(\theta,t)\Big)+\mathcal{B}\frac{\partial ^2\rho(\theta,t)}{\partial \theta ^2},
     
    
in which

.. math::
    :label: non2
    
    \mathcal{B}=\frac{2D}{\pi}\int_0^{2\pi}\mathcal{Z}(\theta)d\theta.
    
    
The purpose is that the initial distribution :math:`\rho(\theta,t)` changes to final distribution :math:`\rho_f(\theta,t)` where the desired final probability distribution is considered as a traveling wave:

.. math::
    :label: non3
    
    \frac{\partial \rho_f(\theta,t)}{\partial t}=-\omega\frac{\partial \rho_f(\theta,t)}{\partial \theta}.
    
Actually, as in this toolbox we consider neuronal models, we can only impose the current to the voltage across the membrane; thus, we consider :math:`U(t)=[u(t), 0, ..., 0]^T`.
