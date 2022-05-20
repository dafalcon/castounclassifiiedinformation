CURRENT_COMMIT=$(shell git rev-list --max-count=1 HEAD)

all: site

site:
	git submodule update
	hugo --theme=hugo-profile

server: site
	hugo server --theme=hugo-profile --buildDrafts

publish: all
	git status | grep 'nothing to commit'
	git push origin -u main
	git checkout gh-pages
	rm -rf css img js work
	mv public/* .
	rm -r public
	rm -rf themes
	git add *
	git status
	git ci -a -m ${CURRENT_COMMIT}
	git push origin -u gh-pages
	git checkout main

