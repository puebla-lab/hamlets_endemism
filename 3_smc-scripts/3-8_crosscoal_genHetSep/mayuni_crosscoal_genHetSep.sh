#PBS -l elapstim_req=20:00:00   # Walltime (Verweilzeit,hier 2 Stdunden)
#PBS -l memsz_job=120gb          # Hauptspeicherbedarf
#PBS -b 1                       # Anzahl der Knoten (hier 2)
#PBS -l cpunum_job=1            # Anzahl benoetigter CPUs pro Knoten
#PBS -N ccGHSmayuni                    # Name des Batch-Jobs
#PBS -q clmedium                # [(h/GB/nodes):clexpress(2/182/2),clmedium(48/128/78),cllong(100/128/30),clbigmem(100/258/2),clfocean(100/128/4)]
#PBS -o 3.7.1.crosscoal_genHetSep_mayuni.stdout
#PBS -e 3.7.1.crosscoal_genHetSep_mayuni.stderr
module load java1.8.0
module load python3.6.2

IN1DIR=$WORK/3_output/3.5_vcfParser_out/maybel
IN2DIR=$WORK/3_output/3.5_vcfParser_out/unibel
OUTDIR=$WORK/3_output/3.8_crosscoal_multiHetSep/mayuni
COV1DIR=$WORK/3_output/3.4_bamCaller_out/maybel
COV2DIR=$WORK/3_output/3.4_bamCaller_out/unibel

for k in {01..24}; do
        L="LG"$k;
        echo $OUTDIR', '$L;
        
        generate_multihetsep.py --mask=$COV1DIR/PL17_89maybel1_${L}_coverage.mask.bed.gz \
            --mask=$COV1DIR/PL17_95maybel1_${L}_coverage.mask.bed.gz \
            --mask=$COV1DIR/PL17_101maybel1_${L}_coverage.mask.bed.gz \
            --mask=$COV1DIR/PL17_119maybel8_${L}_coverage.mask.bed.gz \
            --mask=$COV1DIR/PL17_120maybel8_${L}_coverage.mask.bed.gz \
            --mask=$COV1DIR/PL17_121maybel8_${L}_coverage.mask.bed.gz \
            --mask=$COV1DIR/PL17_122maybel8_${L}_coverage.mask.bed.gz \
            --mask=$COV1DIR/PL17_123maybel8_${L}_coverage.mask.bed.gz \
            --mask=$COV1DIR/PL17_124maybel8_${L}_coverage.mask.bed.gz \
            --mask=$COV1DIR/PL17_126maybel8_${L}_coverage.mask.bed.gz \
	    --mask=$COV2DIR/18163unibel7_${L}_coverage.mask.bed.gz \
            --mask=$COV2DIR/18261unibel7_${L}_coverage.mask.bed.gz \
	    --mask=$COV2DIR/18267unibel8_${L}_coverage.mask.bed.gz \
	    --mask=$COV2DIR/18274unibel8_${L}_coverage.mask.bed.gz \
	    --mask=$COV2DIR/18276unibel8_${L}_coverage.mask.bed.gz \
            --mask=$COV2DIR/19881unibel8_${L}_coverage.mask.bed.gz \
	    --mask=$COV2DIR/20092unibel7_${L}_coverage.mask.bed.gz \
	    --mask=$COV2DIR/20120unibel7_${L}_coverage.mask.bed.gz \
	    --mask=$COV2DIR/20126unibel7_${L}_coverage.mask.bed.gz \
            --mask=$COV2DIR/20128unibel7_${L}_coverage.mask.bed.gz \
	    --mask=$COV2DIR/20135unibel7_${L}_coverage.mask.bed.gz \
	    --mask=$COV2DIR/20149unibel7_${L}_coverage.mask.bed.gz \
	    --mask=$WORK/0_data/0_resources/mappability_masks/v2_01_$L.mapmask.bed.txt.gz \
            --negative_mask=$WORK/3_output/3.1_indel_mask/5_indel_mask_$L.bed.gz \
	    $IN1DIR/segsites_PL17_89_$L.vcf.gz $IN1DIR/segsites_PL17_95_$L.vcf.gz \
            $IN1DIR/segsites_PL17_101_$L.vcf.gz $IN1DIR/segsites_PL17_119_$L.vcf.gz \
            $IN1DIR/segsites_PL17_120_$L.vcf.gz $IN1DIR/segsites_PL17_121_$L.vcf.gz \
            $IN1DIR/segsites_PL17_122_$L.vcf.gz $IN1DIR/segsites_PL17_123_$L.vcf.gz \
            $IN1DIR/segsites_PL17_124_$L.vcf.gz $IN1DIR/segsites_PL17_126_$L.vcf.gz \
	    $IN2DIR/segsites_18163_${L}.vcf.gz $IN2DIR/segsites_18261_${L}.vcf.gz \
	    $IN2DIR/segsites_18267_${L}.vcf.gz $IN2DIR/segsites_18274_${L}.vcf.gz \
	    $IN2DIR/segsites_18276_${L}.vcf.gz $IN2DIR/segsites_19881_${L}.vcf.gz \
	    $IN2DIR/segsites_20092_${L}.vcf.gz $IN2DIR/segsites_20120_${L}.vcf.gz \
	    $IN2DIR/segsites_20126_${L}.vcf.gz $IN2DIR/segsites_20128_${L}.vcf.gz \
	    $IN2DIR/segsites_20135_${L}.vcf.gz $IN2DIR/segsites_20149_${L}.vcf.gz \
	    > $OUTDIR/$L.mayuni.multihetsep.txt
        echo done
        echo '-----------------------';

done
