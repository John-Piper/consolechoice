## R CMD check results
There were no ERRORs and WARNINGs

There was 2 NOTES:

* Bug fix in the function check_choice.  The exact number will return True in the function check_choice.  In the previous version the function returned True when the correct number   was submitted with a character on the left, right or either side of the number. 

* Added the argument .call = FALSE in the stop functions when used in the helper functions "check_choice" and "print_menu".
