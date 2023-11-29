locals {
  participants = 
  [
    "ROLF",
    "MANUEL",
    "GIANLUCA",
    "WOLFGANG",
    "MATTHIAS",
  ]
  
  teacher = ["daniel"]
  
  participants_with_uppercase = [
    for participant in local.participants : upper(participant) if contains(local.teacher, participant)
  ]


  
  IsDanielAParteicipants = contains(local.participants,"daniel")
}






