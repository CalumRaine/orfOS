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
Biologists often want to identify genes in a genome.  These fall between start codons (ATG) and stop codons (TAG/TAA/TGA).  The orfOS operating system allows you to identify all of the potential 'open reading frames' in your pre-loaded sequence.  This embedded program is written entirely in assembly language and uses the cheap/lightweight Raspberry Pi model Zero as a standalone unit that specialises only in rapidly finding ORFs.  It points to a future in which even non-bioinformaticians could load raw long reads from the Oxford Nanopore onto a USB stick, slot it into this Raspberry Pi and imminently begin identifying genes...

## Installation
### Pre-Requisites *(the boring stuff)*
Thankfully there are only two pre-requisites to using orfOS.
- The [arm-none-eabi toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads) must be installed on your computer.  You need to update the first line of the Makefile (orfOS/Program_Files/makefile) with the filepath to your arm compiler.
- Download the orfOS folder from GitHub.  If you have dragged it to the Desktop of your computer then you probably need to do nothing else.  Otherwise you must update the FILEPATH variable in the top line of the RUN script.  Everything else should be taken care of.

### Input Files
Drag your FASTA file (containing either a single sequence or multiple chromosomes of an entire genome) into the DROP_HERE folder.  This already contains a chromosome from the *Arabidopsis* genome for you to test.  Only the most recently added file is used by the RUN script, so you can either empty this folder or drag more files into it; it doesn't matter.

### Create kernel.img
Double click RUN.  You will see a kernel.img file appear in the orfOS folder.  This is pre-loaded with the sequence you dragged into DROP_HERE and is ready to go!

### SD Card
Drag kernel.img onto your SD card.  The SD card must be formatted to the FAT filesystem, which is the only one read by Raspberry Pi machines.  There are two really simple ways to load the OS:
1. Use an SD card that already contains a working Raspberry Pi operating system.  Rename kernel.img to kernel_original.img on the SD card.  Drag kernel.img from the orfOS folder onto your SD card.  (If you ever want to go back, just delete the new kernel.img and revert to the previous one).
2. Use a blank SD card formatted to the FAT fileystem.  Drag kernel.img onto the SD card and also drag the four files in the Minimal Files folder onto the SD card too.  These are the minimum four files required for your Raspberry Pi to run.  They are taken from [this repository](https://github.com/raspberrypi/firmware/tree/master/boot).

## Disclaimer & Notes...
- orfOS prints ORFs to a screen but you cannot save them to a USB stick or transfer them anywhere else.  This was a proof-of-concept model in assembly language.  To write a USB driver in assembly language is inhumane.  However, in theory, writing to a file instead of the screen would make this process lightning fast and would be the first development priority if I were to continue the project.  
- orfOS does not deal with introns.  It unintelligently prints anything between a start codon and a stop codon, regardless of length or content.  The proof-of-concept was designed to prove a bare metal Raspberry Pi operating system; not to prove biology.
- orfOS is designed for use on a 1280x720 screen.  Larger screens may work but have not been tested.  All of the maths for drawing characters and creating newlines are designed around a 1280x720 format so altering the questionnaire in framebuffer.s will not alone fix this problem.  The code should be re-written with variables instead of constants.
