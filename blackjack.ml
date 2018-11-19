type card = int
  
type player =
  | Player
  | Dealer
    
type move =
  | Hit
  | Stand

type deck = { deck : card array;
              remaining : int;
            }

type gamestate = { deck : deck;
                   money : int;
                   hand : card list;
                   turn : player
                 }

let num_decks = 8

let rec repeat ?(lst=[]) n elem =
  match n with
  | e when e < 0 -> failwith (Printf.sprintf "Invalid number of repitions: %d" e)
  | 0 -> lst
  | x -> elem :: (repeat ~lst (n-1) elem)

let create_deck () =
  let cards =
    List.map
      (repeat 4)
      [0;2;3;4;5;6;7;8;9;10;10;10;10]
  |> List.flatten
  in
  repeat
    num_decks
    cards
  |> List.flatten
  |> Array.of_list

let select_card deck =
  (* randomly pick card, set card space to -1, return card *)
  failwith "not implemented"

let dealer_strat hand =
  (* Given a list of cards, return move  *)
  failwith "unimplemented"

let player_strat hand =
  (* Given a list of cards, return move  *)
  failwith "unimplemented"

let rec play_game {deck; money; hand; turn} =
  let play_one_hand strat =
    match strat hand with
    | Hit ->
      let deck, hand = select_card deck in
      play_game {deck;money;hand;turn} 
    | Stand -> play_game {deck;money;hand;turn=Player;}
  in
  match turn with
  | Dealer -> play_one_hand dealer_strat
  | Player -> play_one_hand player_strat
