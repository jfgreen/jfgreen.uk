+++
title = "Gameboy Music"
description = "Resources for making 8 bit beats"
category = "music"
tags = []
+++

## Useful Links

- [LSDJ Homepage](https://www.littlesounddj.com/lsd/index.php)
- [LSDJ ROM image](https://www.littlesounddj.com/lsd/latest/rom_images/stable/) - We are using `lsdj9_2_L-stable.zip`
- [LSDJ Documentation](https://www.littlesounddj.com/lsd/latest/documentation/) - We are using `LSDj_9_2_6.pdf`
- [WASM boy](https://wasmboy.app) -  Gameboy emulation in the browser. (Click open, local file, then select LSDJ rom, press play).
- [Sameboy](https://sameboy.github.io) - Very accurate and optimsed Gameboy emulator
- [Archive of old LSDJ mailing list](https://www.littlesounddj.com/lsd/latest/yahoogroups-archive/lsdj/#/index)
- [LSDJ Facebook Community](https://www.facebook.com/lsdjlsdj/)
- [Defense Mech - Advise on buying a physical cartridge](https://defensemech.com/intense-tech/en/16-so-you-want-a-cartridge-family.md.html)
- [Defense Mech - LSDJ technique blog posts](https://defensemech.com/intense-tech/)
- [Defense Mech - LSDJ technique videos](https://www.youtube.com/playlist?list=PLfhdj6Qak_eg4grCV8vBamremVLrdj9bh)
- [Chiptune on Wikipedia](https://en.wikipedia.org/wiki/Chiptune)
- [Chipmusic forums](https://chipmusic.org)
- [LSDJ Fandom wiki](https://littlesounddj.fandom.com/wiki/Little_Sound_Dj)
- [Extra tools](https://www.littlesounddj.com/lsd/latest/) (E.g for patching in custom samples)

TODO: SAV of demo song

## Music

- [Chipzel - Spectra](https://chipzelmusic.bandcamp.com/album/spectra)
- [Treyfrey - Refresh](https://treyfrey.bandcamp.com/album/refresh)
- [Sabrepulse - Chipbreak Wars](https://sabrepulse.bandcamp.com/album/chipbreak-wars)

TODO: More music!


## WASMboy controls

| Control        | Key                           |
| -------------- | ----------------------------- |
| Direction pad  | `W` `A` `S` `D` or arrow keys |
| A              | `x` or `;` (semicolon)        |
| B              | `z` or backspace              |
| Select         | shift or tab                  |
| Start          | enter                         |


## LSDJ Reference

### Global

| Action                      | Buttons             |
| --------------------------- | ------------------- |
| Switch screens              | SELECT + ←/↓/↑/→    |
| Adjust number by 1          | A + ←/→             |
| Adjust number by 16         | A + ↓/↑             |
| Cut value at cursor         | B + A               |
| Highlight block             | SELECT + B, ←/↓/↑/→ |
| Highlight column or row     | SELECT + (B, B)     |
| Highlight entire screen     | SELECT + (B, B, B)  |
| Copy highlighted block      | B                   |
| Cut highlighted block       | SELECT + A          |
| Paste                       | SELECT + A          |
| Clone chain/phrase/inst     | SELECT + (B, A)     |


### Song screen

| Action                      | Buttons             |
| --------------------------- | ------------------- |
| Move cursor                 | ←/↓/↑/→             |
| New chain                   | A                   |
| Change chain number         | A + ←/↓/↑/→         |
| Edit selected chain         | SELECT + →          |
| Remove chain                | B + A               |
| Play/pause song             | START               |

### Chain screen

| Action                      | Buttons             |
| --------------------------- | ------------------- |
| Move cursor                 | ←/↓/↑/→             |
| Add phrase                  | A                   |
| Change / transpose          | A + ←/↓/↑/→         |
| Edit selected phrase        | SELECT + →          |
| Remove phrase               | B + A               |
| Play/pause chain            | START               |



### Phrase screen

| Action                      | Buttons             |
| --------------------------- | ------------------- |
| Move cursor                 | ←/↓/↑/→             |
| Add note/instrument/command | A                   |
| Modify selected parameter   | A + ←/↓/↑/→         |
| Edit selected instrument    | SELECT + →          |
| Remove note/instrument/cmd  | B + A               |
| Play/pause phrase           | START               |
| Show help on selected cmd   | A, A                |

### Instrument screen

| Action                      | Buttons             |
| --------------------------- | ------------------- |
| Move cursor                 | ←/↓/↑/→             |
| Modify selected parameter   | A + ←/↓/↑/→         |
| Navigate instruments        | B + ←/↓/↑/→         |

### Synth screen

| Action                      | Buttons             |
| --------------------------- | ------------------- |
| Move cursor                 | ←/↓/↑/→             |
| Modify selected parameter   | A + ←/↓/↑/→         |
| Navigate between synths     | B + ←/↓/↑/→         |

### Wave screen

| Action                      | Buttons             |
| --------------------------- | ------------------- |
| Select sample               |  ←/→                |
| Edit sample                 | ↓/↑                 |
| Navigate between waves      | B + ←/↓/↑/→         |

### Table screen

| Action                      | Buttons             |
| --------------------------- | ------------------- |
| Move cursor                 | ←/↓/↑/→             |
| Modify selected parameter   | A + ←/↓/↑/→         |
| Navigate between tables     | B + ←/↓/↑/→         |


### Project screen

| Action                      | Buttons             |
| --------------------------- | ------------------- |
| Move cursor                 | ↓/↑                 |
| Modify selected parameter   | A + ←/↓/↑/→         |
| Perform action              | A                   |

### File screen

| Action                      | Buttons             |
| --------------------------- | ------------------- |
| Move cursor                 | ←/↓/↑/→             |
| Perform action              | A                   |
| Return to project screen    | B                   |

### Groove Screen

| Action                      | Buttons             |
| --------------------------- | ------------------- |
| Move cursor                 | ←/↓/↑/→             |
| Modify selected parameter   | A + ←/↓/↑/→         |
| Modify swing percentage     | A + ↓/↑             |
| Navigate between grooves    | B + ←/↓/↑/→         |

### Commands

| Command | Description        |
| ------- | ------------------ |
| A       | Table Start/Stop   |
| B       | MayBe              |
| C       | Chord              |
| D       | Delay              |
| E       | Amplitude Envelope |
| F       | Frame/Finetune     |
| G       | Groove Select      |
| H       | Hop                |
| K       | Kill Note          |
| L       | Slide              |
| M       | Master Volume      |
| O       | Set Pan            |
| P       | Pitch Bend         |
| R       | Retrig/Resync      |
| S       | Sweep/Shape        |
| T       | Tempo              |
| V       | Vibrato            |
| W       | Wave               |
| Z       | RandomiZe          |

