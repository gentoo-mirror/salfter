#!/usr/bin/env bash
sudo egencache --repo=salfter --update && chown -R salfter . && git commit -a && git remote | xargs -l git push
