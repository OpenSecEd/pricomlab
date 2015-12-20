Lab: Private Communication (pricomlab)
===============================================================================

These are the instructions for a lab on private communication, it covers PGP 
and steganography.  It's aim is for the students to reflect on private 
communication and learn about different methods available today.

This lab is part of the [Open Security Education][OpenSecEd] project and the 
maintainer is [Daniel Bosk][dbosk].  The latest release can be found under 
[releases][Releases].  You can safely link directly to the PDFs found there.

[OpenSecEd]: https://github.com/OpenSecEd/
[dbosk]: https://github.com/dbosk/
[Releases]: https://github.com/dbosk/pricomlab/releases


File Structure and Building
-------------------------------------------------------------------------------

*To build* the PDF, after cloning the repository you must clone its required 
submodules:

```shell
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

*To contribute*, please [fork the repository][ForkARepo], make your changes, 
commit them and then create a [pull request][PullRequest] in the original 
repository.

[ForkARepo]: https://help.github.com/articles/fork-a-repo/
[PullRequest]: https://help.github.com/articles/using-pull-requests/
