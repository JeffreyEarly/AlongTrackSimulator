%% groundTrackSimulation.m
% Clear workspace and figures



% Orbital parameters for a reference altimetry mission.
% For a circular orbit, set eccentricity e = 0.
% To test an elliptical orbit, change e to a value > 0 (e.g., 0.1).
altitude = 1336;            % Semi-major axis [km]
e = 0;                    % Eccentricity (0 for circular; >0 for elliptical)
incl = deg2rad(66);       % Inclination [rad]
RAAN = -pi/2;                 % Right Ascension of Ascending Node [rad], or longitude of the ascending node
argPerigee = pi/2;           % Argument of perigee [rad]
M0 = 0;                   % Initial mean anomaly [rad]

% Simulation time parameters
mu = 398600.4418;         % Earth's gravitational parameter [km^3/s^2]
Re = 6378;                % Earth's radius [km]
T_orbit = 2*pi*sqrt((Re+altitude)^3/mu);  % Orbital period [s]
numOrbits = 0.5;             % Number of orbits to simulate
T_total = numOrbits * T_orbit;
dt = 10;                    % Time step [s]
t = 0:dt:T_total;           % Time vector

% Compute ground track (latitude and longitude) using the separate function
[lat, lon] = computeGroundTrack(altitude, e, incl, RAAN, argPerigee, M0, t);

% Plot the satellite ground track
figure;
plot(lon, lat, 'b-', 'LineWidth', 1.5);
xlabel('Longitude (deg)');
ylabel('Latitude (deg)');
title('Satellite Ground Track for Reference Altimetry Mission');
grid on;
axis([-180 180 -90 90]);
set(gca, 'XTick', -180:30:180, 'YTick', -90:30:90);
