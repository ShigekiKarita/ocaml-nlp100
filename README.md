# NLP 100本ノック

http://www.cl.ecei.tohoku.ac.jp/nlp100/

+ 使用言語 OCaml
+ 使用ライブラリ Batteries

## 動かし方

インストール

```
$ sudo apt install opam
$ opam init
$ opam switch 4.04+flambda
$ opam install batteries ocamlbuild
$ eval `opam config env`
```


コンパイルと実行

```
$ ocamlbuild -use-ocamlfind ./q00.native
$ ./q00.native
```
