# Cradle of Rust

**Team:** The Netrunners  

---

## Team Members

| Name           | Role                          | Responsibilities                        |
|----------------|-------------------------------|----------------------------------------|
| Aryana Aiken   | UI/UX Designer & Frontend Dev | Menus, HUD, UI scripts                  |
| Tyler Walters  | Backend Developer             | Game data, JSON, systems                |
| Safia Nassiri  | Level Designer & Gameplay Prog| Level layouts, gameplay scripts         |

---

## Project Overview

*Cradle of Rust* is a story-driven survival and choice-based game blending elements of:

- Dead Space  
- Hollow Knight  
- Detroit: Become Human  
- Frostpunk  
- Omori  

Players are trapped inside a decaying facility and must explore, scavenge resources, and make morally and economically challenging decisions. Their choices affect the facility's AI and the game world, creating a branching narrative with multiple endings:

- Escape  
- Integration with the AI  
- Complete collapse of the facility  

The gameplay includes resource gathering and adaptive puzzles.

---

## Core Mechanics

- **Resource Allocation:** Decide between repairing the facility (selfless) or upgrading yourself (selfish).  
- **Morality System:** Tracks selfish vs. selfless actions.  
- **Environmental Stability & AI Trust:** Affected by player decisions.  
- **Branching Narrative:** Choices create multiple potential storylines and endings.

**Target Audience:** Players who enjoy narrative-rich, morally complex survival games with replayable storylines.

---

## Project Scope & Feasibility

- **Timeline:** 3 months, with a playable build by the end of the term.  
- **Constraints:** Time management, technical skills (Godot familiarity), asset creation.  
- **Risks & Mitigation:**  
  - Scope Creep: Start with a small prototype.  
  - Integration Issues: Frequent collaboration & testing.  
  - Resource Limitations: Use free/open-source assets.  
  - Scheduling Conflicts: Weekly meetings + Discord communication.  

Despite challenges, the project scope is realistic, focusing on visual design quality, replayability, and mechanical depth.

---

## Architecture & Tools

- **Engine:** Godot 4.5  
- **Language:** GDScript  
- **Version Control:** Git/GitHub  

**System Requirements:**  
- PC with keyboard/mouse, 1080p monitor, speakers/headphones  
- Standalone local execution, no external servers  
- Save data managed via JSON files  

**Non-functional Requirements:**  
- Optimized for mid-range PCs  
- Compatible with Windows, macOS, Linux  
- Intuitive UI & keyboard/mouse controls  
- Scalable for future expansions  

---

## Data Management

- **Real-Time Layer:** Managed by GDScript scripts (player health, AI trust, resources).  
- **Persistent Storage:** JSON files store save data between sessions.  

| Data Category       | Real-Time (GDScript)                  | Persistent (JSON)                             |
|--------------------|--------------------------------------|-----------------------------------------------|
| Player State       | Health, inventory, abilities          | Health, inventory, location, abilities       |
| Facility State     | AI trust, facility health             | Health %, trust level, morality flags        |
| Resource & Map     | Resource tracking, respawn timers     | Resource locations, quantities, difficulty   |
| Dialogue & Narrative | Branching logic                     | Dialogue trees, scene text                    |

**Data Inputs:** Player actions, JSON/static data loading  
**Data Outputs:** UI updates, audio/visual feedback, JSON saving  

---

## User Interactions

- **UI/UX:** Intuitive interface with HUD, menus, and clear text/content display.  
- **User Inputs:** Keyboard and mouse  
- **Expected Outputs:** Immediate visual/audio feedback and updated game state  

---

## Testing & Definition of Done

- **Code Testing:**  
  - Builds without errors  
  - Peer review  
  - Documentation/comments  
  - Functionality testing for all gameplay systems  
  - Unit testing for scripts & components  
  - Performance testing  

- **Definition of Done:** The project is considered complete when:  
  - Core mechanics are functional  
  - Narrative branching works  
  - Game can be saved and loaded reliably  
  - No major crashes or bugs  

**Final Product:** Standalone executable demonstrating all core systems, narrative structure, and gameplay features.

---

*Cradle of Rust* is designed to deliver a rich, morally-driven survival experience, balancing narrative depth with challenging decision-making and resource management.
