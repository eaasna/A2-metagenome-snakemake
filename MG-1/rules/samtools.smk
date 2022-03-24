# -----------------------------
# 
# Rule resources for sorting:
# m: max memory per thread in bytes (default is 500000000)
# t: threads (default single threaded)
#
# thread and memory parameters could also be added to the index and stats commands
# -----------------------------

rule samtools_collate:
	input:
		"mapped_reads/all.sam"
	output:
		"mapped_reads/all_sorted.sam"
	params:
		extra_threads = 9
	threads: 10
	resources:
		nodelist = "cmp[241]",
		mem_mb = 10000
	benchmark:
		repeat("benchmarks/collate.txt", 2)
	shell:
		"samtools collate {input} -o {output} --threads {params.extra_threads}"

