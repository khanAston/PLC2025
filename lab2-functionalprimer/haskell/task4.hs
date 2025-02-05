ask :: String -> IO ()
ask prompt =
  do
  putStrLn prompt
  line <- getLine
  if line == ""
    then do
      let newPrompt  = prompt ++ "!";
      ask newPrompt 
  else if line == "quit"
    then putStrLn ("Okay, exiting")
  else putStrLn ("you said: " ++ reverse line)

main :: IO ()
main =
  do
  let prompt = "please say something"
  ask prompt