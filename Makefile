CURRENT_COMMIT=$(shell git rev-list --max-count=1 HEAD)

all: site

site:
	hugo -d docs --theme=hugo-profile

server: site
	hugo server --theme=hugo-profile --buildDrafts

publish: all
	git status | grep 'nothing to commit'
	git push origin -u main
	git checkout gh-pages
	git merge -m 'auto merge main' main
	git push origin -u gh-pages
	git checkout main

