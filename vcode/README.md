# Visual Studio Code

Sync extensions by running this on machine A:
```
$ code --list-extensions | xargs -L 1 echo code --install-extension
```

then copy and paste it on machine B.

