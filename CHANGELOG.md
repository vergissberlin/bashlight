2019-01-20
==========

  * Fix bug with relative path on zsh

2019-01-19
==========

  * Set BASHLIGHT_PATH as global variable in travis configuration
  * Set update YES as default
  * Use bashlight path variable
  * Replace the logo
  * Add more debug output to travis ci
  * Add logo to readme
  * Try to fix the test on travis ci
  * Set long argument version for the version
  * Refactore test prefixes
  * Output version of the test tools and linter
  * Fix test for logo with v char
  * Add tests for version number

2019-01-18
==========

  * Update the change log
  * [#10](https://github.com/vergissberlin/bashlight/issues/10) Add bashlight command and versioning output

2019-01-16
==========

  * Update version numbers and fix typos
  * Use relative paths in install/*.bash
  * Comment the code in github.bash

2019-01-15
==========

  * Add tests for migration
  * Add comments and tests to github.bash ([#30](https://github.com/vergissberlin/bashlight/issues/30))
    * Fix the aliases for bats
    * Add github release
    * Add git status
    * Add tabs to github.bash
    * Add double-quotes to curl in github.bash
    * Removed unneeded variables
    * Disable shellcheck test SC1117 for curl in github.bash
    * Disable shellcheck SC1117 for regex splitting in github.bash
    * Silence the curl in github.bash
    * Comment the code in github.bash
    * Fix two typos in github.bash
    * Restructure github.bash
    * Add bats-test for github.bash
    * Enhanche the documentation for github-releases
  * Disable shellcheck SC1117 for regex splitting in github.bash
  * Disable shellcheck test SC1117 for curl in github.bash
  * Removed unneeded variables
  * Add double-quotes to curl in github.bash
  * Add tabs to github.bash
  * Add git status
  * Add github release
  * Fix the aliases for bats

2019-01-14
==========

  * Pip once more
  * Try to use pip to install yamllint
  * Revert reorganisation
  * Reorganize sources
  * Add ppa for yamllit
  * Add update to apt addon
  * Install all dependencies with addons
  * Add yamllint to os x test environment
  * Add yamllint to travis-ci
  * Fix and add aliases to readme
  * Fixed contribute.md with MarkDown-Linter
  * Fixed files with yamllinter
  * Fix README.me grammar issues
  * Merge pull request [#26](https://github.com/vergissberlin/bashlight/issues/26) from TheDevMinerTV/patch-1
    Fix some aliases

2019-01-13
==========

  * Remove get as a alias
    This is not a good practice!
  * Fix some aliases
    Go is here!

2019-01-08
==========

  * Merge pull request [#12](https://github.com/vergissberlin/bashlight/issues/12) from TheDevMinerTV/master
    Replace ! -z with -n, 'cause shellcheck complains about it.
  * Fix the install script
  * Replace ! -z with -n, 'cause shellcheck complains about it.
  * Move bashlight to ~/.bin/bashlight

2018-11-20
==========

  * Activate autocomplete

2018-10-01
==========

  * Fix typo
  * Intruduction
  * Tidy up the documentation
  * Added toc tree
  * rename to index again
  * Add thanks to someone
  * Split documentation in different files
  * Add read the docs documentation

2018-09-03
==========

  * Update tmux.bash
  * Update git.bash

2018-06-20
==========

  * Setup prompt identifier for tests
  * Install test tools in Vagrant boxes for regression tests
  * Update Linx test instances for better regression test results

2018-06-14
==========

  * Set theme jekyll-theme-tactile
  * Fixed code styling
  * Merge branch 'master' of github.com:vergissberlin/bashlight
  * Added quote of the day

2018-06-13
==========

  * Set theme jekyll-theme-architect

2018-06-05
==========

  * Added tests for aliases

2018-06-04
==========

  * Added github templates
  * Create CODE_OF_CONDUCT.md
  * Merge branch 'master' of github.com:vergissberlin/bashlight
  * Added gitattributes to excluded development files from release
  * Update bug_report.md
  * Update issue templates
  * Fixed name of apt source
  * Changed way how to install build dependencies for linux on travis ci
  * Added code coverage test
  * Hotfix update script

2018-06-03
==========

  * Added all arguments to call the test method
  * Remove git-bash-complition
  * Added badge for commit since last release
  * Added license info
  * Updated badges and version number
  * Updated changelog file
  * Updated the changelog
  * Install shellchecker with homebrew
  * Improve coding style
  * Added shellchecker script to improve the code quality
  * Upgrade git for osX on TravisCI
  * Install bats on osX

2018-06-02
==========

  * Added CHANGELOG
  * Added sudo right on travis ci
  * Remove old tests
  * Install bats on OSX with homebrew
  * Updated file headers
