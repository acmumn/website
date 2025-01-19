+++
title = "Systems"
template = "page.html"
+++

#

Terms of Service
----------------

Please see the [Terms of Services](/tos) page and reach out to an officer if
you are interested in using our services.

ACM UMN Provided services
-------------------------

- Colocation
    - ACM UMN has two racks able to accomidate rack-mounted servers and other
    hardware. Members are responsible for the upkeep and security of their
    servers, while ACM UMN provides free 10G uplink and power, and cooling.

    - Students have colocated servers with interesting uses, such as a build
    server for the MELT lab, globally available storage, and more.

- Virtual machines
    - ACM UMN can provide virtual machines on our hypervisor. Members are
    responsible for the upkeep, security, and management of their virtual
    machines, while ACM UMN provides a virtual machine with 2 cores, 4GB RAM,
    200GB storage, and 10G uplink.

    - Students have used virtual machines to host their own websites,
    webapps, and Minecraft servers. Lots and lots of Minecraft servers.

- Specialized devices
    - ACM UMN can provide access to a server equipped with GPUs for GPU
    programming needs. Members are not to run crypto- related activity
    pursuant to the TOS.

    - ACM UMN can provide access to a powerful Apple Silicon system
    for members wanting to target macOS and iOS but might not have
    enough horsepower to do so.

- Other
    - Raspberry Pi 3Bs and 4s, Arduino Unos, and an Oculus VR headset are
    available for members to use while inside the ACM room. Unfortunately
    we currently do not have a system in place to track device loans, so they
    cannot be taken out of the club room.

ACM UMN Owned hardware
----------------------

- `argo`
    - Server for internal ACM use, no longer available for students
    - Dell PowerEdge R420, 2x E5-2430, 128GB RAM, 5TB HDD space, 10G 
    connection, Rocky Linux 9.4

- `vm`
    - Server for member use - hypervisor that provsions VMs to 
    prospective users
    - Dell PowerEdge R630, 3x E5-2680 v4, 128GB RAM, 7.2TB HDD space, 10G
    connection, NixOS unstable

- `garlic`
    - Server for GPU programming 
    - Custom build, Threadripper 1950X, 48GB RAM, GTX 3080 LHR, GTX 1080,
    10G connection, NixOS unstable

- `medusa`
    - Coming Soon

- `willow`
    - Server for Apple and ARM programming, not located within server closet.
    - Mac Studio, M1 Max, 32GB RAM, 1G connection

- `wopr`
    - Server management proxy
    - If your server has a management console, we can connect it to `wopr`
    to safely expose it on the internet
