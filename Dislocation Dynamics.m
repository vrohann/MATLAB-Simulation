global Bscrew Bedge Beclimb Bline
rn    = [%NODES FOR THE DISLOCATION LINE
              1000   0    0  7;
             -1000   0    0  7;
              0      0    0  0;
          
        ];
links = [%CONNECTING NODES FOR THE DISLOCATION LINE
             1 3 1 0 0 1 0 1;
             3 2 1 0 0 1 0 1;
        ];

MU = 1; %shear modulus
NU = 0.34; %Poisson’s ratio
maxconnections=10; %maximum number of segments a node may have
lmax = 1000; %maximum length of a dislocation segment (for remesh)
lmin = 100; %minimum length of a dislocation segment (for remesh)
areamin=lmin*lmin*sin(60/180*pi)*0.5; %minimum area criterion  (for remesh)
areamax=20*areamin; %maximum area criterion  (for remesh)
a=lmin/sqrt(3)*0.5; %dislocation core radius used for non-singular force calculation
Ec = MU/(4*pi)*log(a/0.1); %dislocation core energy per unit length and burgers vector squared for a screw dislocation (should always be a function of a)
totalsteps=1000; %number of cycles that are run for completion of dd3d command
dt0=1e7; %largest timestep that can be taken during a cycle
mobility='mobbcc0'; %name of the function used to calculate the velocity of the nodes

%Drag (Mobility) parameters
Bscrew=1e0;
Bedge=1e0;
Beclimb=1e2;
Bline=1.0e-4*min(Bscrew,Bedge);

integrator='int_trapezoid'; %name of the time integration scheme used to update nodal positions
rann = 0.5*a; %annihilation distance used to calculate the collision of dislocation lines
rntol = 0.5*rann; %solution tolerance used to control the automatic timestepping
doremesh=1; %a flag set either to 0 or 1 that turns the remesh functions off or on respectively 
docollision=1; %a flag set either to 0 or 1 that turns the collision detection off or on respectively
doseparation=1;%a flag set either to 0 or 1 that turns the splitting algorithms for highlyconnected nodes off or on respectively
plotfreq=1; %number of cycles between plots of geometry 
plim=10000; %limits of plotting space
appliedstress =5e-3.*[0 0 1; 0 0 -1; 1 -1 0]; %external stress given in a three by three symmetric tensor
viewangle=[0 90]; %angle of viewpoint for the 3D plot of the geometry
printfreq=1; %number of cycles between monitored node write statements
printnode=3;  %nodeid of the monitored node 
rmax=100; %maximum distance a node may travel in one cycle
