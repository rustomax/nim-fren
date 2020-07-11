# nim-fren
Little utility in Nim to convert filenames to a uniform format:

```
<prefix><random alphanumerix suffix>.<extension>
```

## Compile
```sh
nim c -d:release -o:/bin/fren fren.nim
```

## Run
```sh
./fren ~/Pictures/Incoming/ futuristic-

index.jpg -> futuristic-A5X9.jpg
```
