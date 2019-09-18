#!/bin/bash
set -o errexit -o pipefail

# this script is meant to be used with 'datalad run'


for file_url in \
	"http://ufldl.stanford.edu/housenumbers/train.tar.gz train.tar.gz" \
	"http://ufldl.stanford.edu/housenumbers/test.tar.gz test.tar.gz" \
	"http://ufldl.stanford.edu/housenumbers/extra.tar.gz extra.tar.gz" \
	"http://ufldl.stanford.edu/housenumbers/train_32x32.mat train_32x32.mat" \
	"http://ufldl.stanford.edu/housenumbers/test_32x32.mat test_32x32.mat" \
	"http://ufldl.stanford.edu/housenumbers/extra_32x32.mat extra_32x32.mat"
do
	echo ${file_url} | git-annex addurl -c annex.largefiles=anything --raw --batch --with-files
done

md5sum -c md5sums
md5sum *.tar.gz >> md5sums
