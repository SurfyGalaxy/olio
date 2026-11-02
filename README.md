# Olio <!--ah yes, # <repo name>-->
<!--anyway /genq why are you reading this?-->
A game where you are a CPU, trying to process as many queries as possible before you run out of memory. <!--average windows machine-->

## How to play <!--ooh formal are we? anyway hi-->
<!--fun fact at this point in time our mouse fell off our bed and closed vs codium-->
### Aim of the game
The aim of Olio is to last as long as you can against an infinite queue of maths equations.
<!--it's not possible to last forever-->
<!--especially if you are Ashley-->
<!--oi-->
### Starting / Restarting
Press A to start <!--bc ik someone is gonna not see the massive flashy sign saying "press [A] to start"-->

If you have ran out of memory, press R to return to the main menu

### The queue
The grid <!--of doom-->of <!--*curvy*-->squares is your queue, if it fills to capacity, the system will run out of memory, ending your run.<!--imagine writing a README-->

However, you can only use the bottom set of numbers. <!--the rest of the queue is because she wants you to feel stressed-->

To select a number, click on its button.

To clear the queue, you have to make the number found in the third (rightmost) square, using numbers synthesised<!--send her to the spelling bee--> from the other two numbers.

Each of those "root" <!--rm -rf / --no-preserve-root--> numbers can be used an infinite number of times, as can any number selected.

### Arithmetic
To do arithmetic, put two numbers in both of the middle top squares, select an operation, then press the big rectangle in the centre<!--link (where ma dole?)-->.
<!--mate calm down there's more comment than readme-->
<!--no <3-->

After a short delay, the calculated number will appear in that same space, where you can select it like normal.

To change the number, left click on the register (you will not get the value back)<!--ig `mv RAX RDX` is too hard-->

### Caches
The four rectangles on the right<!--trans rights are human rights, but that's not what this one means--> side of the screen are caches.

To use them, click on an empty one to copy your selected value to the cache, then left click on them to use their value.

To clear a cache, right click on the cache.

Once you have selected the correct value to answer the question, click on the <!--funnily enough--> `"submit"` button. The active query will disappear, and the one above it will become active.

## Notes (minorly important) <!--bc while MIT protects us, we wanna let u know-->

Olio uses `ps`, `uname`, `lscpu`, `whoami`, `hostname`, `gcc`, `ld` when forming the out-of-memory panic screen and the boot screen, aswell as reading from `/proc/cmdline` and `/proc/iomem`

No data is modified nor stored beyond the game.

The uses are as follows:

| Command / File | Use |
| ------- | --- |
| `ps -e -o comm=,pid= \| shuf \| head -n 1` | Generating the `PID` and `Comm` line |
| `uname -r` | Finding the version of your distribution |
| `lscpu \| grep "Model name"` | Finding the CPU in use on your machine |
| `whoami` | username@hostname generation |
| `hostname` | user@hostname generation |
| `gcc --version` | boot sequence |
| `ld --version` | boot sequence |
| `/proc/cmdline` | boot sequence |
| `/proc/iomem` | boot sequence |

As of this release, there is no way to disable the use of these queries via Olio.

## Credits
- Font: DejaVu Sans Mono, copyright Bitstream, Inc. (Bitstream Vera license), see `LICENSE-font.txt`

Made with <3<!--and autism--> by Ashley, Ashton <!--oh hey a shoutout-->and Lily<!--:3 (The cutest one - Ashton)--> for probably a Hack Club YSWS. <!--intended for stardance but i hate the voting system so it goes here-->
