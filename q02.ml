open Batteries

(*
02. 「パトカー」＋「タクシー」＝「パタトクカシーー」
「パトカー」＋「タクシー」の文字を先頭から交互に連結して文字列「パタトクカシーー」を得よ．
 *)

let zip_text =
  let append2 x y = Text.append_char x %> Text.append_char y in
  Enum.fold2 append2 Text.empty

let zip_string a b =
  let of_enum =  Text.enum % Text.of_string in
  let ea = of_enum a in
  let eb = of_enum b in
  zip_text ea eb

let () =
  zip_string "パトカー" "タクシー"
  |> Text.to_string |> print_endline
