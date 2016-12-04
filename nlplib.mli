val word_split : BatText.t -> BatText.t list
module CharCount :
  sig
    type key = BatUChar.uchar
    type 'a t = 'a BatMap.Make(BatUChar).t
    val empty : 'a t
    val is_empty : 'a t -> bool
    val cardinal : 'a t -> int
    val add : key -> 'a -> 'a t -> 'a t
    val update : key -> key -> 'a -> 'a t -> 'a t
    val find : key -> 'a t -> 'a
    val remove : key -> 'a t -> 'a t
    val modify : key -> ('a -> 'a) -> 'a t -> 'a t
    val modify_def : 'a -> key -> ('a -> 'a) -> 'a t -> 'a t
    val modify_opt : key -> ('a option -> 'a option) -> 'a t -> 'a t
    val extract : key -> 'a t -> 'a * 'a t
    val pop : 'a t -> (key * 'a) * 'a t
    val mem : key -> 'a t -> bool
    val iter : (key -> 'a -> unit) -> 'a t -> unit
    val map : ('a -> 'b) -> 'a t -> 'b t
    val mapi : (key -> 'a -> 'b) -> 'a t -> 'b t
    val fold : (key -> 'a -> 'b -> 'b) -> 'a t -> 'b -> 'b
    val filterv : ('a -> bool) -> 'a t -> 'a t
    val filter : (key -> 'a -> bool) -> 'a t -> 'a t
    val filter_map : (key -> 'a -> 'b option) -> 'a t -> 'b t
    val compare : ('a -> 'a -> int) -> 'a t -> 'a t -> int
    val equal : ('a -> 'a -> bool) -> 'a t -> 'a t -> bool
    val keys : 'a t -> key BatEnum.t
    val values : 'a t -> 'a BatEnum.t
    val min_binding : 'a t -> key * 'a
    val pop_min_binding : 'a t -> (key * 'a) * 'a t
    val max_binding : 'a t -> key * 'a
    val pop_max_binding : 'a t -> (key * 'a) * 'a t
    val choose : 'a t -> key * 'a
    val split : key -> 'a t -> 'a t * 'a option * 'a t
    val partition : (key -> 'a -> bool) -> 'a t -> 'a t * 'a t
    val singleton : key -> 'a -> 'a t
    val bindings : 'a t -> (key * 'a) list
    val enum : 'a t -> (key * 'a) BatEnum.t
    val backwards : 'a t -> (key * 'a) BatEnum.t
    val of_enum : (key * 'a) BatEnum.t -> 'a t
    val for_all : (key -> 'a -> bool) -> 'a t -> bool
    val exists : (key -> 'a -> bool) -> 'a t -> bool
    val merge :
      (key -> 'a option -> 'b option -> 'c option) -> 'a t -> 'b t -> 'c t
    val print :
      ?first:string ->
      ?last:string ->
      ?sep:string ->
      ?kvsep:string ->
      ('a BatIO.output -> key -> unit) ->
      ('a BatIO.output -> 'c -> unit) -> 'a BatIO.output -> 'c t -> unit
    module Exceptionless : sig val find : key -> 'a t -> 'a option end
    module Infix :
      sig
        val ( --> ) : 'a t -> key -> 'a
        val ( <-- ) : 'a t -> key * 'a -> 'a t
      end
    module Labels :
      sig
        val add : key:key -> data:'a -> 'a t -> 'a t
        val iter : f:(key:key -> data:'a -> unit) -> 'a t -> unit
        val map : f:('a -> 'b) -> 'a t -> 'b t
        val mapi : f:(key:key -> data:'a -> 'b) -> 'a t -> 'b t
        val filterv : f:('a -> bool) -> 'a t -> 'a t
        val filter : f:(key -> 'a -> bool) -> 'a t -> 'a t
        val fold :
          f:(key:key -> data:'a -> 'b -> 'b) -> 'a t -> init:'b -> 'b
        val compare : cmp:('a -> 'a -> int) -> 'a t -> 'a t -> int
        val equal : cmp:('a -> 'a -> bool) -> 'a t -> 'a t -> bool
      end
  end
type count = { order : int; frequency : int; }
val word_stat : count CharCount.t -> BatText.t -> count CharCount.t
val print_charcount : count CharCount.t -> unit
