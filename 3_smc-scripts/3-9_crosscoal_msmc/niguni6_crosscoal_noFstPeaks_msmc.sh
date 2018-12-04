#PBS -l elapstim_req=24:00:00   # Walltime (Verweilzeit,hier 2 Stdunden)
#PBS -l memsz_job=192gb          # Hauptspeicherbedarf
#PBS -b 1                       # Anzahl der Knoten (hier 2)
#PBS -l cpunum_job=24           # Anzahl benoetigter CPUs pro Knoten
#PBS -N nFniguni6                    # Name des Batch-Jobs
#PBS -q clmedium                # [(h/GB/nodes):clexpress(2/192/2),clmedium(48/192/120),cllong(100/192/50),clbigmem(200/384/8),clfo2(200/128/18),feque(1/750/1)]
#PBS -o 3.9.2.crosscoal_msmc_noFstPeaks_niguni6.stdout
#PBS -e 3.9.2.crosscoal_msmc_noFstPeaks_niguni6.stderr
module load java1.8.0
module load python3.6.2

OUTDIR=$WORK/3_output/3.9_crosscoal_msmc/
INDIR=$WORK/3_output/3.8_crosscoal_multiHetSep/niguni

msmc_2.0.0_linux64bit -m 0.00255863 -t 24 -p 1*2+25*1+1*2+1*3 -o $OUTDIR/niguni6_nig_noFstPeaks.msmc -I 2,3,16,17 \
    $INDIR/LG01.niguni.multihetsep.txt \
    $INDIR/LG02.niguni.multihetsep.txt \
    $INDIR/LG03.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG04.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG05.niguni.multihetsep.txt \
    $INDIR/LG06.niguni.multihetsep.txt \
    $INDIR/LG07.niguni.multihetsep.txt \
    $INDIR/LG08.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG09.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG10.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG11.niguni.multihetsep.txt \
    $INDIR/LG12.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG13.niguni.multihetsep.txt \
    $INDIR/LG14.niguni.multihetsep.txt \
    $INDIR/LG15.niguni.multihetsep.txt \
    $INDIR/LG16.niguni.multihetsep.txt \
    $INDIR/LG17.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG18.niguni.multihetsep.txt \
    $INDIR/LG19.niguni.multihetsep.txt \
    $INDIR/LG20.niguni.multihetsep.txt \
    $INDIR/LG21.niguni.multihetsep.txt \
    $INDIR/LG22.niguni.multihetsep.txt \
    $INDIR/LG23.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG24.niguni.multihetsep.txt
echo done

msmc_2.0.0_linux64bit -m 0.00255863 -t 24 -p 1*2+25*1+1*2+1*3 -o $OUTDIR/niguni6_uni_noFstPeaks.msmc -I 32,33,34,35 \
    $INDIR/LG01.niguni.multihetsep.txt \
    $INDIR/LG02.niguni.multihetsep.txt \
    $INDIR/LG03.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG04.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG05.niguni.multihetsep.txt \
    $INDIR/LG06.niguni.multihetsep.txt \
    $INDIR/LG07.niguni.multihetsep.txt \
    $INDIR/LG08.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG09.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG10.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG11.niguni.multihetsep.txt \
    $INDIR/LG12.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG13.niguni.multihetsep.txt \
    $INDIR/LG14.niguni.multihetsep.txt \
    $INDIR/LG15.niguni.multihetsep.txt \
    $INDIR/LG16.niguni.multihetsep.txt \
    $INDIR/LG17.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG18.niguni.multihetsep.txt \
    $INDIR/LG19.niguni.multihetsep.txt \
    $INDIR/LG20.niguni.multihetsep.txt \
    $INDIR/LG21.niguni.multihetsep.txt \
    $INDIR/LG22.niguni.multihetsep.txt \
    $INDIR/LG23.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG24.niguni.multihetsep.txt
echo done

msmc_2.0.0_linux64bit -m 0.00255863 -t 24 -p 1*2+25*1+1*2+1*3 -o $OUTDIR/niguni6_cross_noFstPeaks.msmc -I 2,3,16,17,32,33,34,35 -P 0,0,0,0,1,1,1,1 \
    $INDIR/LG01.niguni.multihetsep.txt \
    $INDIR/LG02.niguni.multihetsep.txt \
    $INDIR/LG03.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG04.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG05.niguni.multihetsep.txt \
    $INDIR/LG06.niguni.multihetsep.txt \
    $INDIR/LG07.niguni.multihetsep.txt \
    $INDIR/LG08.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG09.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG10.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG11.niguni.multihetsep.txt \
    $INDIR/LG12.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG13.niguni.multihetsep.txt \
    $INDIR/LG14.niguni.multihetsep.txt \
    $INDIR/LG15.niguni.multihetsep.txt \
    $INDIR/LG16.niguni.multihetsep.txt \
    $INDIR/LG17.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG18.niguni.multihetsep.txt \
    $INDIR/LG19.niguni.multihetsep.txt \
    $INDIR/LG20.niguni.multihetsep.txt \
    $INDIR/LG21.niguni.multihetsep.txt \
    $INDIR/LG22.niguni.multihetsep.txt \
    $INDIR/LG23.niguni.noFstPeaks.multihetsep.txt \
    $INDIR/LG24.niguni.multihetsep.txt
echo done

combineCrossCoal.py niguni6_cross_noFstPeaks.msmc.final.txt niguni6_nig_noFstPeaks.msmc.final.txt niguni6_uni_noFstPeaks.msmc.final.txt > combined_niguni6_noFstPeaks_msmc.final.txt
