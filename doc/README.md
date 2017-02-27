Red Cross Platform
===

Red Cross units are manly powered be volunteers, people that offers some of their
time to provide some assistance to the community they belongs to. Although, a
red cross unit requires different set of skills to be fully independent, the main
focus are on the first aid rescuers.

This platform is aiming to assist volunteers on their activities.
Automating manual activities when possible and reduce the task centralization
when they can be distributed is the main strategy to achieve this goal.

At this stage, the platform will take into consideration, mainly, the following concerns


Resource Organization/Distribution
---
Volunteers offers some of their time distributed over a fixed schedule, Meanwhile
different shifts have different needs, retrieve availability and compute all
the possible combinations can greatly assist in this task.
 - Create Shift schedules
 - Retrieve shift availability
 - Make accessible shift schedule information
 - Make it possible to switch shifts between volunteers


Material Inventory
---
First Aid response requires material to provide assistance to the ones in need.
Keeping track of the material that is being used can prevent unexpected shortages
and improve orders.
  - Keep a record of existing material
  - Register in/out material
  - Create Material Requisitions
  - Configure alerts



Red Cross Unit Structure
---
Prior to provide assistance in any activity is necessary to model the a Red Cross
unit. Modeling will take into consideration Portuguese Red Cross Structure,
none the less, suggestions to make it more generic are welcome.

Red Cross historically follows a military chain of command, so each first aid
rescuer has a rank. Additionally, units also follow a chain of command, there is a
national wide unit and a local unit.

Like a chain of command, each first aid rescuer can be promoted to an higher role,
and those roles also follow an order, for instance, the local unit highest role is
coordinator. When roles are equal they can be manually ordered.

Modeling should consider the following:
  - Each local unit has a local rank
  - There is one national rank
  - Each first aid rescuer requires the following attributes: graduation date; role;
  formations(what, when, validity)
  - They will be assigned to a shift
  - They can switch shifts  
