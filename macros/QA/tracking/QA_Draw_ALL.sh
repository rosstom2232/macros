#! /bin/tcsh -f

echo "Usage: $0 new_QA_file [ reference_QA_file ]";

set q = '"';

if ($# < 1) then
 echo "Missing parameters: $*"
 exit 1
endif

set new_QA_file = "$q$1$q";
set reference_QA_file = 'NULL';


if ($# >= 2) then
  set reference_QA_file = "$q$2$q";
endif

echo "$0 - New QA file: $new_QA_file";
echo "$0 - Reference QA file: $reference_QA_file";

# intt stuff
root -b -q "QA_Draw_Intt.C(${q}QAG4SimulationIntt${q},$new_QA_file, $reference_QA_file)"

# mvtx stuff
root -b -q "QA_Draw_Mvtx.C(${q}QAG4SimulationMvtx${q},$new_QA_file, $reference_QA_file)"

# tpc stuff
root -b -q "QA_Draw_Tpc.C(${q}QAG4SimulationTpc${q},$new_QA_file, $reference_QA_file)"

# dca stuff
root -b -q "QA_Draw_DCA_rPhi.C(${q}QAG4SimulationTracking${q}, $new_QA_file, $reference_QA_file)"
root -b -q "QA_Draw_DCA_Z.C(${q}QAG4SimulationTracking${q}, $new_QA_file, $reference_QA_file)"
root -b -q "QA_Draw_DCA_Resolution.C(${q}QAG4SimulationTracking${q}, $new_QA_file, $reference_QA_file)"
root -b -q "QA_Draw_DCA_Sigmalized.C(${q}QAG4SimulationTracking${q}, $new_QA_file, $reference_QA_file)"

# vertex stuff
root -b -q "QA_Draw_Vertex_nVertex.C(${q}QAG4SimulationVertex${q}, $new_QA_file, $reference_QA_file)"
root -b -q "QA_Draw_Vertex_Resolution.C(${q}QAG4SimulationVertex${q}, $new_QA_file, $reference_QA_file)"

# last all jet stuff
root -b -q "QA_Draw_Tracking_TruthMatchingOverview.C(${q}QAG4SimulationTracking${q}, $new_QA_file, $reference_QA_file)"
root -b -q "QA_Draw_Tracking_pTRatio.C(${q}QAG4SimulationTracking${q}, $new_QA_file, $reference_QA_file)"
root -b -q "QA_Draw_Tracking_TruthMatching_NumOfClusters.C(${q}QAG4SimulationTracking${q}, $new_QA_file, $reference_QA_file)"
root -b -q "QA_Draw_Tracking_nClus_Layer.C(${q}QAG4SimulationTracking${q}, $new_QA_file, $reference_QA_file)"
root -b -q "QA_Draw_Tracking_RecoTruthMatching.C(${q}QAG4SimulationTracking${q}, $new_QA_file, $reference_QA_file)"

root -b -q "QA_Draw_Tracking_UpsilonOverview.C(${q}QAG4SimulationUpsilon${q},$new_QA_file, $reference_QA_file)"

echo "$0 - Output plots:";
ls -lh $1*.png;
