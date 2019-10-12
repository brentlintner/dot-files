#!/usr/bin/env sh
systemd-run --on-calendar=daily /bin/sh /usr/local/bin/pkg-list
