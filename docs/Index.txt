NPDS Matlab toolbox
=======================
NPDS Toolbox: Neural Population(De)Synchronization toolbox for Matlab

Authors
------
Mohammad Mahdi Moayeri, Mohammad Hemami, Jamal Amani Rad, Kourosh Parand

Welcome to NPDS’s documentation!
------
NPDS  Toolbox  is  an  open-source  MATLAB  toolbox  for  implementing  phasedistribution controls on different noise-free or noisy neural oscillator populations in order to desynchronize/synchronize them.  This toolbox has a graphical userinterface which is designed using GUIDE in MATLAB.  This toolbox is useful forresearchers  who  want  to  study  the  theoretical  aspects  of  neural  dynamics  ordesigning  distribution  controls  for  neural  populations.   This  Matlab  toolboxcurrently has the the following capabilities:

- Simulating the controlling the neural oscillators synchronization by phase distribution controls without any programming efforts.
- Using the proportional control, bang-bang or user-defined control inputs.
- Defining the deterministic or stochastic neural oscillator populations with Gaussian white noise.
- Defining various phase response curves (PRC) related to different neuralmodels  such  as  Hodgkin-Huxley  (HH),  Fitzhugh-Nagumo  (FHN),  Rose-Hindmarsh (RH), and Thalamic.
- Investigating  the  dynamics  of  different  neural  models  such  as  Hodgkin-Huxley (HH), Fitzhugh-Nagumo (FHN), Rose-Hindmarsh (RH), and Thalamic.
- Defining the user-defined distributions or using well-known distributionssuch as Von-Mises or uniform ones for initial and final distributions.
- Possibility of using different numerical simulation approaches for simula-tions such as finite-difference, meshless, spectral, or Fourier decompositionmethods.
- Exporting the results as figures or matrices.
Synchronization plays a very significant role in brain functions such as perception, memory, neural information exchange, cognitive processing, and movement. On the other hand, excessive neuronal synchrony is one of the causes of the generation of epileptic seizures; thus, a fine balance between synchronization and desynchronization is functionally and behaviourally important. The phase distribution control approach is one of the suitable choices in order to make the analysis of high-dimensional systems such as neural dynamics more convenient and makes the designing of the control systems experimentally more applicable. This toolbox is designed so that researchers can investigate the theories of dynamics and synchronization of neural models without any knowledge of programming and scientific computing.
   
   

.. only:: html

    .. figure:: gifpages.gif
        :scale: 80 %
        :align: center
        
        Screenshot of the NPDS toolbox
   
.. only:: latex

    .. figure:: ./Pictures/2.png
        :scale: 80 %
        :align: center
        
        Screenshot of the NPDS toolbox

Quick Links
------
Documentation: https://npds.readthedocs.io

Mailing list: https://groups.google.com/forum/#!forum/npds-users

Source code: https://github.com/amanirad/NPDS

Bug report:  https://github.com/amanirad/NPDS/issues

Documentation as a pdf file: https://media.readthedocs.org/pdf/npds/latest/npds.pdf

Maintainer:  Mohammad Mahdi Moayeri, [mahdi.myr@gmail.com]; MohammadHemami, [gaslakh@gmail.com]

Organization:   `Shahid Beheshti University`_

.. _Shahid Beheshti University: http:/sbu.ac.ir

Copyright:  This document has been placed in the public domain.

License:  NPDS is released under the ?  license.

Version:  0.1

Date:  March 29, 2021

Contributors
------
This toolbox was developed by **Mohammad Mahdi Moayeri** and **Mohammad Hemami**.  It is part of ongoing scientific work atShahid Beheshti University, in collaboration with **Dr. Jamal Amani Rad** and **Prof. Kourosh Parand**.

How to cite
------
If you used NPDS toolbox or some of its codes for your own research,  pleasecite us (using the Zenodo DOI below):

Logo
------
We thank `MahmoudReza Afra <https://www.linkedin.com/in/mrezaafra/>`_ who designed and donated the logo for the NPDS toolbox.

Download
------
`Source code is hosted at Github <https://github.com/mahdimyr/Testdoc>`_.

`Download source code as a .zip file <https://github.com/mahdimyr/NIMS/Testdoc/master.zip>`_.

`Download the documentation as a pdf file <https://media.readthedocs.org/pdf/npds/latest/npds.pdf>`_.

Acknowledgments
------
The authors are grateful to Jeff Moehlis, University of California, Santa Barbara, and Bharat Monga, Intel Corporation. Through their research in this field, they instilled in us the idea to realize the importance of package development in this field and to achieve it in the best possible way.

Feedback & Support
------
If you have problems installing the software or questions about usage and documentation, or something else related to NPDS toolbox, you can post to the Issues section of our repository. If you have any questions or would like to contribute, you can write us at cmplab@sbu.ac.ir.

References
------
- `M. M. Moayeri, J. A. Rad, K. Parand, "Desynchronization of stochastically synchronized neural populations through phase distribution control: a numerical simulation approach", Nonlinear Dyn., 104 (2021), 2363-2388. <https://link.springer.com/article/10.1007/s11071-021-06408-0>`_

- `B. Monga and J. Moehlis, "Phase distribution control of a population of oscillators", Physica D., 398 (2019), 115-129. <https://www.sciencedirect.com/science/article/abs/pii/S0167278918303543>`_

- `B. Monga, G. Froyland and J. Moehlis, "Synchronizing and Desynchronizing Neural Populations through Phase Distribution Control", 2018 Annual American Control Conference (ACC), (2019), 2808-2813. <https://ieeexplore.ieee.org/document/8431114>`_

- `B. Monga, D. Wilson, T. Matchen and J. Moehlis, "Phase reduction and phase-based optimal control for biological systems: a tutorial", Biol Cybern., 113 (2018), 11-46. <https://link.springer.com/article/10.1007/s00422-018-0780-z>`_

Contents
^^^^^^^^^^^^^^^^^
.. toctree::
   :maxdepth: 3
   :numbered:
    
   Getting started
   Problem Statement
   Mathematical Background
   Applications
   Appendix
   refindex
   
