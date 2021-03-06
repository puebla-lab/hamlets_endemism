#!/usr/bin/env Rscript
# ===============================================================
# This script used the package SNPrelate to produce a PCA on a given VCF file.
# The number of PCs considdered can be varied.
# ---------------------------------------------------------------
# The produced output contains:
#  - 2 plots 
#     - 1 combination of "%exp var" ~ "PC" and a grid of all possible "PCy" ~ "PCx"
#     - 1 "PC2" ~ "PC1" with the repective 9 SNPs with top loadings for PC1 & PC2 indicated
# - 3 tables
#     - % exp var per PC
#     - individual scores on PCx - PCz
#     - SNPs with top loadings
# ===============================================================
args = commandArgs(trailingOnly=FALSE)
args = args[7:9]
print(args)

library(SNPRelate)
library(stringr)
library(tidyverse)
# custom functions -------------------
get_pca_scores <- function(mat,n_ev){mat[,1:n_ev] %>%
    as.tibble() %>%
    set_names(.,nm=str_c("EV",str_pad(width = 2,pad = '0',1:n_ev)))}

filter_fun <- function(x, y) x >= y

ct_subset <- function(p,q,df,exp_var){
  id <- names(df)[1]
  P <- names(df)[p+1]
  Q <- names(df)[q+1]
  P_lab <- str_c(pc_percent[p,2],' (',round(pc_percent[p,3],2),'%)')
  Q_lab <- str_c(pc_percent[q,2],' (',round(pc_percent[q,3],2),'%)')
  df %>%
    select(id,P,Q) %>%
    set_names(.,nm = c('id','x','y')) %>%
    mutate(run_x = P_lab,
           run_y = Q_lab)
}

# loadings related
scale_var <- function(x,exp_var){x * exp_var}

loading_set <- function(df,snpid,EV,n_snps,clr_scheme,...){
  clr <- do.call(clr_scheme,list(n = n_snps,...))

  snp_load <- df %>%
    t() %>%
    as.tibble() %>%
    set_names(.,nm=str_c("EV",str_pad(width = 2,pad = '0',1:n_ev))) %>%
    bind_cols(tibble(snp = str_c('snp',nm=snpid),
                     snpnr = snpid),.)%>%
    mutate(total = rowSums(abs(scale_var(x = df,exp_var = pc_percent$exp_var)) %>%
                             t())) %>%
    arrange_(EV) %>%
    mutate(idx = row_number()) %>% ungroup() %>%
    filter(idx <= n_snps) %>%
    mutate(clr = clr)
}

prep_laoding_ev <- function(df,EV){df %>% mutate(ev = EV) %>% select(snpnr,ev,idx) }
# ------------------------------------
# config:
set.seed(1000)
vcf.fn <- as.character(args[1])
vcf_samples <- as.character(args[2])
n_ev = as.numeric(args[3])
# ------------------------------------
base_name <- str_remove(vcf.fn,'.vcf.gz')

# reformating genotypes
snpgdsVCF2GDS(vcf.fn = vcf.fn, out.fn = str_c(base_name,'.gds'), method = "biallelic.only")
snpgdsSummary(str_c(base_name,'.gds'))
genofile <- snpgdsOpen(str_c(base_name,'.gds'))

# filter genotypes by LD
snpset <- snpgdsLDpruning(genofile, ld.threshold = 0.2, autosome.only = FALSE)
snpset.id <- unlist(snpset)

snpset.tbl <- tibble(CHROM = names(snpset.id) %>% 
                       str_extract(.,'(LG|Contig)[0-9]{2}'),
                     POS = snpset.id) %>%
  mutate(snpid = str_c(CHROM,":",POS))

id_labs <- read_delim(vcf_samples, delim = '\t',col_names = c('id','spec'))
# run pca ------------------------------------------------
pca <- snpgdsPCA(genofile, snp.id = snpset.id, num.thread = 2,
                 autosome.only = FALSE,eigen.cnt = n_ev)
# extract results ---------------------------------------
pc_percent <- tibble(EV_nr = 1:n_ev,
                     EV = str_c("EV",str_pad(width = 2,pad = '0',EV_nr)),
                     exp_var = (pca$varprop*100)[EV_nr])

tab <-bind_cols(id = pca$sample.id, get_pca_scores(pca$eigenvect,n_ev))

ct <- cross_df(tibble(p=1:n_ev, q=1:n_ev),.filter = filter_fun) %>% arrange(p,q)

df_result <- pmap(ct,ct_subset,df = tab, exp_var = pc_percent) %>%
  bind_rows() %>%
  left_join(.,id_labs)

# explained variation per PC
p1 <- ggplot(pc_percent,aes(x=EV_nr,y=exp_var))+
  geom_area(fill='darkgray',alpha =.2)+
  geom_point(shape=21,fill = 'red')+
  scale_x_continuous(name =NULL,breaks = pc_percent$EV_nr,labels = pc_percent$EV)+
  scale_y_continuous(name = 'explained variation',
                     limits = c(0,max(pc_percent$exp_var)))

# plot all combinations of PCs
(p2 <- ggplot(df_result,aes(x,y,col=spec))+
  geom_point()+
  facet_grid(run_y~run_x)+
  theme(axis.title = element_blank(),legend.position = c(.9,.85)))

out_plot <- cowplot::plot_grid(p1,p2,ncol = 1,rel_heights = c(.3,1))
# export results ---------------------------------------
ggsave(filename =  str_c(base_name,'.pca.pdf'),out_plot,width = 8,height = 9.5)
write_delim(pc_percent,path = str_c(base_name,'.exp_var.txt'),delim = '\t')
system(str_c("gzip ",str_c(base_name,'.exp_var.txt')))
write_delim(tab,path = str_c(base_name,'.scores.txt'),delim = '\t')
system(str_c("gzip ",str_c(base_name,'.scores.txt')))
# -------------------------------------------------------
# Investigate loadings
SnpLoad <- snpgdsPCASNPLoading(pca, genofile)
snpl <- SnpLoad$snp.id

snpl_table <- tibble(snpl = SnpLoad$snp.id) %>% bind_cols(.,snpset.tbl)
snp_load_ev1 <- loading_set(df = SnpLoad$snploading,snpid = snpl_table$snpid, EV = '-abs(EV01)',
                            n = 9,clr_scheme = RColorBrewer::brewer.pal,name='Oranges')
snp_load_ev2 <- loading_set(df = SnpLoad$snploading,snpid = snpl_table$snpid,EV = '-abs(EV02)',
                            n = 9,clr_scheme = RColorBrewer::brewer.pal,name='Blues')

cc <- c(RColorBrewer::brewer.pal(5,'Oranges')[5],RColorBrewer::brewer.pal(5,'Blues')[5])
dist <- 1.1

(p_loadings <- ggplot()+
  geom_segment(data = snp_load_ev1,aes(x=0,xend=EV01,y=0,yend=EV02,alpha=-idx),col=cc[1],#snp_load_ev1$clr,
               arrow = arrow(length = unit(3,'pt'),type = 'closed'))+
  geom_text(data = snp_load_ev1,aes(x=EV01*dist,y=EV02*dist,label=snpnr),col=cc[1])+
  geom_segment(data = snp_load_ev2,aes(x=0,xend=EV01,y=0,yend=EV02,alpha=-idx),col=cc[2],#snp_load_ev2$clr,
               arrow = arrow(length = unit(3,'pt'),type = 'closed'))+
  geom_text(data = snp_load_ev2,aes(x=EV01*dist,y=EV02*dist,label=snpnr),col=cc[2])+
  geom_point(data = tab %>% left_join(.,id_labs),aes(EV01,EV02,fill=spec),shape=21)+
  scico::scale_color_scico(direction = -1)+
  labs(x='PC01',y='PC02')+
  theme(axis.title.x = element_text(color=cc[1]),
        axis.title.y = element_text(color=cc[2])))


top_snps <- purrr::map2(list(snp_load_ev1 ,snp_load_ev2),list('EV01','EV02'),prep_laoding_ev) %>% bind_rows()
# export results ---------------------------------------
ggsave(p_loadings,filename =  str_c(base_name,'.snp_loadings.pdf'), width = 8,height = 8)
write_delim(top_snps,path = str_c(base_name,'.top_snps.txt'),delim = '\t')
system(str_c("gzip ",str_c(base_name,'.top_snps.txt')))

# close the door ---------------------------------------
closefn.gds(genofile)