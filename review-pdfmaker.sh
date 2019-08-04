echo -n 'input convert project name >> '
read project_name
cd $project_name
docker run --rm -v $(pwd):/work -v $(pwd)/.texmf-var:/root/.texmf-var vvakame/review:latest /bin/sh -c "cd /work && review-pdfmaker config.yml"
echo 'convert is done !!'
echo 'look at /' $project_name '/book.pdf'
