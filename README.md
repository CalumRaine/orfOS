# orfOS
Proof-of-concept embedded operating system for the Raspberry Pi Zero to find potential open reading frames in a DNA sequence.

## Features
- Simple usage:
    - Drag your Fasta file into the DROP_HERE folder. 
    - Double click RUN.
    - Drag the kernel.img to your SD card.
    - Insert into Raspberry Pi and power on!
- Find ORFs in all six forward and reverse complement frames
- Provide a single sequence or an entire genome (multiple FASTA headers allowed)
- Non-amino acid character 'X' printed for nucleotide sequence errors.

## Installation
### Cloning
Download the orfOS folder onto the Desktop of your Mac/Linux computer.  Due to the absolute filepaths used in the 'RUN' script, the folder must be situated on the Desktop and no filenames should be changed.  This is easily circumnavigated if you edit the RUN script.

### Input Files
Drag your FASTA file (containing either a single sequence or multiple chromosomes of an entire genome) into the DROP_HERE folder.  This already contains a chromosome from the *Arabidopsis* genome for you to test.  Only the most recently added file is used by the RUN script, so you can either empty this folder or drag more files into it; it doesn't matter.

### Create kernel.img
Double click RUN.  This will replace the kernel.img file with the new one loaded with your input sequence.

### SD Card
Drag kernel.img onto your SD card.  The SD card must be formatted to the FAT filesystem, which is the only one read by Raspberry Pi machines.  There are two really simple ways to load the OS:
1. 
