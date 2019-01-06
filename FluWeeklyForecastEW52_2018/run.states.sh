# 54 states
echo "Running: 54 states onset week"
R CMD BATCH ./LR1.States.R
echo "Done: 54 states onset week"

echo "Running: 54 states peak week"
R CMD BATCH ./LR2.States.R
echo "Done: 54 states peak week"

echo "Running: 54 states peak prev"
R CMD BATCH ./LR3.States.R
echo "Done: 54 states peak prev"

echo "Running: 54 states ILI prev 1-4 weeks ahead"
R CMD BATCH ./LR4.States.R
echo "Done: 54 states ILI prev 1-4 weeks ahead"
