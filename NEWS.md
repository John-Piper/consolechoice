consolechoice v1.1.1 (Release date: 2022-03-01)
===============================================


Improvements

- The stop function uses the argument .call = FALSE when used in the helper functions "check_choice" and "print_menu"  This avoids the error message being misleading to user as the helper function names are hidden if an error message occurs within these functions. 



consolechoice v1.0.1 (Release date: 2022-02-28)
===============================================


Bug Fixes


- The exact number will return True in the function check_choice.  In the previous version the function returned True when the correct number   was submitted with a character on the left, right or either side of the number. 


