locals {
  participants = 
  [
    "rolf",
    "manuel",
    "gianluca",
    "wolfgang",
    "matthias",
    "daniel"
  ]
  
  teacher = ["daniel"]
  
  participants_with_uppercase = [
    for participant in local.participants : upper(participant) if contains(local.teacher, participant) == false
  ]

}

IsDanielAParteicipants = contains(local.participants,"daniel")




