#!/bin/sh

file0="../../models/SCRIPTS/table2.dat"
awk '$1!="#" {print $1,$1*$6,$1*$7}' $file0 > xb1_stat
awk '$1!="#" {print $1,$1*$6,$1*sqrt($7*$7+$8*$8)}' $file0 > xb1_tot

file1="../../models/output/b1model_kumano.dat"
awk '$1==1 {print $2,$6}' $file1 > model_nosea_cteq
awk '$1==1 {print $2,$10}' $file1 > model_sea_cteq
awk '$1==2 {print $2,$6}' $file1 > model_nosea_mrst
awk '$1==2 {print $2,$10}' $file1 > model_sea_mrst
awk '$1==3 {print $2,$6}' $file1 > model_nosea_mstw
awk '$1==3 {print $2,$10}' $file1 > model_sea_mstw

file2="../../models/Miller_newtable/miller_nov11_2010.dat"
awk '$1!=0.9 {print $2,$2*$3}' $file2 > model_miller

file3="../output/rates.out"
awk '$1==1 {print $3,0.0,$3*$10}' $file3 > hms_stat
awk '$1==2 {print $3,0.0,$3*$10}' $file3 > shms_stat
#awk '$8!=0.0 {print $3,0.0,$3*$10}' $file3 > shms_stat
awk '$1==2 {print $3,$3*$16}' $file3 > syst

xmgrace -free -settype xydy -block xb1_stat         -graph 0 -bxy 1:2:3 \
              -settype xydy -block xb1_tot          -graph 0 -bxy 1:2:3 \
              -settype xy   -block model_miller     -graph 0 -bxy 1:2 \
              -settype xy   -block model_nosea_mstw -graph 0 -bxy 1:2 \
              -settype xy   -block model_sea_mstw   -graph 0 -bxy 1:2 \
              -settype xydy -block xb1_stat         -graph 0 -bxy 1:2:3 \
              -settype xydy -block xb1_tot          -graph 0 -bxy 1:2:3 \
              -settype xy   -block syst             -graph 0 -bxy 1:2 \
              -settype xydy -block hms_stat        -graph 0 -bxy 1:2:3 \
              -settype xydy -block shms_stat        -graph 0 -bxy 1:2:3 \
              -p xb1_proj.par -noask
gracebat -hdevice EPS -printfile xb1_proj_newmiller.eps \
              -settype xydy -block xb1_stat         -graph 0 -bxy 1:2:3 \
              -settype xydy -block xb1_tot          -graph 0 -bxy 1:2:3 \
              -settype xy   -block model_miller     -graph 0 -bxy 1:2 \
              -settype xy   -block model_nosea_mstw -graph 0 -bxy 1:2 \
              -settype xy   -block model_sea_mstw   -graph 0 -bxy 1:2 \
              -settype xydy -block xb1_stat         -graph 0 -bxy 1:2:3 \
              -settype xydy -block xb1_tot          -graph 0 -bxy 1:2:3 \
              -settype xy   -block syst             -graph 0 -bxy 1:2 \
              -settype xydy -block hms_stat        -graph 0 -bxy 1:2:3 \
              -settype xydy -block shms_stat        -graph 0 -bxy 1:2:3 \
              -p xb1_proj.par -noask

xmgrace -free -settype xydy -block xb1_stat         -graph 0 -bxy 1:2:3 \
              -settype xydy -block xb1_tot          -graph 0 -bxy 1:2:3 \
              -settype xy   -block model_miller     -graph 0 -bxy 1:2 \
              -settype xy   -block model_nosea_mstw -graph 0 -bxy 1:2 \
              -settype xy   -block model_sea_mstw   -graph 0 -bxy 1:2 \
              -settype xydy -block xb1_stat         -graph 0 -bxy 1:2:3 \
              -settype xydy -block xb1_tot          -graph 0 -bxy 1:2:3 \
              -settype xy   -block syst             -graph 0 -bxy 1:2 \
              -settype xydy -block hms_stat        -graph 0 -bxy 1:2:3 \
              -settype xydy -block shms_stat        -graph 0 -bxy 1:2:3 \
              -p xb1_proj_lin.par -noask
gracebat -hdevice EPS -printfile xb1_proj_newmiller_lin.eps \
              -settype xydy -block xb1_stat         -graph 0 -bxy 1:2:3 \
              -settype xydy -block xb1_tot          -graph 0 -bxy 1:2:3 \
              -settype xy   -block model_miller     -graph 0 -bxy 1:2 \
              -settype xy   -block model_nosea_mstw -graph 0 -bxy 1:2 \
              -settype xy   -block model_sea_mstw   -graph 0 -bxy 1:2 \
              -settype xydy -block xb1_stat         -graph 0 -bxy 1:2:3 \
              -settype xydy -block xb1_tot          -graph 0 -bxy 1:2:3 \
              -settype xy   -block syst             -graph 0 -bxy 1:2 \
              -settype xydy -block hms_stat        -graph 0 -bxy 1:2:3 \
              -settype xydy -block shms_stat        -graph 0 -bxy 1:2:3 \
              -p xb1_proj_lin.par -noask


file4="../output/prop_table.out"
awk '$1==1 {print $2,0.0,$2*$11}' $file4 > hms_stat
awk '$1==2 {print $2,0.0,$2*$11}' $file4 > shms_stat
#awk '$8!=0.0 {print $3,0.0,1.5*$7}' $file3 > shms_stat
awk '$1==2 {print $3,$3*$16}' $file3 > syst

xmgrace -free -settype xydy -block xb1_stat         -graph 0 -bxy 1:2:3 \
              -settype xydy -block xb1_tot          -graph 0 -bxy 1:2:3 \
              -settype xy   -block model_miller     -graph 0 -bxy 1:2 \
              -settype xy   -block model_nosea_mstw -graph 0 -bxy 1:2 \
              -settype xy   -block model_sea_mstw   -graph 0 -bxy 1:2 \
              -settype xydy -block xb1_stat         -graph 0 -bxy 1:2:3 \
              -settype xydy -block xb1_tot          -graph 0 -bxy 1:2:3 \
              -settype xy   -block syst             -graph 0 -bxy 1:2 \
              -settype xydy -block hms_stat        -graph 0 -bxy 1:2:3 \
              -settype xydy -block shms_stat        -graph 0 -bxy 1:2:3 \
              -p xb1_proj_lin.par -noask
gracebat -hdevice EPS -printfile xb1_proj_newmiller_lin.eps \
              -settype xydy -block xb1_stat         -graph 0 -bxy 1:2:3 \
              -settype xydy -block xb1_tot          -graph 0 -bxy 1:2:3 \
              -settype xy   -block model_miller     -graph 0 -bxy 1:2 \
              -settype xy   -block model_nosea_mstw -graph 0 -bxy 1:2 \
              -settype xy   -block model_sea_mstw   -graph 0 -bxy 1:2 \
              -settype xydy -block xb1_stat         -graph 0 -bxy 1:2:3 \
              -settype xydy -block xb1_tot          -graph 0 -bxy 1:2:3 \
              -settype xy   -block syst             -graph 0 -bxy 1:2 \
              -settype xydy -block hms_stat        -graph 0 -bxy 1:2:3 \
              -settype xydy -block shms_stat        -graph 0 -bxy 1:2:3 \
              -p xb1_proj_lin.par -noask

rm -f xb1_stat
rm -f xb1_tot
rm -f model_nosea_*
rm -f model_sea_*
rm -f model_miller
rm -f hms_stat shms_stat
rm -f syst
