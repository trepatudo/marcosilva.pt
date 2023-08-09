#!/usr/bin/env sh


# Get the template
(mkdir site && cd site && curl -O https://github.com/trepatudo/marcosilva.pt-template/archive/refs/heads/main.tar.gz  && tar zxvf main.tar.gz && cd ..)

# Export files
emacs --batch --eval "(progn (package-initialize) (package-refresh-contents) (package-install 'org))"
emacs --batch --no-init-file --load ./deploy/publish.el --funcall org-publish-all

# Build jekyll
(cd site && jekyll build)

# Rsync site
