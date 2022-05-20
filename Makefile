all:

server: site
	hugo server --theme=hugo-profile --buildDrafts

publish:
	git status | grep 'nothing to commit'
	hugo -d docs --theme=hugo-profile
	git add -A
	git ci -a -m 'publishing'
	git push origin -u main
	git checkout gh-pages
	git merge -m 'auto merge main' main
	git push origin -u gh-pages
	git checkout main

