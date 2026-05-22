[iterm2-themes]: https://github.com/mbadolato/iTerm2-Color-Schemes
[color-scripts]: https://github.com/stark/Color-Scripts/tree/master/color-scripts
[license]: https://opensource.org/licenses/MIT
[license-badge]:  https://img.shields.io/github/license/open-cli-collective/kitty-themes.svg?style=for-the-badge

![kitty-themes](./.github/kitty-themes.jpg)

> **Personalize** your *kitty* terminal and choose your theme from this awesome
> collection, for more information on the terminal visit
> https://github.com/kovidgoyal/kitty

[![License: MIT][license-badge]][license]
[![All Contributors](https://img.shields.io/badge/all_contributors-9-green.svg?style=for-the-badge)](#contributors)

- [Featured themes](#featured-themes)
- [Installation](#installation)
  - [Homebrew](#homebrew)
  - [Source Code](#source-code)
  - [Conda](#conda)
- [About](#about)
- [Why This Fork?](#why-this-fork)
- [License](#license)
- [Bring me to the previews!](#previews)
- [Contributors](#contributors)

## Featured themes

A coordinated light/dark pair designed for readability. Both fix common ANSI-color failure modes (invisible whites, near-invisible yellows, contrast-broken selection backgrounds) that you'll see in a lot of older themes.

### Mithril (light)
![Mithril](./previews/Mithril/preview.png)

A cool, near-white background with vibrant accents. Every ANSI color hits ≥4.5:1 contrast against the background except `color7`, which is intentionally muted for use as a "dim" color. Paired selection foreground + background so selected text stays readable.

### Ithildin (dark)
![Ithildin](./previews/Ithildin/preview.png)

Dark counterpart to Mithril. Deep stone background, silver foreground (not the khaki/cream tone common to older dark themes), brighter cool accents. Named for the "starmoon" inlay on the Doors of Durin — visible only by moon- and starlight.

## Installation

### Homebrew

The easiest way to install on macOS or Linux:

```bash
brew install open-cli-collective/tap/kitty-themes
```

Then add to your `kitty.conf`:

```
include /opt/homebrew/opt/kitty-themes/share/kitty-themes/Dracula.conf
```

> **Note:** On Intel Macs or Linux, the path is `/usr/local/opt/kitty-themes/share/kitty-themes/`

### Source Code

1. If you want to download and use one of these theme you have two options:
    - clone the entire *kitty-themes* repository:
      ```bash
      git clone --depth 1 https://github.com/open-cli-collective/kitty-themes.git ~/.config/kitty/kitty-themes
      ```
   - or download just one theme:
      ```bash
      THEME=https://raw.githubusercontent.com/open-cli-collective/kitty-themes/main/themes/3024_Day.conf
      wget "$THEME" -P ~/.config/kitty/kitty-themes/themes
      ```

2. Choose a theme and create a symlink:

    ```bash
    cd ~/.config/kitty
    ln -s ./kitty-themes/themes/Floraverse.conf ~/.config/kitty/theme.conf
    ```

3. Add this line to your kitty.conf configuration file:

    ```
    include ./theme.conf
    ```

### Conda

> **Note:** The conda-forge package may be outdated as it pulls from the original repository. We recommend using Homebrew or cloning directly from this fork.

If you're using the `conda` package manager:

```bash
conda install -c conda-forge kitty-themes
```

## About

A collection of 169+ themes for the [kitty terminal emulator](https://github.com/kovidgoyal/kitty), ported from [iTerm2-Color-Schemes][iterm2-themes]. You can find the previews for each theme in the [section below](#previews).

## Why This Fork?

This is a community-maintained fork of [kitty-themes](https://github.com/dexpota/kitty-themes), originally created by [Fabrizio Destro](https://github.com/dexpota).

The original repository hasn't been actively maintained since 2019. This fork provides:

- **Active maintenance** - Bug fixes and new themes
- **Homebrew distribution** - Easy installation via `brew install`
- **Automated releases** - CI/CD pipeline with versioned releases
- **Theme validation** - All themes are validated for correct format

## License

All original content of this repository is licensed with the [MIT
License](./LICENSE.md). Whenever possible the author of the theme is cited
inside each theme configuration file, together with its license. Hit me up if
you find your theme inside this repository and you want a proper citation.

## Previews

If you have followed the [installation](#installation) instructions and cloned
the entire repo, you have two options to try a theme:

1. If you have enabled remote control in *kitty* you can run this command:

    ```bash
    kitty @ set-colors -a "~/.config/kitty/kitty-themes/themes/AdventureTime.conf"
    ```

2. Otherwise you can start another instance of kitty and specify another config
  file to read from, this will cause *kitty* to read both its normal config
  file and the specified one:

    ```bash
    kitty -o include="~/.config/kitty/kitty-themes/themes/AdventureTime.conf"
    ```

### Bonus

Try your new theme with one of the scripts in [Color-scripts][color-scripts] with this
one-liner (requires `jq`):

```bash
COLOR_SCRIPT_REPO=https://api.github.com/repos/stark/Color-Scripts/contents/color-scripts
wget -q -O - $(curl -s $COLOR_SCRIPT_REPO | jq '.[] | "\(.path) \(.download_url)"' -r | shuf -n1 | cut -d " " -f2) | bash
```

### 3024 Day
![image](./previews/3024_Day/preview.png)
### 3024 Night
![image](./previews/3024_Night/preview.png)
### AdventureTime
![image](./previews/AdventureTime/preview.png)
### Afterglow
![image](./previews/Afterglow/preview.png)
### AlienBlood
![image](./previews/AlienBlood/preview.png)
### Alucard
![image](./previews/Alucard/preview.png)
### Apprentice
![image](./previews/Apprentice/preview.png)
### Argonaut
![image](./previews/Argonaut/preview.png)
### Arthur
![image](./previews/Arthur/preview.png)
### AtelierSulphurpool
![image](./previews/AtelierSulphurpool/preview.png)
### Atom
![image](./previews/Atom/preview.png)
### AtomOneLight
![image](./previews/AtomOneLight/preview.png)
### ayu
![image](./previews/ayu/preview.png)
### ayu light
![image](./previews/ayu_light/preview.png)
### ayu mirage
![image](./previews/ayu_mirage/preview.png)
### Batman
![image](./previews/Batman/preview.png)
### Belafonte Day
![image](./previews/Belafonte_Day/preview.png)
### Belafonte Night
![image](./previews/Belafonte_Night/preview.png)
### BirdsOfParadise
![image](./previews/BirdsOfParadise/preview.png)
### Blazer
![image](./previews/Blazer/preview.png)
### Borland
![image](./previews/Borland/preview.png)
### Bright Lights
![image](./previews/Bright_Lights/preview.png)
### Broadcast
![image](./previews/Broadcast/preview.png)
### Brogrammer
![image](./previews/Brogrammer/preview.png)
### C64
![image](./previews/C64/preview.png)
### Chalk
![image](./previews/Chalk/preview.png)
### Chalkboard
![image](./previews/Chalkboard/preview.png)
### Ciapre
![image](./previews/Ciapre/preview.png)
### CLRS
![image](./previews/CLRS/preview.png)
### Cobalt2
![image](./previews/Cobalt2/preview.png)
### Cobalt Neon
![image](./previews/Cobalt_Neon/preview.png)
### CrayonPonyFish
![image](./previews/CrayonPonyFish/preview.png)
### Dark Pastel
![image](./previews/Dark_Pastel/preview.png)
### Darkside
![image](./previews/Darkside/preview.png)
### Desert
![image](./previews/Desert/preview.png)
### DimmedMonokai
![image](./previews/DimmedMonokai/preview.png)
### DotGov
![image](./previews/DotGov/preview.png)
### Dracula
![image](./previews/Dracula/preview.png)
### Dumbledore
![image](./previews/Dumbledore/preview.png)
### Duotone Dark
![image](./previews/Duotone_Dark/preview.png)
### Earthsong
![image](./previews/Earthsong/preview.png)
### Elemental
![image](./previews/Elemental/preview.png)
### ENCOM
![image](./previews/ENCOM/preview.png)
### Espresso
![image](./previews/Espresso/preview.png)
### Espresso Libre
![image](./previews/Espresso_Libre/preview.png)
### Fideloper
![image](./previews/Fideloper/preview.png)
### FishTank
![image](./previews/FishTank/preview.png)
### Flat
![image](./previews/Flat/preview.png)
### Flatland
![image](./previews/Flatland/preview.png)
### Floraverse
![image](./previews/Floraverse/preview.png)
### FrontEndDelight
![image](./previews/FrontEndDelight/preview.png)
### FunForrest
![image](./previews/FunForrest/preview.png)
### Galaxy
![image](./previews/Galaxy/preview.png)
### Github
![image](./previews/Github/preview.png)
### Glacier
![image](./previews/Glacier/preview.png)
### GoaBase
![image](./previews/GoaBase/preview.png)
### Grape
![image](./previews/Grape/preview.png)
### Grass
![image](./previews/Grass/preview.png)
### gruvbox dark
![image](./previews/gruvbox_dark/preview.png)
### gruvbox light
![image](./previews/gruvbox_light/preview.png)
### Hardcore
![image](./previews/Hardcore/preview.png)
### Harper
![image](./previews/Harper/preview.png)
### Highway
![image](./previews/Highway/preview.png)
### Hipster Green
![image](./previews/Hipster_Green/preview.png)
### Homebrew
![image](./previews/Homebrew/preview.png)
### Hurtado
![image](./previews/Hurtado/preview.png)
### Hybrid
![image](./previews/Hybrid/preview.png)
### IC Green PPL
![image](./previews/IC_Green_PPL/preview.png)
### IC Orange PPL
![image](./previews/IC_Orange_PPL/preview.png)
### idleToes
![image](./previews/idleToes/preview.png)
### IR Black
![image](./previews/IR_Black/preview.png)
### Jackie Brown
![image](./previews/Jackie_Brown/preview.png)
### Japanesque
![image](./previews/Japanesque/preview.png)
### Jellybeans
![image](./previews/Jellybeans/preview.png)
### JetBrains Darcula
![image](./previews/JetBrains_Darcula/preview.png)
### Kibble
![image](./previews/Kibble/preview.png)
### Later This Evening
![image](./previews/Later_This_Evening/preview.png)
### Lavandula
![image](./previews/Lavandula/preview.png)
### LiquidCarbon
![image](./previews/LiquidCarbon/preview.png)
### LiquidCarbonTransparent
![image](./previews/LiquidCarbonTransparent/preview.png)
### LiquidCarbonTransparentInverse
![image](./previews/LiquidCarbonTransparentInverse/preview.png)
### Man Page
![image](./previews/Man_Page/preview.png)
### Material
![image](./previews/Material/preview.png)
### MaterialDark
![image](./previews/MaterialDark/preview.png)
### Mathias
![image](./previews/Mathias/preview.png)
### Medallion
![image](./previews/Medallion/preview.png)
### Misterioso
![image](./previews/Misterioso/preview.png)
### Molokai
![image](./previews/Molokai/preview.png)
### MonaLisa
![image](./previews/MonaLisa/preview.png)
### Monokai Classic
![image](./previews/Monokai_Classic/preview.png)
### Monokai Pro
![image](./previews/Monokai_Pro/preview.png)
### Monokai Pro (Filter Machine)
![image](./previews/Monokai_Pro_(Filter_Machine)/preview.png)
### Monokai Pro (Filter Octagon)
![image](./previews/Monokai_Pro_(Filter_Octagon)/preview.png)
### Monokai Pro (Filter Ristretto)
![image](./previews/Monokai_Pro_(Filter_Ristretto)/preview.png)
### Monokai Pro (Filter Spectrum)
![image](./previews/Monokai_Pro_(Filter_Spectrum)/preview.png)
### Monokai Soda
![image](./previews/Monokai_Soda/preview.png)
### N0tch2k
![image](./previews/N0tch2k/preview.png)
### Neopolitan
![image](./previews/Neopolitan/preview.png)
### Neutron
![image](./previews/Neutron/preview.png)
### NightLion v1
![image](./previews/NightLion_v1/preview.png)
### NightLion v2
![image](./previews/NightLion_v2/preview.png)
### Nova
![image](./previews/Nova/preview.png)
### Novel
![image](./previews/Novel/preview.png)
### Obsidian
![image](./previews/Obsidian/preview.png)
### Ocean
![image](./previews/Ocean/preview.png)
### OceanicMaterial
![image](./previews/OceanicMaterial/preview.png)
### Ollie
![image](./previews/Ollie/preview.png)
### OneDark
![image](./previews/OneDark/preview.png)
### Parasio Dark
![image](./previews/Parasio_Dark/preview.png)
### PaulMillr
![image](./previews/PaulMillr/preview.png)
### PencilDark
![image](./previews/PencilDark/preview.png)
### PencilLight
![image](./previews/PencilLight/preview.png)
### Piatto Light
![image](./previews/Piatto_Light/preview.png)
### Pnevma
![image](./previews/Pnevma/preview.png)
### Pro
![image](./previews/Pro/preview.png)
### Red Alert
![image](./previews/Red_Alert/preview.png)
### Red Sands
![image](./previews/Red_Sands/preview.png)
### Relaxed Afterglow
![image](./previews/Relaxed_Afterglow/preview.png)
### Renault Style
![image](./previews/Renault_Style/preview.png)
### Renault Style Light
![image](./previews/Renault_Style_Light/preview.png)
### Rippedcasts
![image](./previews/Rippedcasts/preview.png)
### Royal
![image](./previews/Royal/preview.png)
### Seafoam Pastel
![image](./previews/Seafoam_Pastel/preview.png)
### SeaShells
![image](./previews/SeaShells/preview.png)
### Seti
![image](./previews/Seti/preview.png)
### Shaman
![image](./previews/Shaman/preview.png)
### Slate
![image](./previews/Slate/preview.png)
### Smyck
![image](./previews/Smyck/preview.png)
### snazzy
![image](./previews/snazzy/preview.png)
### SoftServer
![image](./previews/SoftServer/preview.png)
### Solarized Darcula
![image](./previews/Solarized_Darcula/preview.png)
### Solarized Dark
![image](./previews/Solarized_Dark/preview.png)
### Solarized Dark Higher Contrast
![image](./previews/Solarized_Dark_Higher_Contrast/preview.png)
### Solarized Dark - Patched
![image](./previews/Solarized_Dark_-_Patched/preview.png)
### Solarized Light
![image](./previews/Solarized_Light/preview.png)
### Source Code X
![image](./previews/Source_Code_X/preview.png)
### Spacedust
![image](./previews/Spacedust/preview.png)
### SpaceGray
![image](./previews/SpaceGray/preview.png)
### SpaceGray Eighties
![image](./previews/SpaceGray_Eighties/preview.png)
### SpaceGray Eighties Dull
![image](./previews/SpaceGray_Eighties_Dull/preview.png)
### Spiderman
![image](./previews/Spiderman/preview.png)
### Spring
![image](./previews/Spring/preview.png)
### Square
![image](./previews/Square/preview.png)
### Sundried
![image](./previews/Sundried/preview.png)
### Symfonic
![image](./previews/Symfonic/preview.png)
### Tango Dark
![image](./previews/Tango_Dark/preview.png)
### Tango Light
![image](./previews/Tango_Light/preview.png)
### Teerb
![image](./previews/Teerb/preview.png)
### Thayer Bright
![image](./previews/Thayer_Bright/preview.png)
### The Hulk
![image](./previews/The_Hulk/preview.png)
### Tomorrow
![image](./previews/Tomorrow/preview.png)
### Tomorrow Night
![image](./previews/Tomorrow_Night/preview.png)
### Tomorrow Night Blue
![image](./previews/Tomorrow_Night_Blue/preview.png)
### Tomorrow Night Bright
![image](./previews/Tomorrow_Night_Bright/preview.png)
### Tomorrow Night Eighties
![image](./previews/Tomorrow_Night_Eighties/preview.png)
### ToyChest
![image](./previews/ToyChest/preview.png)
### Treehouse
![image](./previews/Treehouse/preview.png)
### Twilight
![image](./previews/Twilight/preview.png)
### Ubuntu
![image](./previews/Ubuntu/preview.png)
### Urple
![image](./previews/Urple/preview.png)
### Vaughn
![image](./previews/Vaughn/preview.png)
### VibrantInk
![image](./previews/VibrantInk/preview.png)
### WarmNeon
![image](./previews/WarmNeon/preview.png)
### Wez
![image](./previews/Wez/preview.png)
### WildCherry
![image](./previews/WildCherry/preview.png)
### Wombat
![image](./previews/Wombat/preview.png)
### Wryan
![image](./previews/Wryan/preview.png)
### Zenburn
![image](./previews/Zenburn/preview.png)

## Contributors

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
<table>
  <tr>
    <td align="center"><a href="http://www.scopatz.com"><b>Anthony Scopatz</b></a><br /><a href="https://github.com/open-cli-collective/kitty-themes/commits?author=scopatz" title="Documentation">📖</a></td>
    <td align="center"><a href="https://rckt.cc"><b>RCKT</b></a><br /><a href="#theme-orangecoloured" title="New theme added to the collection">😻</a></td>
    <td align="center"><a href="https://github.com/varmanishant"><b>varmanishant</b></a><br /><a href="#theme-varmanishant" title="New theme added to the collection">😻</a></td>
    <td align="center"><a href="https://github.com/rlerdorf"><b>Rasmus Lerdorf</b></a><br /><a href="https://github.com/open-cli-collective/kitty-themes/issues?q=author%3Arlerdorf" title="Bug reports">🐛</a> <a href="#ideas-rlerdorf" title="Ideas, Planning, & Feedback">🤔</a></td>
    <td align="center"><a href="https://github.com/Luflosi"><b>Luflosi</b></a><br /><a href="#fix-Luflosi" title="Fixed a theme">🛠️</a> <a href="#question-Luflosi" title="Answering Questions">💬</a> <a href="https://github.com/open-cli-collective/kitty-themes/commits?author=Luflosi" title="Documentation">📖</a></td>
    <td align="center"><a href="https://holyday.me"><b>Connor Holyday</b></a><br /><a href="#fix-connorholyday" title="Fixed a theme">🛠️</a></td>
    <td align="center"><a href="https://github.com/BlueDrink9"><b>BlueDrink9</b></a><br /><a href="https://github.com/open-cli-collective/kitty-themes/issues?q=author%3ABlueDrink9" title="Bug reports">🐛</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/brujoand"><b>Anders Brujordet</b></a><br /><a href="#theme-brujoand" title="New theme added to the collection">😻</a></td>
    <td align="center"><a href="http://www.hackouts.com"><b>Rajesh Rajendran</b></a><br /><a href="#fix-rjshrjndrn" title="Fixed a theme">🛠️</a></td>
  </tr>
</table>

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
