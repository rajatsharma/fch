let () =
  let branch_name = Array.get Sys.argv 1 in
  match Format.sprintf "git fetch origin/%s" branch_name |> Sys.command with
  | 0 -> (
      match Format.sprintf "git checkout %s" branch_name |> Sys.command with
      | 0 -> exit 0
      | _ ->
          Format.printf "unable to checkout to %s" branch_name;
          exit 1)
  | _ ->
      Format.printf "unable to fetch origin/%s" branch_name;
      exit 1
