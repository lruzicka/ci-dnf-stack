Feature: Transaction history redo

Scenario: Redo last transaction
  Given I use the repository "fedora"
   When I execute dnf with args "install python3-idle"
   Then the exit code is 0
    And Transaction is following
        | Action        | Package         |
        | install       | python3-idle*   |
        | install       | tk*             |
   When I execute dnf with args "remove filesystem"
   Then the exit code is 0
    And Transaction is following
        | Action        | Package         |
        | remove        | python3-idle*   |
        | remove        | tk*             |
   When I execute dnf with args "history redo last-1"
   Then the exit code is 0
    And Transaction is following
        | Action        | Package         |
        | install       | python3-idle*   |
        | install       | tk*             |
    And History is following
        | Id     | Command               | Action        | Altered   |
        | 3      |                       | Install       | 2         |  
        | 2      |                       | Removed       | 2         |  
        | 1      | install python3-idle  | Install       | 2         |  
   When I execute dnf with args "history redo last-1"
   Then the exit code is 0
    And Transaction is following
        | Action        | Package         |
        | remove        | python3-idle*   |
        | remove        | tk*             |
    And History is following
        | Id     | Command               | Action        | Altered   |
        | 4      |                       | Removed       | 2         |  
        | 3      |                       | Install       | 2         |  
        | 2      |                       | Removed       | 2         |  
        | 1      |                       | Install       | 2         |  
