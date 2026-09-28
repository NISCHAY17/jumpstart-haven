# 🍂 Daven Dash

A small endless runner game built with Godot for Hack Club Haven.

Daven is running through an autumn forest, but the path is filled with logs, rocks, mushrooms, and other obstacles.

Your goal is simple:

**Keep running for as long as possible.**

## 🎮 Play

The game can be played directly in the browser through the itch.io version.

## Controls

| Action | Key |
|---|---|
| Jump | Space |
| Restart | Click Play Again |

## Gameplay

- Daven automatically runs forward
- Obstacles spawn randomly
- Press Space to jump over them
- Spawn frequency gradually increases
- Your survival time is tracked
- Touching an obstacle ends the run
- Press Play Again to immediately restart

## Features

- Infinite scrolling background
- Random obstacle generation
- Increasing difficulty
- Character running and jumping animations
- Collision detection
- Survival timer
- Game over screen
- Instant restart system
- Browser/Web export

## Built With

- **Godot 4**
- **GDScript**
- Custom 2D game assets

## Project Structure

```text
GAME/
├── main.tscn
├── title.tscn
├── obstacle.tscn
├── main.gd
├── daven.gd
└── obstacle.gd

ASSET/
├── backgrounds
├── character sprites
├── obstacle sprites
└── UI assets
