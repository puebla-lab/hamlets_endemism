#PBS -l elapstim_req=20:00:00   # Walltime (Verweilzeit,hier 2 Stdunden)
#PBS -l memsz_job=55gb          # Hauptspeicherbedarf
#PBS -b 1                       # Anzahl der Knoten (hier 2)
#PBS -l cpunum_job=1            # Anzahl benoetigter CPUs pro Knoten
#PBS -N maysmcpp                    # Name des Batch-Jobs
#PBS -q clmedium                # [(h/GB/nodes):clexpress(2/182/2),clmedium(48/128/78),cllong(100/128/30),clbigmem(100/258/2),clfocean(100/128/4)]
#PBS -o 3.11.1.smcpp_maybel.stdout
#PBS -e 3.11.1.smcpp_maybel.stderr
module load java1.8.0
module load python3.6.2

INDIR=$WORK/3_output/3.10_smcpp_input/maybel/withpeaks
OUTDIR=$WORK/3_output/3.11_smcpp_raw/maybel/

smc++ estimate --algorithm Powell -rp 5.0 --thinning 3000 --spline cubic -o $OUTDIR/allmaybel_estimate.withpeaks.out 3.7e-8 $INDIR/dist.PL17_89.LG01.txt $INDIR/dist.PL17_89.LG02.txt $INDIR/dist.PL17_89.LG03.txt $INDIR/dist.PL17_89.LG04.txt $INDIR/dist.PL17_89.LG05.txt $INDIR/dist.PL17_89.LG06.txt $INDIR/dist.PL17_89.LG07.txt $INDIR/dist.PL17_89.LG08.txt $INDIR/dist.PL17_89.LG09.txt $INDIR/dist.PL17_89.LG10.txt $INDIR/dist.PL17_89.LG11.txt $INDIR/dist.PL17_89.LG12.txt $INDIR/dist.PL17_89.LG13.txt $INDIR/dist.PL17_89.LG14.txt $INDIR/dist.PL17_89.LG15.txt $INDIR/dist.PL17_89.LG16.txt $INDIR/dist.PL17_89.LG17.txt $INDIR/dist.PL17_89.LG18.txt $INDIR/dist.PL17_89.LG19.txt $INDIR/dist.PL17_89.LG20.txt $INDIR/dist.PL17_89.LG21.txt $INDIR/dist.PL17_89.LG22.txt $INDIR/dist.PL17_89.LG23.txt $INDIR/dist.PL17_89.LG24.txt $INDIR/dist.PL17_95.LG01.txt $INDIR/dist.PL17_95.LG02.txt $INDIR/dist.PL17_95.LG03.txt $INDIR/dist.PL17_95.LG04.txt $INDIR/dist.PL17_95.LG05.txt $INDIR/dist.PL17_95.LG06.txt $INDIR/dist.PL17_95.LG07.txt $INDIR/dist.PL17_95.LG08.txt $INDIR/dist.PL17_95.LG09.txt $INDIR/dist.PL17_95.LG10.txt $INDIR/dist.PL17_95.LG11.txt $INDIR/dist.PL17_95.LG12.txt $INDIR/dist.PL17_95.LG13.txt $INDIR/dist.PL17_95.LG14.txt $INDIR/dist.PL17_95.LG15.txt $INDIR/dist.PL17_95.LG16.txt $INDIR/dist.PL17_95.LG17.txt $INDIR/dist.PL17_95.LG18.txt $INDIR/dist.PL17_95.LG19.txt $INDIR/dist.PL17_95.LG20.txt $INDIR/dist.PL17_95.LG21.txt $INDIR/dist.PL17_95.LG22.txt $INDIR/dist.PL17_95.LG23.txt $INDIR/dist.PL17_95.LG24.txt $INDIR/dist.PL17_101.LG01.txt $INDIR/dist.PL17_101.LG02.txt $INDIR/dist.PL17_101.LG03.txt $INDIR/dist.PL17_101.LG04.txt $INDIR/dist.PL17_101.LG05.txt $INDIR/dist.PL17_101.LG06.txt $INDIR/dist.PL17_101.LG07.txt $INDIR/dist.PL17_101.LG08.txt $INDIR/dist.PL17_101.LG09.txt $INDIR/dist.PL17_101.LG10.txt $INDIR/dist.PL17_101.LG11.txt $INDIR/dist.PL17_101.LG12.txt $INDIR/dist.PL17_101.LG13.txt $INDIR/dist.PL17_101.LG14.txt $INDIR/dist.PL17_101.LG15.txt $INDIR/dist.PL17_101.LG16.txt $INDIR/dist.PL17_101.LG17.txt $INDIR/dist.PL17_101.LG18.txt $INDIR/dist.PL17_101.LG19.txt $INDIR/dist.PL17_101.LG20.txt $INDIR/dist.PL17_101.LG21.txt $INDIR/dist.PL17_101.LG22.txt $INDIR/dist.PL17_101.LG23.txt $INDIR/dist.PL17_101.LG24.txt $INDIR/dist.PL17_119.LG01.txt $INDIR/dist.PL17_119.LG02.txt $INDIR/dist.PL17_119.LG03.txt $INDIR/dist.PL17_119.LG04.txt $INDIR/dist.PL17_119.LG05.txt $INDIR/dist.PL17_119.LG06.txt $INDIR/dist.PL17_119.LG07.txt $INDIR/dist.PL17_119.LG08.txt $INDIR/dist.PL17_119.LG09.txt $INDIR/dist.PL17_119.LG10.txt $INDIR/dist.PL17_119.LG11.txt $INDIR/dist.PL17_119.LG12.txt $INDIR/dist.PL17_119.LG13.txt $INDIR/dist.PL17_119.LG14.txt $INDIR/dist.PL17_119.LG15.txt $INDIR/dist.PL17_119.LG16.txt $INDIR/dist.PL17_119.LG17.txt $INDIR/dist.PL17_119.LG18.txt $INDIR/dist.PL17_119.LG19.txt $INDIR/dist.PL17_119.LG20.txt $INDIR/dist.PL17_119.LG21.txt $INDIR/dist.PL17_119.LG22.txt $INDIR/dist.PL17_119.LG23.txt $INDIR/dist.PL17_119.LG24.txt $INDIR/dist.PL17_120.LG01.txt $INDIR/dist.PL17_120.LG02.txt $INDIR/dist.PL17_120.LG03.txt $INDIR/dist.PL17_120.LG04.txt $INDIR/dist.PL17_120.LG05.txt $INDIR/dist.PL17_120.LG06.txt $INDIR/dist.PL17_120.LG07.txt $INDIR/dist.PL17_120.LG08.txt $INDIR/dist.PL17_120.LG09.txt $INDIR/dist.PL17_120.LG10.txt $INDIR/dist.PL17_120.LG11.txt $INDIR/dist.PL17_120.LG12.txt $INDIR/dist.PL17_120.LG13.txt $INDIR/dist.PL17_120.LG14.txt $INDIR/dist.PL17_120.LG15.txt $INDIR/dist.PL17_120.LG16.txt $INDIR/dist.PL17_120.LG17.txt $INDIR/dist.PL17_120.LG18.txt $INDIR/dist.PL17_120.LG19.txt $INDIR/dist.PL17_120.LG20.txt $INDIR/dist.PL17_120.LG21.txt $INDIR/dist.PL17_120.LG22.txt $INDIR/dist.PL17_120.LG23.txt $INDIR/dist.PL17_120.LG24.txt $INDIR/dist.PL17_121.LG01.txt $INDIR/dist.PL17_121.LG02.txt $INDIR/dist.PL17_121.LG03.txt $INDIR/dist.PL17_121.LG04.txt $INDIR/dist.PL17_121.LG05.txt $INDIR/dist.PL17_121.LG06.txt $INDIR/dist.PL17_121.LG07.txt $INDIR/dist.PL17_121.LG08.txt $INDIR/dist.PL17_121.LG09.txt $INDIR/dist.PL17_121.LG10.txt $INDIR/dist.PL17_121.LG11.txt $INDIR/dist.PL17_121.LG12.txt $INDIR/dist.PL17_121.LG13.txt $INDIR/dist.PL17_121.LG14.txt $INDIR/dist.PL17_121.LG15.txt $INDIR/dist.PL17_121.LG16.txt $INDIR/dist.PL17_121.LG17.txt $INDIR/dist.PL17_121.LG18.txt $INDIR/dist.PL17_121.LG19.txt $INDIR/dist.PL17_121.LG20.txt $INDIR/dist.PL17_121.LG21.txt $INDIR/dist.PL17_121.LG22.txt $INDIR/dist.PL17_121.LG23.txt $INDIR/dist.PL17_121.LG24.txt $INDIR/dist.PL17_122.LG01.txt $INDIR/dist.PL17_122.LG02.txt $INDIR/dist.PL17_122.LG03.txt $INDIR/dist.PL17_122.LG04.txt $INDIR/dist.PL17_122.LG05.txt $INDIR/dist.PL17_122.LG06.txt $INDIR/dist.PL17_122.LG07.txt $INDIR/dist.PL17_122.LG08.txt $INDIR/dist.PL17_122.LG09.txt $INDIR/dist.PL17_122.LG10.txt $INDIR/dist.PL17_122.LG11.txt $INDIR/dist.PL17_122.LG12.txt $INDIR/dist.PL17_122.LG13.txt $INDIR/dist.PL17_122.LG14.txt $INDIR/dist.PL17_122.LG15.txt $INDIR/dist.PL17_122.LG16.txt $INDIR/dist.PL17_122.LG17.txt $INDIR/dist.PL17_122.LG18.txt $INDIR/dist.PL17_122.LG19.txt $INDIR/dist.PL17_122.LG20.txt $INDIR/dist.PL17_122.LG21.txt $INDIR/dist.PL17_122.LG22.txt $INDIR/dist.PL17_122.LG23.txt $INDIR/dist.PL17_122.LG24.txt $INDIR/dist.PL17_123.LG01.txt $INDIR/dist.PL17_123.LG02.txt $INDIR/dist.PL17_123.LG03.txt $INDIR/dist.PL17_123.LG04.txt $INDIR/dist.PL17_123.LG05.txt $INDIR/dist.PL17_123.LG06.txt $INDIR/dist.PL17_123.LG07.txt $INDIR/dist.PL17_123.LG08.txt $INDIR/dist.PL17_123.LG09.txt $INDIR/dist.PL17_123.LG10.txt $INDIR/dist.PL17_123.LG11.txt $INDIR/dist.PL17_123.LG12.txt $INDIR/dist.PL17_123.LG13.txt $INDIR/dist.PL17_123.LG14.txt $INDIR/dist.PL17_123.LG15.txt $INDIR/dist.PL17_123.LG16.txt $INDIR/dist.PL17_123.LG17.txt $INDIR/dist.PL17_123.LG18.txt $INDIR/dist.PL17_123.LG19.txt $INDIR/dist.PL17_123.LG20.txt $INDIR/dist.PL17_123.LG21.txt $INDIR/dist.PL17_123.LG22.txt $INDIR/dist.PL17_123.LG23.txt $INDIR/dist.PL17_123.LG24.txt $INDIR/dist.PL17_124.LG01.txt $INDIR/dist.PL17_124.LG02.txt $INDIR/dist.PL17_124.LG03.txt $INDIR/dist.PL17_124.LG04.txt $INDIR/dist.PL17_124.LG05.txt $INDIR/dist.PL17_124.LG06.txt $INDIR/dist.PL17_124.LG07.txt $INDIR/dist.PL17_124.LG08.txt $INDIR/dist.PL17_124.LG09.txt $INDIR/dist.PL17_124.LG10.txt $INDIR/dist.PL17_124.LG11.txt $INDIR/dist.PL17_124.LG12.txt $INDIR/dist.PL17_124.LG13.txt $INDIR/dist.PL17_124.LG14.txt $INDIR/dist.PL17_124.LG15.txt $INDIR/dist.PL17_124.LG16.txt $INDIR/dist.PL17_124.LG17.txt $INDIR/dist.PL17_124.LG18.txt $INDIR/dist.PL17_124.LG19.txt $INDIR/dist.PL17_124.LG20.txt $INDIR/dist.PL17_124.LG21.txt $INDIR/dist.PL17_124.LG22.txt $INDIR/dist.PL17_124.LG23.txt $INDIR/dist.PL17_124.LG24.txt $INDIR/dist.PL17_126.LG01.txt $INDIR/dist.PL17_126.LG02.txt $INDIR/dist.PL17_126.LG03.txt $INDIR/dist.PL17_126.LG04.txt $INDIR/dist.PL17_126.LG05.txt $INDIR/dist.PL17_126.LG06.txt $INDIR/dist.PL17_126.LG07.txt $INDIR/dist.PL17_126.LG08.txt $INDIR/dist.PL17_126.LG09.txt $INDIR/dist.PL17_126.LG10.txt $INDIR/dist.PL17_126.LG11.txt $INDIR/dist.PL17_126.LG12.txt $INDIR/dist.PL17_126.LG13.txt $INDIR/dist.PL17_126.LG14.txt $INDIR/dist.PL17_126.LG15.txt $INDIR/dist.PL17_126.LG16.txt $INDIR/dist.PL17_126.LG17.txt $INDIR/dist.PL17_126.LG18.txt $INDIR/dist.PL17_126.LG19.txt $INDIR/dist.PL17_126.LG20.txt $INDIR/dist.PL17_126.LG21.txt $INDIR/dist.PL17_126.LG22.txt $INDIR/dist.PL17_126.LG23.txt $INDIR/dist.PL17_126.LG24.txt

INDIR=$WORK/3_output/3.10_smcpp_input/maybel/nopeaks

smc++ estimate --algorithm Powell -rp 5.0 --thinning 3000 --spline cubic -o $OUTDIR/allmaybel_estimate.nopeaks.out 3.7e-8 $INDIR/dist.PL17_89.LG01.txt $INDIR/dist.PL17_89.LG02.txt $INDIR/dist.PL17_89.LG03.txt $INDIR/dist.PL17_89.LG04.txt $INDIR/dist.PL17_89.LG05.txt $INDIR/dist.PL17_89.LG06.txt $INDIR/dist.PL17_89.LG07.txt $INDIR/dist.PL17_89.LG08.txt $INDIR/dist.PL17_89.LG09.txt $INDIR/dist.PL17_89.LG10.txt $INDIR/dist.PL17_89.LG11.txt $INDIR/dist.PL17_89.LG12.txt $INDIR/dist.PL17_89.LG13.txt $INDIR/dist.PL17_89.LG14.txt $INDIR/dist.PL17_89.LG15.txt $INDIR/dist.PL17_89.LG16.txt $INDIR/dist.PL17_89.LG17.txt $INDIR/dist.PL17_89.LG18.txt $INDIR/dist.PL17_89.LG19.txt $INDIR/dist.PL17_89.LG20.txt $INDIR/dist.PL17_89.LG21.txt $INDIR/dist.PL17_89.LG22.txt $INDIR/dist.PL17_89.LG23.txt $INDIR/dist.PL17_89.LG24.txt $INDIR/dist.PL17_95.LG01.txt $INDIR/dist.PL17_95.LG02.txt $INDIR/dist.PL17_95.LG03.txt $INDIR/dist.PL17_95.LG04.txt $INDIR/dist.PL17_95.LG05.txt $INDIR/dist.PL17_95.LG06.txt $INDIR/dist.PL17_95.LG07.txt $INDIR/dist.PL17_95.LG08.txt $INDIR/dist.PL17_95.LG09.txt $INDIR/dist.PL17_95.LG10.txt $INDIR/dist.PL17_95.LG11.txt $INDIR/dist.PL17_95.LG12.txt $INDIR/dist.PL17_95.LG13.txt $INDIR/dist.PL17_95.LG14.txt $INDIR/dist.PL17_95.LG15.txt $INDIR/dist.PL17_95.LG16.txt $INDIR/dist.PL17_95.LG17.txt $INDIR/dist.PL17_95.LG18.txt $INDIR/dist.PL17_95.LG19.txt $INDIR/dist.PL17_95.LG20.txt $INDIR/dist.PL17_95.LG21.txt $INDIR/dist.PL17_95.LG22.txt $INDIR/dist.PL17_95.LG23.txt $INDIR/dist.PL17_95.LG24.txt $INDIR/dist.PL17_101.LG01.txt $INDIR/dist.PL17_101.LG02.txt $INDIR/dist.PL17_101.LG03.txt $INDIR/dist.PL17_101.LG04.txt $INDIR/dist.PL17_101.LG05.txt $INDIR/dist.PL17_101.LG06.txt $INDIR/dist.PL17_101.LG07.txt $INDIR/dist.PL17_101.LG08.txt $INDIR/dist.PL17_101.LG09.txt $INDIR/dist.PL17_101.LG10.txt $INDIR/dist.PL17_101.LG11.txt $INDIR/dist.PL17_101.LG12.txt $INDIR/dist.PL17_101.LG13.txt $INDIR/dist.PL17_101.LG14.txt $INDIR/dist.PL17_101.LG15.txt $INDIR/dist.PL17_101.LG16.txt $INDIR/dist.PL17_101.LG17.txt $INDIR/dist.PL17_101.LG18.txt $INDIR/dist.PL17_101.LG19.txt $INDIR/dist.PL17_101.LG20.txt $INDIR/dist.PL17_101.LG21.txt $INDIR/dist.PL17_101.LG22.txt $INDIR/dist.PL17_101.LG23.txt $INDIR/dist.PL17_101.LG24.txt $INDIR/dist.PL17_119.LG01.txt $INDIR/dist.PL17_119.LG02.txt $INDIR/dist.PL17_119.LG03.txt $INDIR/dist.PL17_119.LG04.txt $INDIR/dist.PL17_119.LG05.txt $INDIR/dist.PL17_119.LG06.txt $INDIR/dist.PL17_119.LG07.txt $INDIR/dist.PL17_119.LG08.txt $INDIR/dist.PL17_119.LG09.txt $INDIR/dist.PL17_119.LG10.txt $INDIR/dist.PL17_119.LG11.txt $INDIR/dist.PL17_119.LG12.txt $INDIR/dist.PL17_119.LG13.txt $INDIR/dist.PL17_119.LG14.txt $INDIR/dist.PL17_119.LG15.txt $INDIR/dist.PL17_119.LG16.txt $INDIR/dist.PL17_119.LG17.txt $INDIR/dist.PL17_119.LG18.txt $INDIR/dist.PL17_119.LG19.txt $INDIR/dist.PL17_119.LG20.txt $INDIR/dist.PL17_119.LG21.txt $INDIR/dist.PL17_119.LG22.txt $INDIR/dist.PL17_119.LG23.txt $INDIR/dist.PL17_119.LG24.txt $INDIR/dist.PL17_120.LG01.txt $INDIR/dist.PL17_120.LG02.txt $INDIR/dist.PL17_120.LG03.txt $INDIR/dist.PL17_120.LG04.txt $INDIR/dist.PL17_120.LG05.txt $INDIR/dist.PL17_120.LG06.txt $INDIR/dist.PL17_120.LG07.txt $INDIR/dist.PL17_120.LG08.txt $INDIR/dist.PL17_120.LG09.txt $INDIR/dist.PL17_120.LG10.txt $INDIR/dist.PL17_120.LG11.txt $INDIR/dist.PL17_120.LG12.txt $INDIR/dist.PL17_120.LG13.txt $INDIR/dist.PL17_120.LG14.txt $INDIR/dist.PL17_120.LG15.txt $INDIR/dist.PL17_120.LG16.txt $INDIR/dist.PL17_120.LG17.txt $INDIR/dist.PL17_120.LG18.txt $INDIR/dist.PL17_120.LG19.txt $INDIR/dist.PL17_120.LG20.txt $INDIR/dist.PL17_120.LG21.txt $INDIR/dist.PL17_120.LG22.txt $INDIR/dist.PL17_120.LG23.txt $INDIR/dist.PL17_120.LG24.txt $INDIR/dist.PL17_121.LG01.txt $INDIR/dist.PL17_121.LG02.txt $INDIR/dist.PL17_121.LG03.txt $INDIR/dist.PL17_121.LG04.txt $INDIR/dist.PL17_121.LG05.txt $INDIR/dist.PL17_121.LG06.txt $INDIR/dist.PL17_121.LG07.txt $INDIR/dist.PL17_121.LG08.txt $INDIR/dist.PL17_121.LG09.txt $INDIR/dist.PL17_121.LG10.txt $INDIR/dist.PL17_121.LG11.txt $INDIR/dist.PL17_121.LG12.txt $INDIR/dist.PL17_121.LG13.txt $INDIR/dist.PL17_121.LG14.txt $INDIR/dist.PL17_121.LG15.txt $INDIR/dist.PL17_121.LG16.txt $INDIR/dist.PL17_121.LG17.txt $INDIR/dist.PL17_121.LG18.txt $INDIR/dist.PL17_121.LG19.txt $INDIR/dist.PL17_121.LG20.txt $INDIR/dist.PL17_121.LG21.txt $INDIR/dist.PL17_121.LG22.txt $INDIR/dist.PL17_121.LG23.txt $INDIR/dist.PL17_121.LG24.txt $INDIR/dist.PL17_122.LG01.txt $INDIR/dist.PL17_122.LG02.txt $INDIR/dist.PL17_122.LG03.txt $INDIR/dist.PL17_122.LG04.txt $INDIR/dist.PL17_122.LG05.txt $INDIR/dist.PL17_122.LG06.txt $INDIR/dist.PL17_122.LG07.txt $INDIR/dist.PL17_122.LG08.txt $INDIR/dist.PL17_122.LG09.txt $INDIR/dist.PL17_122.LG10.txt $INDIR/dist.PL17_122.LG11.txt $INDIR/dist.PL17_122.LG12.txt $INDIR/dist.PL17_122.LG13.txt $INDIR/dist.PL17_122.LG14.txt $INDIR/dist.PL17_122.LG15.txt $INDIR/dist.PL17_122.LG16.txt $INDIR/dist.PL17_122.LG17.txt $INDIR/dist.PL17_122.LG18.txt $INDIR/dist.PL17_122.LG19.txt $INDIR/dist.PL17_122.LG20.txt $INDIR/dist.PL17_122.LG21.txt $INDIR/dist.PL17_122.LG22.txt $INDIR/dist.PL17_122.LG23.txt $INDIR/dist.PL17_122.LG24.txt $INDIR/dist.PL17_123.LG01.txt $INDIR/dist.PL17_123.LG02.txt $INDIR/dist.PL17_123.LG03.txt $INDIR/dist.PL17_123.LG04.txt $INDIR/dist.PL17_123.LG05.txt $INDIR/dist.PL17_123.LG06.txt $INDIR/dist.PL17_123.LG07.txt $INDIR/dist.PL17_123.LG08.txt $INDIR/dist.PL17_123.LG09.txt $INDIR/dist.PL17_123.LG10.txt $INDIR/dist.PL17_123.LG11.txt $INDIR/dist.PL17_123.LG12.txt $INDIR/dist.PL17_123.LG13.txt $INDIR/dist.PL17_123.LG14.txt $INDIR/dist.PL17_123.LG15.txt $INDIR/dist.PL17_123.LG16.txt $INDIR/dist.PL17_123.LG17.txt $INDIR/dist.PL17_123.LG18.txt $INDIR/dist.PL17_123.LG19.txt $INDIR/dist.PL17_123.LG20.txt $INDIR/dist.PL17_123.LG21.txt $INDIR/dist.PL17_123.LG22.txt $INDIR/dist.PL17_123.LG23.txt $INDIR/dist.PL17_123.LG24.txt $INDIR/dist.PL17_124.LG01.txt $INDIR/dist.PL17_124.LG02.txt $INDIR/dist.PL17_124.LG03.txt $INDIR/dist.PL17_124.LG04.txt $INDIR/dist.PL17_124.LG05.txt $INDIR/dist.PL17_124.LG06.txt $INDIR/dist.PL17_124.LG07.txt $INDIR/dist.PL17_124.LG08.txt $INDIR/dist.PL17_124.LG09.txt $INDIR/dist.PL17_124.LG10.txt $INDIR/dist.PL17_124.LG11.txt $INDIR/dist.PL17_124.LG12.txt $INDIR/dist.PL17_124.LG13.txt $INDIR/dist.PL17_124.LG14.txt $INDIR/dist.PL17_124.LG15.txt $INDIR/dist.PL17_124.LG16.txt $INDIR/dist.PL17_124.LG17.txt $INDIR/dist.PL17_124.LG18.txt $INDIR/dist.PL17_124.LG19.txt $INDIR/dist.PL17_124.LG20.txt $INDIR/dist.PL17_124.LG21.txt $INDIR/dist.PL17_124.LG22.txt $INDIR/dist.PL17_124.LG23.txt $INDIR/dist.PL17_124.LG24.txt $INDIR/dist.PL17_126.LG01.txt $INDIR/dist.PL17_126.LG02.txt $INDIR/dist.PL17_126.LG03.txt $INDIR/dist.PL17_126.LG04.txt $INDIR/dist.PL17_126.LG05.txt $INDIR/dist.PL17_126.LG06.txt $INDIR/dist.PL17_126.LG07.txt $INDIR/dist.PL17_126.LG08.txt $INDIR/dist.PL17_126.LG09.txt $INDIR/dist.PL17_126.LG10.txt $INDIR/dist.PL17_126.LG11.txt $INDIR/dist.PL17_126.LG12.txt $INDIR/dist.PL17_126.LG13.txt $INDIR/dist.PL17_126.LG14.txt $INDIR/dist.PL17_126.LG15.txt $INDIR/dist.PL17_126.LG16.txt $INDIR/dist.PL17_126.LG17.txt $INDIR/dist.PL17_126.LG18.txt $INDIR/dist.PL17_126.LG19.txt $INDIR/dist.PL17_126.LG20.txt $INDIR/dist.PL17_126.LG21.txt $INDIR/dist.PL17_126.LG22.txt $INDIR/dist.PL17_126.LG23.txt $INDIR/dist.PL17_126.LG24.txt

echo done
