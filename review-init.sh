echo -n 'input your project name >> '
read project_name

docker run --rm  -v $(pwd):/work vvakame/review:latest /bin/sh -c "cd /work && review-init $project_name"
