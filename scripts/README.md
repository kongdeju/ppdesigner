PPdesigner Usage
----------------
## Quick Start ##

PPdesigner is designed for automatically choosing specific probes and qualified primers from target genes, the probes and primers can be used in chip-detection experiment.

### Usage ###

#### config ppdesigner #####
Add ppdesigner path to the system environment variables $PATH.

	you can edit the config file of bash in you home directory ~/.bashrc

####  run ppdesigner #####
##### step1	 Group target genes#####
Group target  genes. A dnd file is needed which is made by clustalw. The group is divided by the tree so as to guarantee the appropriate distance across the genes in the same subgroup. If the number of your target genes is not large. This step can be ignored.

	subgroup <your.dnd> <your.fasta> <-k num>

The k represent the max number of genes in the subgroups. There will be some new  directory generated containing the subgroup fasta file respectively.
##### step2 	 Run ppdesigner #####
Run ppdesigner. Aquiring the candidate probes and primers list for each target gene in  the same subgroup. You can go to the directory of conresponding subgroup, and run ppdesigner one by one. Or you can run them in one time using linux shell command "find".
	
	ppdesigner <group$n.fasta>

All the output will be in the directory "./out". There will be several seq_n.txt containing the probe and primer combination candidates which has been ordered by the scores of probes and primers from high to low. while the "n" represents 1..n, it depends on the num of sequences in your fasta file, and the order of n is just that of sequences in your fasta file. In the seq_n.txt, it looks likes as follows.
#### step3 Predict the specification of probe ####
Select ideal the probe and primer in seq_$n.txt file. and put the line at the first line of seq_$n.txt. Then you can run predict.pl to predict the possible crossing reaction between probes. Note that you need go to the "out" directory, and run predict as follows.

	predict <group$n.fasta>
	
Several files will be generated after this step. you need to pay attention to the file "pro_reg.bsp.xls".1 stands for this probe only combines to its region which indicates good specification. number more than 1 stands for the probe may has corss reaction, you may need go to the last time, and change the probe or primers and run predict again untill you get a proper probes and primers combination.

#### step4 Extract probes and primers to a file ####
If you complete the last step. you can extract the probes and primers to a file.

	extract <grout$n.fasta>

You can get  your outcome "primer.xls" "probe.xls".
