open Batteries

(*
01. 「パタトクカシーー」
「パタトクカシーー」という文字列の1,3,5,7文字目を取り出して連結した文字列を得よ．
 *)

let () =
  Text.enum @@ Text.of_string "パタトクカシーー"
  |> Enum.mapi (fun i x -> if i mod 2 = 0 then None else Some x)
  |> Enum.fold (fun t -> function None -> t | Some c -> Text.append_char c t) Text.empty
  |> Text.to_string |> print_endline
