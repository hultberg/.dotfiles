#!/usr/bin/env python
# -*- coding: utf-8 -*-

import subprocess

if __name__ == '__main__':
    # Make sure xscreensaver is running.
    subprocess.Popen('xscreensaver', shell=True)
    
    # Lock.
    subprocess.Popen('xscreensaver-command -l', shell=True)