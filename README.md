# nim-fren

Little utility in Nim to convert filenames to a uniform format:

```
<prefix><random alphanumerix suffix>.<extension>
```

## Compile

```sh
$ nimble install passgen
$ mkdir bin
$ nim c -d:release -o:bin/fren fren.nim
```

## Test

```sh
$ bin/fren test shortname-

somefilewithlongname393834.jpg -> shortname-JFC7.jpg
```

## Run

```sh
$ bin/fren ~/Pictures/Incoming/ futuristic-

index.jpg -> futuristic-A5X9.jpg
```

## Install globally

Copy fren binary to a bin directory in your path, i.e.

```sh
$ sudo cp bin/fren /usr/bin
```

Now, you can run the utility without prepending a path:

```sh
fren <arguments>
```