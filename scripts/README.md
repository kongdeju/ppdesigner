PPdesigner Usage
----------------
### Quick Start ###

PPdesigner is designed for automatically choosing specific probes and qualified primers from target genes, the probes and primers can be used in chip-detection experiment.

#### Usage ####

##### config ppdesigner ######
Add ppdesigner path to the system environment variables $PATH.

	you can edit the config file of bash in you home directory ~/.bashrc

#####  run ppdesigner #####
###### step1 ######
Group target  genes. A dnd file is needed which is made by clustalw. The group is divided by the tree so as to guarantee the appropriate distance across the genes in the same subgroup. If the number of your target genes is not large. This step can be ignored.

	perl ./subgroup.pl <your.dnd> <your.fasta> <-k num>

The k represent the max number of genes in the subgroups. There will be some new  directory generated containing the subgroup fasta file respectively.
###### step2 ######
Run ppdesigner. Aquiring the candidate probes and primers list for each target gene in  the same subgroup. You can go to the directory of conresponding subgroup, and run ppdesigner one by one. Or you can run them in one time using linux shell command "find".
	
	ppdesigner <group$n.fasta>

All the output will be in the directory "./out". There will be several seq_n.txt containing the probe and primer combination candidates which has been ordered by the scores of probes and primers from high to low. while the "n" represents 1..n, it depends on the num of sequences in your fasta file, and the order of n is just that of sequences in your fasta file. In the seq_n.txt, it looks likes as follows.

	


