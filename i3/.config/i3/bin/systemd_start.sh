#!/bin/sh

systemctl --user import-environment
systemctl --user start user-graphical-login.target
