#!/usr/bin/env bash
#sudo egencache --repo=salfter --update && sudo chown -R salfter /var/db/repos/salfter && git add /var/db/repos/salfter/metadata && git commit -a && git remote | xargs -l git push
egencache --repo=salfter --update && git add /var/db/repos/salfter/metadata && git commit -a && git remote | xargs -l git push
