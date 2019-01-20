Contributers
============

Run the tests
-------------

```bash
bats ./tests/acceptance/
shellcheck -x bashlight
shellcheck -x *.bash
shellcheck -x **/*.bash
yamllint .
```

Create CHANGELOG
----------------

```bash
sudo npm i changelog -g
changelog -m vergissberlin/bashlight all > CHANGELOG.md
```

Support or Contact
------------------

You can contact me (@vergissberlin) on GitHub. Use the issue tracker to report bugs.



Thank you
---------

-  to @riobard, the founder of `bash-powrline <https://github.com/riobard/bash-powerline>`__ which this project is based on.
-  to the contributers and testers, who help to further improve the project.
-  Further thanks to **GitHub** for Atom.io.

