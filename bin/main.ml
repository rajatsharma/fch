let () =
  let branch_name = Array.get Sys.argv 1 in
  if Format.sprintf "git fetch origin/%s" branch_name |> Sys.command != 0 then (
    Format.printf "unable to fetch %s" branch_name;
    exit 1);
  if Format.sprintf "git checkout %s" branch_name |> Sys.command != 0 then (
    Format.printf "unable to checkout to %s" branch_name;
    exit 1);
  exit 0
