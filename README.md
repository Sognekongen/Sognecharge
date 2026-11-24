# Sognecharge

A lightweight, one-button smart mobility addon for Warriors (built for **Octowow 1.18.1** / **1.12**). 

**Sognecharge** automates stance-dancing and target acquisition so you can seamlessly gap-close to enemies or peel for allies using a single keybind or macro.

## Features

* **All-in-One Smart Mobility:** Automatically selects the right ability based on your target and combat state:
  * **Friendly Target:** Switches to *Defensive Stance* and casts **Intervene**.
  * **Hostile Target (Out of Combat):** Switches to *Battle Stance* and casts **Charge**.
  * **Hostile Target (In Combat):** Switches to *Berserker Stance* and casts **Intercept**.
* **Auto-Targeting:** If you don't have a target (or your current target is dead), it automatically clears your target and grabs the nearest enemy.
* **SuperMacro & iWin Compatibility:** Exposes `GetStance()` and `Charge()` globally (`_G`) to prevent nil-value errors and crashes in external macro addons.
* **Simple Slash Commands:** Trigger the logic directly from any macro or chat window without needing complex conditionals.

## Installation

1. Download or clone this repository.
2. Copy the `Sognecharge` folder into your World of Warcraft directory:
   ```text
   World of Warcraft\Interface\AddOns\
