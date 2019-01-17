Feature: Deplist as a commmand and option

Scenario Outline: Deplist as <type>
  Given I use the repository "fedora"
    And I use the repository "updates"
   When I execute dnf with args "<command> mc"
   Then the exit code is 0
   And stdout contains "package:.mc"
   And stdout contains "dependency: /bin/sh"
   And stdout contains "provider:.bash"
   And stdout contains "provider:.perl"
   And stdout contains "provider:.slang"

Examples:
    | type      | command               |
    | a command | deplist               |
    | an option | repoquery --deplist   |


Scenario: Deplist with --latest-limit
  Given I use the repository "fedora"
    And I use the repository "updates"
   When I execute dnf with args "repoquery --deplist --latest-limit 1 abcde.noarch"
   Then the exit code is 0
    And stdout contains "package:.mc"
    And stdout contains "dependency: /bin/sh"
    And stdout contains "provider:.bash"
    And stdout contains "provider:.perl"
    And stdout contains "provider:.slang"
    And stdout contains "provider:.glibc"


Scenario: Deplist with --latest-limit and --verbose
  Given I use the repository "fedora"
    And I use the repository "updates"
   When I execute dnf with args "repoquery --deplist --verbose --latest-limit 1 abcde.noarch"
   Then the exit code is 0
    And stdout contains "package:.mc"
    And stdout contains "dependency: /bin/sh"
    And stdout contains "provider:.bash"
    And stdout contains "provider:.perl"
    And stdout contains "provider:.slang"
    And stdout contains "provider:.glibc"

