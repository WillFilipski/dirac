#! /bin/bash

for ii in *.xyz ; do
    i=${ii%.sub
    }

    cat > ${i}.sub <<EOF
#! /bin/bash
#SBATCH -t 1-00:00
#SBATCH -J ${i}
#SBATCH -o ${i}.out
#SBATCH -e ${i}.err
#SBATCH -N 1
#SBATCH -n 32
#SBATCH --mem-per-cpu=4000M
#SBATCH --account=def-dilabiog-ac

module load python
module load StdEnv intel intelmpi
module load dirac

pam --mol=${i}.xyz --input=hf.inp

EOF
done
