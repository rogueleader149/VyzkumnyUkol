#!/usr/bin/Rscript

args <- commandArgs(TRUE)
infile <- args[1]

res <- scan(infile, list(0))
res <- res[[1]]

print(mean(res))
print(quantile(res, .005))
print(quantile(res, .995))
print(quantile(res, .9995))