Feature: Repolist when all repositories are disabled

@fedora
Scenario: Repolist without arguments
   When I execute dnf with args "repolist"
   Then the exit code is 0
    And stdout is empty


@fedora
Scenario: Repolist with "enabled"
   When I execute dnf with args "repolist enabled"
   Then the exit code is 0
    And stdout is empty


@fedora
Scenario: Repolist with "disabled"
   When I execute dnf with args "repolist disabled"
   Then the exit code is 0
    And stdout contains "fedora\s+"
    And stdout contains "updates\s+"
    And stdout contains "fedora-modular\s+"
    And stdout contains "updates-modular\s+"


@fedora
Scenario: Repolist with "all"
   When I execute dnf with args "repolist all"
   Then the exit code is 0
    And stdout contains "fedora.*disabled"
    And stdout contains "updates.*disabled"
    And stdout contains "fedora-modular.*disabled"
    And stdout contains "updates-modular.*disabled"
