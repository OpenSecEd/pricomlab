Lab: Private Communication (pricomlab)
===============================================================================

These are the instructions for a lab on private communication, it covers PGP 
and steganography.  It's aim is for the students to reflect on private 
communication and learn about different methods available today.

This lab is part of the [Open Security Education][OpenSecEd] project and the 
maintainer is

    [Daniel Bosk](https://github.com/dbosk/)

The latest release can be found under [releases][Releases].  You can safely 
link directly to the PDFs found there.

[OpenSecEd]: https://github.com/OpenSecEd/
[Releases]: https://github.com/dbosk/pricomlab/releases


File Structure and Building
-------------------------------------------------------------------------------

To build the PDF, you must download the source code and its required 
submodules:

```shell
$ git clone git@github.com:dbosk/pricomlab.git
$ git submodule update --recursive --init
$ make
```

The source files are structured as follows:

- `pricomlab.tex` contains the main instruction.
- `aims.tex` is an itemized list of the intended learning outcomes, as such it 
  can be included in another document summarizing the list of intended learning 
  outcomes.
- `literature.tex` covers the required reading instructions, thus you can 
  include these in a study guide containing all reading instructions for the 
  course.
- `pricomlab.bib` contains the bibliography entries, thus this file can be 
  included along with the reading instructions.

