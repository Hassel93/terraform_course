locals {
  participants = 
  [
    {
      name="rolf",
      teacher = false
    },
    {
      name="manuel",
      teacher = false
    },
    {
      name="gianluca",
      teacher = false
    },
    {
      name="wolfgang",
      teacher = false
    },
    {
      name="matthias",
      teacher = false
    },
    {
      name="daniel",
      teacher = true
    }
  ]
  
  participants_with_uppercase = [
    for participant in local.participants : upper(participant.name) if participant.teacher == false
  ]
  
}



