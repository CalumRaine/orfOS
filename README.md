# orfOS
Proof-of-concept embedded operating system for the Raspberry Pi Zero to find potential open reading frames in a DNA sequence.

## Features
- Simple usage:
    - Drag your Fasta file into the DROP_HERE folder. 
    - Double click RUN.
    - Drag the kernel.img to your SD card.
    - Insert into Raspberry Pi and power on!
- Find ORFs in all six forward and reverse complement frames.
- Provide a single sequence or an entire genome (multiple FASTA headers allowed).
- Non-amino acid character 'X' printed for nucleotide sequence errors.

## Introduction
Biologists often want to identify genes in a genome.  These fall between start codons (ATG) and stop codons (TAG/TAA/TGA).  The orfOS operating system allows you to identify all of these potential genes in your pre-loaded sequence.  This embedded program is written entirely in assembly language and uses the cheap/lightweight Raspberry Pi model Zero as a standalone unit that specialises only in rapidly finding ORFs.  It points to a future in which even non-bioinformaticians could load raw long reads from the Oxford Nanopore onto a USB stick, slot it into this Raspberry Pi and imminently begin identifying genes...

## Installation
### A) Pre-Requisites *(the boring stuff)*
Thankfully there are only two pre-requisites to using orfOS.
1. The [arm-none-eabi toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads) must be installed on your computer.  You need to update the first line of the Makefile (orfOS/Program_Files/makefile) with the filepath to your arm compiler.
2. Download the orfOS folder from GitHub.  If you have dragged it to the Desktop of your computer then you probably need to do nothing else.  Otherwise you must update the FILEPATH variable in the top line of the RUN script.

### B) Input Files
Drag your FASTA file (containing either a single sequence or multiple chromosomes of an entire genome) into the DROP_HERE folder.  This already contains a chromosome from the *Arabidopsis* genome for you to test.  Only the most recently added file is used by the RUN script, so you can either empty this folder or drag more files into it; it doesn't matter.

### C) Create kernel.img
Double click RUN.  You will see a kernel.img file appear in the orfOS folder.  This is pre-loaded with the sequence you dragged into DROP_HERE and is ready to go!

### D) SD Card
Drag kernel.img onto your SD card.  The SD card must be formatted to the FAT filesystem, which is the only one read by Raspberry Pi machines.  There are two really simple ways to load the OS:
1. Use an SD card that already contains a working Raspberry Pi operating system.  Rename kernel.img to something else.  Drag kernel.img from the orfOS folder onto your SD card.  (If you ever want to go back, just delete the new kernel.img and revert to the previous one).
2. Use a blank SD card formatted to the FAT fileystem.  Drag kernel.img onto the SD card and also drag the four files in the Minimal Files folder onto the SD card too.  These are the minimum four files required for your Raspberry Pi to run.  They are taken from [this repository](https://github.com/raspberrypi/firmware/tree/master/boot).

<br />

## Disclaimer & Notes...
- orfOS prints ORFs to a screen but you cannot yet save them to a USB stick, transfer them anywhere or doing anything with them.  This was a proof-of-concept model in assembly language.  To write a USB driver in assembly language is inhumane.  However, in theory, writing to a file instead of the screen would make this process lightning fast and would be the first development priority if I were to continue the project.  
- orfOS does not deal with introns.  It unintelligently prints anything between a start codon and a stop codon, regardless of length or content.  The proof-of-concept was designed to prove a bare metal Raspberry Pi operating system; not to prove biology.
- orfOS is designed for use on a 1280x720 screen.  Larger screens may work but have not been tested.  All of the maths for drawing characters and scrolling are designed around a 1280x720 format so altering the questionnaire in framebuffer.s will not alone fix this problem.  The code should be re-written with variables instead of constants.

<br />

## File-by-File Explanation
- **orfOS**
    - **DROP_HERE:** Drag your FASTA file into this folder before clicking 'RUN'.  Only the most recently dropped file is used by the 'RUN' script, so empty this periodically or drag more files in; it doesn't matter.
    - **RUN:** Double click this to load your sequence into the OS, compile the kernel and go!
    - **Minimal_Files:** The minimum files required to boot and run a Raspberry Pi.  Taken from [this repository](https://github.com/raspberrypi/firmware/tree/master/boot).  Necessary if using step 2 of the SD card installation from above. 
    - **Program_Files**
        - **Makefile:** Taken from @Chadderz121 [tutorial](https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/ok01.html).  Be sure to update the first line with the filepath to your own arm compiler toolchain.
        - **build:** The folder into which the compiled object files go.
        - **kernel.ld / kernel.map / kernel.list:** Files related to linking object files together for the final binary kernel.
        - **template:** An empty version of write_to_screen.s which is used when you click 'RUN' to load your sequence into and is subsequently moved into the 'source' directory.
        - **source**
            - **init.s:** The Pi initialises here.  Does nothing but branches to the main.s code.  Can probably be consolidated into a single file *(but it's doing no harm!)*
            - **main.s:** The core of orfOS.  Other functions are called from here and the main ORF-scanning happens from here.
            - **framebuffer.s:** Requests the Raspberry Pi to set up a 1280x720 screen for use in memory mapped input output (MMIO).
            - **write_to_screen.s:** Contains all of the functions required to draw letters and scroll up etc.

<br />

## Acknowledgements & Resources
For this project I began with the @Chadderz121 [tutorial](https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/ok01.html) with explanations from the @jsandler18 [tutorial](https://jsandler18.github.io/).  Although the latter was written in C++, it was imperative in helping me to understand the boot process and mailbox system of the Raspberry Pi so I could implement my own assembly language.  In the end I didn't directly use any of @Chadderz121 code but beginning with a working model to experimentally break was a far healthier starting position than trying to write everything from scratch.  Posts on the [Raspberry Pi Bare Metal Forum](https://www.raspberrypi.org/forums/viewforum.php?f=72) helped me to understand how the Pi uses bit depth to draw colour.  It is a refreshingly active and great resource, full of great minds.  The [BrokenThorn Entertainment tutorials](http://www.brokenthorn.com/Resources/OSDevIndex.html) are an absolute joy to read and allowed me to build my first prototype on the Intel architecture.  The biggest thank you goes to Nick Blundell whose [YouTube series](https://www.youtube.com/user/blundelnyt/videos) on the Intel boot process was the pivotal point between giving up and realising this was possible.  It has been the most validating task of my life, you all unwittingly rescued me.  To anybody who read this far: never forget that computing is all about what you *can* do; it's just filled with people trying to tell you what you *can't* do.  Ignore them.  They are wrong.
