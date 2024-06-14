# FamilyThing Project

Welcome to the FamilyThing project, a code multiverse revolving around family dynamics and interactions. Below you will find detailed release notes and version history, reflecting the evolution of the project over time.

## Version History

### Version 0.4 [Counters, HashMap]
- **Features Added:**
  - Introduced `BogeyMan` to monitor whether pets have nicknames.
  - Pets without nicknames will be "taken away" by the BogeyMan.
- **Main.java Updates:**
  - Implementation of HashMap to manage pet nicknames.
- **Class Hierarchy:**
  - Family: Social Constructs.

### Version 0.3 [Arrays]
- **Features Added:**
  - Added Pet functionality with support for nicknames and a default name.
- **Main.java Updates:**
  - Arrays utilized for managing multiple pets.
- **Class Hierarchy:**
  - Maintained from previous versions.

### Version 0.2 [Static Class]
- **Features Added:**
  - Dynamic array growth as children are added.
  - Introduced a space-time construct.
- **Class Hierarchy:**
  - Same as previous versions.

### Version 0.1 [Class Hierarchy]
- **Release Notes:**
  - Initial release focusing on establishing a robust class hierarchy.
  - Supported functions include listing siblings, parents, and genomes.

## Development Notes

- **Family Package Requirements:**
  - **Person Class:** Private variables for gender (male or female).
  - **Father Class and Mother Class:** Private variables include numChildren and children (as arrays).
  - **Genome Attributes:** Father (X, Y), Mother (X1, X2).

- **Main.java Structure:**
  - Create two objects: Pavan and Prathima, and link them together.
  - Add children (Nikhita to Pavan, Tejas to Prathima) and establish sibling linkage.
  - Use Random function for selecting X Genome from mother to children.

- **Expected Outputs:**
  - Descriptions of children, parents, siblings, and genomes based on interactions between the objects.

## Pseudo Code Overview

- **Classes:**
  - `Father`, `Mother`, `Person`, `Child`, `Son`, `Daughter`, `Parent`.
  - Methods include `marry`, `addChild`, `describeParents`, `describeSiblings`, `describeGenome`.

This documentation is designed to provide a comprehensive overview of the FamilyThing project, guiding both current users and developers through the functionalities and internal structure of the application.
