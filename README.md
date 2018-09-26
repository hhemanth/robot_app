##How to run
ruby main_str.rb 

ruby mail_file.rb

###The solution consists of the following classes
- Robot - responds_to - PLACE, MOVE, LEFT, RIGHT, REPORT
- Table - responds_to - am_i_safe? - Robot asks table wheather it is safe.
- CommandExecutor - responds_to - can send any list of commands to any subject - Here Command executor send 
    comamnds (PLACE, MOVE, LEFT, RIGHT, REPORT) to robot. This class is very generic and can send any command to any subject
- Command - holds command_action and any params
- RobotCommandParser - basically parses any test to list of commands - We can input a file descriptor, an input from command lime or from Network to it

####command_executor_spec.rb is the integartion test, which creates objects, plugs them together
##Things I am proud of
 
- I have written a lot of cases. I have done decent error handling. 
- I believe this is fairly extensible solution.
- Classes have Single Responsibility. I have used composition vs Inhelitance.
- Small classes, small methods, avoided use of if/else conditionals.
- there is a good domain to class mapping.

##Possible Improvements
- Write more integartion tests with larger command string.
- Test with lot of Invalid commands
- Check if this code can be ported to any command to any object
