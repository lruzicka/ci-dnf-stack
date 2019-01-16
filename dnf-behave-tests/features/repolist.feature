Feature: Repolist


Background: Using repositories fedora and fedora-updates
  Given I use the repository "fedora"
    And I use the repository "updates"
    And I use the repository "fedora-modular"
    And I use the repository "updates-modular"

@fedora
Scenario: Repolist without arguments
   When I execute dnf with args "repolist"
   Then the exit code is 0
    And stdout contains "fedora"
    And stdout contains "updates"
    And stdout contains "fedora-modular"
    And stdout contains "updates-modular"
    And stdout does not contain "updates-source"
    And stdout does not contain "fedora-source"

@fedora
Scenario: Repolist with "enabled"
   When I execute dnf with args "repolist enabled"
   Then the exit code is 0
    And stdout contains "fedora"
    And stdout contains "updates"
    And stdout contains "fedora-modular"
    And stdout contains "updates-modular"
    And stdout does not contain "updates-source"
    And stdout does not contain "fedora-source"

@fedora
Scenario: Repolist with "disabled"
   When I execute dnf with args "repolist disabled"
   Then the exit code is 0
    And stdout contains "fedora-source"
    And stdout contains "updates-source"
    And stdout does not contain "*fedora"
    And stdout does not contain "*updates"

@fedora
Scenario: Repolist with "all"
   When I execute dnf with args "repolist all"
   Then the exit code is 0
    And stdout contains "fedora"
    And stdout contains "updates"
    And stdout contains "updates-source"
    And stdout contains "fedora-source"
