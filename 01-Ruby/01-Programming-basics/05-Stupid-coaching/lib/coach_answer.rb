def coach_answer(your_message)
  # TODO: return coach answer to your_message
  if your_message.upcase == "I AM GOING TO WORK RIGHT NOW!"
    ""
  # apparemment ma méthode est pas top :'(
  # elsif your_message[-1,1] == "?"
  # vaut mieux utiliser celle ci
  elsif your_message.end_with? "?"
    "Silly question, get dressed and go to work!"
  else
    "I don't care, get dressed and go to work!"
  end
end

def coach_answer_enhanced(your_message)
  # TODO: return coach answer to your_message, with additional custom rules of yours!
  if your_message == "I AM GOING TO WORK RIGHT NOW!"
    coach_enhanced_message = ""
  elsif your_message.upcase == your_message
    coach_enhanced_message = "I can feel your motivation! "
  else
    coach_enhanced_message = ""
  end

  coach_enhanced_message + coach_answer(your_message)

end

