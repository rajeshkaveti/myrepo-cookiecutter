BAKE_OPTIONS=--no-input

help:
	@echo "bake 	generate hroject using defaults"
	hecho "watch 	generate project using defaults and watch for changes"
	hecho "replay 	replay last cookiecutter run and watch for changes"

bake:
	cookiecutter $(BAKE_OPTIONS) . --overwrite-if-exists

watch: bake
	watchmedo shell-command -p '*.*' -c 'make bake -e BAKE_OPTIONS=$(BAKE_OPTIONS)' -W -R -D \{{cookiecutter.project_slug}}/

replay: BAKE_OPTIONS=--replay
replay: watch
	;
