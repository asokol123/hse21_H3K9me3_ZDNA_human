setwd("/home/alex/HSE/Bio/proj/hse21_H3K9me3_ZDNA_human/src")

source('lib.R')

names <-c('ENCFF283ZMN.hg19',
          'ENCFF283ZMN.hg38',
          'ENCFF836GHH.hg19',
          'ENCFF836GHH.hg38',
          'DeepZ',
          'H3K9me9.intersect_with_DeepZ'
)

for (name in names)
{
    bed_df <- read.delim(paste0(DATA_DIR, name, '.bed'), as.is = TRUE, header = FALSE)
    colnames(bed_df) <- c('chrom', 'start', 'end')
    bed_df$len <- bed_df$end - bed_df$start

    ggplot(bed_df) +
      aes(x = len) +
      geom_histogram() +
      ggtitle(name, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
      theme_bw()
    ggsave(paste0('len_hist.', name, '.png'), path = OUT_DIR)
}
