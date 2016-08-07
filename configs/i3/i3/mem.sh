#!/bin/bash
awk '
/^MemTotal:/ {
	mem_total=$2
}
/^MemAvailable:/ {
	mem_free=$2
}
END {
	printf("MEM %.1f/%.1f GiB\n", mem_free/1024/1024,
mem_total/1024/1024)
}
' /proc/meminfo
