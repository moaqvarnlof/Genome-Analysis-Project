if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("DESeq2", force = TRUE)
library(DESeq2)

BiocManager::install("apeglm")
library(apeglm)

BiocManager::install("pheatmap")
library(pheatmap)
library(ggplot2)

BiocManager::install("heatmaps")

directory = "/Users/moaqvarnlof/htseq_output/"
info="/Users/moaqvarnlof/cultures.csv"
output="/Users/moaqvarnlof/deseq_output/"

sampleFiles = grep("txt",list.files(directory), value=TRUE)
sampleCondition = read.csv(info, row.names = 1)
sampleCondition <- sampleCondition[,c("culture")]

sampleTable = data.frame(sampleName = sampleFiles, fileName = sampleFiles, condition = sampleCondition)
sampleTable$condition <- factor(sampleTable$condition)

ddsHTSeq = DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, directory = directory, design= ~ condition)
dds <- DESeq(ddsHTSeq)
res <- results(dds)
res <- res[order(res$padj),]
summary(res)

resultsNames(dds)

keep <- rowSums(counts(dds)) >= 100

sum(res$padj < 0.1, na.rm=TRUE)

resLFC <- lfcShrink(dds, coef="condition_Mineral_vs_Continous", type="apeglm")

summary(resLFC)

resOrdered_l2fc <- res[order(abs(res$log2FoldChange), decreasing = TRUE),]

vsd <- vst(dds)
png(paste(output,"_PCA.png", sep = ""))
plotPCA(vsd, intgroup=c("condition"))
dev.off()

png(paste(output,"_MA.png", sep = ""))
plotMA(res, ylim=c(-2,2))
dev.off()

png(paste(output,"MA_LFC.png", sep = ""))
plotMA(resLFC, ylim=c(-2,2))
dev.off()

png(paste(output,"plot_counts.png", sep = ""))
plotCounts(dds, gene=which.min(res$padj), intgroup="condition")
dev.off()

significant <- rownames(resOrdered_l2fc[1:30, ])
significant

DDS <- vsd
colData(DDS)$sizeFactor <- c("29", "30", "31", "32", "33","88", "89", "90", "91", "92")
colnames(colData(DDS)) <- c("condition", "sample name")
colData(DDS)
df <- as.data.frame(colData(DDS)[,c("condition", "sample name")])
pheatmap(assay(DDS)[rownames(DDS) %in% significant, ], cluster_rows=FALSE, show_rownames=TRUE,
         cluster_cols=TRUE, annotation_col=df)


