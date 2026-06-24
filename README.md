# Traffic Light Controller (Verilog)

## Overview

This project implements a parameterized Traffic Light Controller using Verilog HDL. The controller is designed as a Finite State Machine (FSM) that cycles through Red, Green, and Yellow states. The duration of each light can be configured through parameters, making the design flexible and reusable.

## Features

* Parameterized light durations
* FSM-based design
* Active-low asynchronous reset
* Synthesizable Verilog RTL
* Testbench for simulation and verification
* VCD waveform generation for GTKWave analysis

## Parameters

| Parameter   | Description                          | Default Value |
| ----------- | ------------------------------------ | ------------- |
| RED_TIME    | Red light duration (clock cycles)    |   5           |
| GREEN_TIME  | Green light duration (clock cycles)  |   4           |
| YELLOW_TIME | Yellow light duration (clock cycles) |   2           |

## State Transition

```text
RED → GREEN → YELLOW → RED → ...
```

## Learning Outcomes

* Finite State Machine (FSM) design
* Parameterized RTL coding
* Counter-based timing control
* Verilog simulation and verification
* Waveform analysis using GTKWave

## Author

Karan Kumar
