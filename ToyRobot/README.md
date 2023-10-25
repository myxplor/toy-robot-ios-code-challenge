# Toy Robot Simulator

The following should be written in Swift

## Description:
- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.  
- There are no other obstructions on the table surface.  
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement
that would result in the robot falling from the table must be prevented, however further valid movement commands must still
be allowed.  

## Commands
- *PLACE X,Y,F*: will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST. The origin (0,0) can be considered to be the SOUTH WEST most corner. The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.
- *MOVE*: will move the toy robot one unit forward in the direction it is currently facing.
- *LEFT*: will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
- *RIGHT*: will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
- *REPORT*: will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.

## Notes
- A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT and REPORT commands.  
- Input can be from a file, or from standard input, as the developer chooses.  
- Provide test data to exercise the application.  


## Constraints

The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.

## Example Input and Output

a)
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH

b)
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST

c)
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH

# Start point

Mainly implementation is in RobotInteractor. The word "Interactor" is come from VIPER architecture, it's a layer between Model and ViewModel/Presenter.

In this assignment, RobotInteractor read input string("MOVE"), and convert it to RobotCommand - a internal type to represent each command. Then apply the command to model - Robot

RobotInteractor is used in UI and Tests 

# UI

RobotView: Include a TextEditor to receive input, a Text to display output, and a Button to send command
RobotViewModel: handle input and transfer to Interactor

# Test

Test has sample data which are defined in ToyRobotTests. Run the only one test case - testCommands() should test all functions.

# Challenge tasks
1. There are two compiling errors in the program. Please run the program to locate and fix them.
2. Once the program can compile, there will be a run time crash. Fix the crash.
3. Run unit tests. Two of them will fail. Find the causes and fix them.