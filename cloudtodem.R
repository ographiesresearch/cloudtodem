#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)

input_path <- args[1]

Sys.setenv(INPUT_PATH = input_path)

targets::tar_make()