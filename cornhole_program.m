%=======================================================================================================
% Final Exercise: CornHole       (Chia Hao Hsu Tai)
%=======================================================================================================
% Simulates the game of cornhole. It simulates the game by asking the user for two inputs: the velocity 
% at which the bean bag is thrown and at which angle. 

%-------------------------------------------------------------------------------------------------------
% Makes a vector including the coordinates of the the ball and the board. Plots the the board and the 
% ball. Labels axis and sets the acceleration of gravity
%-------------------------------------------------------------------------------------------------------
coordinates_playingfield = [27.00, 0.25; 29.95, 0.80; 30.44, 0.90; 30.93,1.00; 0,0; 32,0;]; % vector with coordinates
hold on 
axis equal
AB_line = plot(coordinates_playingfield(1:2,1), coordinates_playingfield(1:2,2), '-k');     % plots line AB
CD_line = plot(coordinates_playingfield(3:4,1), coordinates_playingfield(3:4,2), '-k');     % plots line CD
H_line = plot(coordinates_playingfield(5:6,1), coordinates_playingfield(5:6,2), '-k');      % makes the horizontal line (ground)
start_point = plot(0,2, 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'r');                      % plots the beanbag starting position
xlabel('distance, ft');
ylabel('height, ft');
response = 'y';                                                                             % sets response to "y" so that loop starts
acce_grav = 32.174;                                                                         % sets the acc. of gravity

%-------------------------------------------------------------------------------------------------------
% Loop for the game. The loop calcualtes all the values of x and y for the path that the beanbag makes 
% in the air. The loop also asks the user if he/she wishes to continue playing. If answer is n (no) the 
% loop ends. If the answer is "y" (yes) the loop continous. 
%-------------------------------------------------------------------------------------------------------
while response == 'y'
    
    vel_ini = input('What is the velocity(ft/s)? ');                                        % Asks the user for a velocity                                       
    ang_ini = input('At want angle do you want to throw it (degrees)? ');                   % Asks the user for an angle
    
    t_max = ((vel_ini*sind(ang_ini))+sqrt((vel_ini^2)*(sind(ang_ini))^2+4*acce_grav))/acce_grav;   % Calculates maximum time the bean bag spens in the air
    t_vec=linspace(0,t_max,100);                                                                   % Makes a vector from 100 values of time
    
    value_x = vel_ini*cosd(ang_ini)*t_vec;                                                         % vector with all the x values
    
    value_y = -(acce_grav/2)*(t_vec).^2+vel_ini*sind(ang_ini)*(t_vec)+2;                           % vector with all the y values
    
    plot (value_x, value_y);                                                                       % plots the path of the beanbag
    
    response = input('Do you want to play a round? ', 's');                                        % prompts the user for a reponse (y/n)(if "y" games continous, 
                                                                                                   % if "n" game stops
end
    
