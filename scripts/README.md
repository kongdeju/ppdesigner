PPdesigner Usage
----------------
### Quick Start ###

PPdesigner is designed for automatically choosing specific probes and qualified primers from target genes, the probes and primers can be used in chip-detection experiment.

#### Usage ####

##### config ppdesigner ######
Add ppdesigner path to the system environment variables $PATH.

	you can edit the config file of bash in you home directory ~/.bashrc

#####  run ppdesigner #####
Go to the directory of your fasta file, then run ppdesigner.
	
	ppdesigner <your.fasta>

##### check outcome #####
All the output will be in the directory "./out". There will be several seq_n.txt containing the probe and primer combination which has been ordered by the scores of probes and primers from high to low. while the "n" represents 1..n, it depends on the num of sequences in your fasta file, and the order of n is just that of sequences in your fasta file.


	
