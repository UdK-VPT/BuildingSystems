============================
Building with Read-The-Docs:
============================
Everything is configured already, so it should work automatically!

The admin pages are here:

* https://readthedocs.org/projects/buildingsystems/
* https://readthedocs.org/projects/buildingsystems/builds/

The output is here:

* HTML: http://buildingsystems.readthedocs.io/en/latest/
* PDF: https://media.readthedocs.org/pdf/buildingsystems/latest/buildingsystems.pdf


=================
Building locally:
=================
To build locally, one needs Python, Sphinx, LaTeX, sphinxcontrib-bibtex and Make.

The recommended way is to install Anaconda, the latest release from:
https://www.anaconda.com/download/
Please use Python 3.6, 64 bit!

Once the installer has finished, open the Anaconda Prompt and update your installation by running:

.. code-block:: ruby

   conda update conda
   conda update anaconda
   conda config --append channels conda-forge
   conda install future 

To install the dependencies, open the Anaconda Prompt and run

.. code-block:: ruby

   conda install sphinx sphinxcontrib-bibtex make
   conda list 
   
All tools that are required to generate the HTML and PDF are now installed!
To generate the HTML and PDF output, open the Anaconda prompt again, and run

.. code-block:: ruby

   cd BuildingSystems\docs
   make html
   make pdf

The output will be generated in ``BuildingSystems\docs\build``.
For viewing the pdf on Windows, [SumatraPDF](https://www.sumatrapdfreader.org/download-free-pdf-viewer.html) is recommended (instead of Acrobat Reader), because it does not lock the file.
