Installation & Requirements
===========================


**1.** get the source code

::

   cd
   git clone https://github.com/vergissberlin/bashlight.git

**2.** Open your home bash file in editor

``~/.bashrc`` on *linux* **or** ``~/src/profile`` on *macOS*

**3.** Include bashlight/bashlight with the following line at the end of the bash file

::

   if [ -f ~/bashlight/bashlight ]; then
       . ~/bashlight/bashlight
   fi

Optional settings
-----------------

To install common git and tmux settings are tailored to bashlight simply run:

::

   bash ~/bashlight/install.bash

Supported operating systems
---------------------------

-  Linux
-  macOS
-  Windows with bash shell

Optional dependencies
---------------------

-  ``coreutils`` for a colourful, easy to handle directory listing
   – ``apt install coreutils``
   – ``brew install coreutils``
