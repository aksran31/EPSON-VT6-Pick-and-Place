Function main
    Motor On
    Power High

    'Execute the pick-and-place sequence
    Call Pick
    Call Drop1

    Call Pick
    Call Drop2

    Call Pick
    Call Drop3

    Power Low
    Motor Off
Fend


'Open the gripper using digital output 11
Function Grip_open
    Off 11
Fend

'Close the gripper using digital output 11
Function Grip_close
    On 11
Fend


Function Pick
    'Ensure the gripper is open before starting the pickup operation
    Call Grip_open

    'Return to the home position
    Go home_ref

    'Move to the approach position above the pickup point
    Speed 30
    Go pick_pt -TLZ(50)
    Wait 1

    'Move to the pickup position
    Speed 20
    Move pick_pt

    'Allow the robot to reach the pickup position before closing the gripper
    Wait 1
    Call Grip_close

    'Allow time for the gripper to securely hold the object
    Wait 1

    'Retract to the approach position
    Speed 30
    Move pick_pt -TLZ(50)
Fend


Function Drop1
    'Move to the approach position above the first drop point
    Go drop_1 -TLZ(50)

    'Move to the first drop position
    Speed 20
    Move drop_1

    'Allow the robot to reach the drop position before opening the gripper
    Wait 1
    Call Grip_open

    'Allow time for the object to be released
    Wait 1

    'Retract to the approach position
    Move drop_1 -TLZ(50)
Fend


Function Drop2
    'Move to the approach position above the second drop point
    Go drop_2 -TLZ(50)

    'Move to the second drop position
    Speed 20
    Move drop_2

    'Allow the robot to reach the drop position before opening the gripper
    Wait 1
    Call Grip_open

    'Allow time for the object to be released
    Wait 1

    'Retract to the approach position
    Move drop_2 -TLZ(50)
Fend


Function Drop3
    'Move to the approach position above the third drop point
    Go drop_3 -TLZ(50)

    'Move to the third drop position
    Speed 20
    Move drop_3

    'Allow the robot to reach the drop position before opening the gripper
    Wait 1
    Call Grip_open

    'Allow time for the object to be released
    Wait 1

    'Retract to the approach position
    Move drop_3 -TLZ(50)

    'Return the robot to the home position after completing the sequence
    Go home_ref
Fend
