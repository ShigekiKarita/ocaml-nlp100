open Batteries


let word_split t =
  let delimiter = Text.of_string " " in
  let ignore_postfixes = [','; '.'] |> List.map UChar.of_char in
  Text.nsplit t delimiter
  |> List.map @@ Text.strip ~chars: ignore_postfixes

module CharCount = Map.Make(UChar)

type count = { order: int; frequency: int }

let word_stat map word =
  let inc c m =
    if CharCount.mem c m
    then let cc = CharCount.find c m in
         { cc with frequency = cc.frequency + 1}
    else { order = CharCount.cardinal m; frequency = 1 } in
  Text.fold (fun m c -> CharCount.add c (inc c m) m) map word

let print_charcount m =
  let a = Array.make (CharCount.cardinal m) (UChar.of_char ' ') in
  let assign_elem k v = a.(v.order) <- k in
  CharCount.iter assign_elem m;
  let print_elem k = Printf.printf "%c: %d\n" (UChar.char_of k) (CharCount.find k m).frequency in
  Array.iter print_elem a
