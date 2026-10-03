# 2D-Bottle-Flipping-Simulator

An older project I built using Processing and Java while learning how to experiment and program with physics-based animation.
The initial version simulates tossing a bottle using basic vectors, velocity, acceleration, gravity, and mass dependent on the amount of water in the bottle. 

## State of Project

This is a project that I haven't worked on for a few years, and it has a lot of inconsistencies and issues with bottle rotation as well as simulation crashes.
I'm keeping this version around as a starting point to build off of for future improvements. 

## Technologies/Languages

- Java
- Processing (Java Mode)

## Features

- Bottle tossing
- Basic gravity simulation
- Basic acceleration
- Basic velocity
- Horizontal wall reflection
- Changing mass of bottle based on water
- Mouse launching

## Planned Improvements

- Add working bottle rotation
- Improve launching system
- Improve horizontal wall reflection + rotation
- Add proper landing + rotation system

## Completed Improvements

- Fixed simulation freezing

## What I've Learned

- The simulation froze not because I was recreating the PShape every call to bottle(), but because it was constantly modifying velocity.
- Add comments and space out functions for readability.
