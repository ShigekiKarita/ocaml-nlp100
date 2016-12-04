open Batteries

(*
03. 円周率
"Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."という文を単語に分解し，各単語の（アルファベットの）文字数を先頭から出現順に並べたリストを作成せよ．
 *)


let () =
  Text.of_string "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."
  |> Nlplib.word_split
  |> List.fold_left Nlplib.word_stat Nlplib.CharCount.empty
  |> Nlplib.print_charcount
