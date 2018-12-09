# clean current output plots and tables
echo "remove existing output files"
rm ./plots/*
rm ./output/*

# national
echo "Running: national onset week"
R CMD BATCH ./LR1.R
echo "Done: national onset week"

echo "Running: national peak week"
R CMD BATCH ./LR2.R
echo "Done: national peak week"

echo "Running: national peak prev"
R CMD BATCH ./LR3.R
echo "Done: national peak prev"

echo "Running: national ILI prev 1-4 weeks ahead"
R CMD BATCH ./LR4.R
echo "Done: national ILI prev 1-4 weeks ahead"


# CA
echo "Running: CA onset week"
R CMD BATCH ./LR1.CA.R
echo "Done: CA onset week"

echo "Running: CA peak week"
R CMD BATCH ./LR2.CA.R
echo "Done: CA peak week"

echo "Running: CA peak prev"
R CMD BATCH ./LR3.CA.R
echo "Done: CA peak prev"

echo "Running: CA ILI prev 1-4 weeks ahead"
R CMD BATCH ./LR4.CA.R
echo "Done: CA ILI prev 1-4 weeks ahead"


# 10 regions
echo "Running: 10 regions onset week"
R CMD BATCH ./LR1.HHS.R
echo "Done: 10 regions onset week"

echo "Running: 10 regions peak week"
R CMD BATCH ./LR2.HHS.R
echo "Done: 10 regions peak week"

echo "Running: 10 regions peak prev"
R CMD BATCH ./LR3.HHS.R
echo "Done: 10 regions peak prev"

echo "Running: 10 regions ILI prev 1-4 weeks ahead"
R CMD BATCH ./LR4.HHS.R
echo "Done: 10 regions ILI prev 1-4 weeks ahead"


# 54 states
echo "Running: 10 states onset week"
R CMD BATCH ./LR1.States.R
echo "Done: 10 states onset week"

echo "Running: 10 states peak week"
R CMD BATCH ./LR2.States.R
echo "Done: 10 states peak week"

echo "Running: 10 states peak prev"
R CMD BATCH ./LR3.States.R
echo "Done: 10 states peak prev"

echo "Running: 10 states ILI prev 1-4 weeks ahead"
R CMD BATCH ./LR4.States.R
echo "Done: 10 states ILI prev 1-4 weeks ahead"

# merge outputs 
echo "Running: merge output"
R CMD BATCH ./merge.data2.R
echo "Done: merge output"
