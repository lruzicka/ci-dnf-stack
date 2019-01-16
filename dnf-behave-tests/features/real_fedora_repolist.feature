Feature: Repolist


Background: Using repositories fedora and fedora-updates
  Given I use the repository "fedora"
    And I use the repository "fedora-updates"
    And I use the repository "fedora-modular"
    And I use the repository "fedora-updates-modular"


Scenario: Repolist without arguments
   When I execute dnf with args "repolist"
   Then the exit code is 0
    And stdout contains "fedora"
    And stdout contains "fedora-updates"
    And stdout contains "fedora-modular"
    And stdout contains "fedora-updates-modular"
    And stdout does not contain "dnf-ci-fedora-updates"
    And stdout does not contain "dnf-ci-thirdparty\s+dnf-ci-thirdparty"


Scenario: Repolist with "enabled"
   When I execute dnf with args "repolist enabled"
   Then the exit code is 0
    And stdout contains "dnf-ci-fedora\s+dnf-ci-fedora"
    And stdout contains "dnf-ci-thirdparty-updates\s+dnf-ci-thirdparty-updates"
    And stdout does not contain "dnf-ci-fedora-updates"
    And stdout does not contain "dnf-ci-thirdparty\s+dnf-ci-thirdparty"


Scenario: Repolist with "disabled"
   When I execute dnf with args "repolist disabled"
   Then the exit code is 0
    And stdout contains "dnf-ci-fedora-updates\s+dnf-ci-fedora-updates"
    And stdout contains "dnf-ci-thirdparty\s+dnf-ci-thirdparty"
    And stdout does not contain "dnf-ci-fedora\s+dnf-ci-fedora"
    And stdout does not contain "dnf-ci-thirdparty-updates"


Scenario: Repolist with "all"
   When I execute dnf with args "repolist all"
   Then the exit code is 0
    And stdout contains "dnf-ci-fedora\s+dnf-ci-fedora\s+enabled"
    And stdout contains "dnf-ci-fedora-updates\s+dnf-ci-fedora-updates\s+disabled"
    And stdout contains "dnf-ci-thirdparty\s+dnf-ci-thirdparty\s+disabled"
    And stdout contains "dnf-ci-thirdparty-updates\s+dnf-ci-thirdparty-updates\s+enabled"
