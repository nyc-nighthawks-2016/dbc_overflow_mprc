#Users
User.create(username:"marcoman", email:"marco@gmail.com", password:"password")
User.create(username:"robcav", email:"robcav@gmail.com", password:"password")
User.create(username:"patrick", email:"patrick@gmail.com", password:"password")
User.create(username:"caitlinc", email:"caitlin@gmail.com", password:"password")
User.create(username:"lizzie", email:"lizzie@gmail.com", password:"password")
User.create(username:"computerdude", email:"computerdude@gmail.com", password:"password")
User.create(username:"adachai", email:"adachai@gmail.com", password:"password")
User.create(username:"dawnchai", email:"dawnchai@gmail.com", password:"password")

#Question
Question.create(question: "How do I find the length of a string?", description:"Lorem ipsum dolor sit amet, id has eius facilisis, noluisse reprimique vix in. Sit in tibique intellegat, vel ex essent prodesset. Quis minimum vulputate id pri, no nullam verterem democritum usu. Postulant corrumpit est no. Eros veri salutandi sit no, et molestie patrioque sadipscing eum. Saperet tacimates eam id, eum habemus offendit at.", user_id:1)
Question.create(question: "syntax to access object model in DOM",description:"Zril concludaturque nam ad, id quo elit ipsum mentitum. Eum illud quodsi delicata et. Id denique adolescens usu. Mei meis legere nostro ad, duis altera laoreet ut usu.", user_id:2)
Question.create(question: "How do I change font color using css3?", description:"An minim everti iracundia cum, qui ne case ubique. Case discere gloriatur nec ne, id usu purto iriure appetere. Usu libris inermis accusamus cu, cum te partem dolorem. Alia reque vix at, tantas albucius in cum, ad pri facer cetero consetetur. Nec at audiam alienum interpretaris, at consequat incorrupte mea.", user_id:1)
Question.create(question: "How do I create header tags in html?", description:"Id pri appareat evertitur. Viderer diceret usu at. Ex mea rebum minimum consectetuer, simul audire instructior vis ei. Quo nostrud civibus dissentias ut, ei diceret efficiantur eum, viderer conceptam an sit. Ius ea natum interpretaris, an mea eirmod blandit. Eam affert praesent te, an mazim philosophia sed, id ludus semper torquatos duo. Cu choro semper maiorum nec, unum magna aperiam nam et, semper maluisset quo in.", user_id:3)
Question.create(question: "How do I select everything in DB using SQL?", description:"lass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim lacinia nunc. Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet.", user_id:4)

#Answers
Answer.create(answer:"use .length", question_id: 1, user_id:2)
Answer.create(answer:"use $", question_id: 2, user_id:4)
Answer.create(answer:"set color:(color)", question_id: 3, user_id:3)
Answer.create(answer:"use SELECT * FROM (tablename)", question_id: 5, user_id:1)

#Comments
#comments on questions
Comment.create(comment:"great question", commentable_id:1, commentable_type:"Question", user_id:4)
Comment.create(comment:"stupid question", commentable_id:2, commentable_type:"Question", user_id:3)
Comment.create(comment:"go back to school", commentable_id:3, commentable_type:"Question", user_id:2)
Comment.create(comment:"interesting", commentable_id:4, commentable_type:"Question", user_id:1)
Comment.create(comment:"no way", commentable_id:3, commentable_type:"Answer", user_id:2)
Comment.create(comment:"tell me more", commentable_id:2, commentable_type:"Answer", user_id:1)
Comment.create(comment:"please clarify", commentable_id:1, commentable_type:"Answer", user_id:3)

#Tags
Tag.create(name:"ruby")
Tag.create(name:"jquery")
Tag.create(name:"javascript")
Tag.create(name:"css")
Tag.create(name:"html")
Tag.create(name:"sql")

# #Votes
# #answers
# Vote.create(voteable_id: 2, voteable_type:"Answer", user_id:1)
# Vote.create(voteable_id: 1, voteable_type:"Answer", user_id:3)
# Vote.create(voteable_id:4, voteable_type:"Answer", user_id:2)
# Vote.create(voteable_id:3, voteable_type:"Answer", user_id:4)


# #comments
# Vote.create(voteable_id:8, voteable_type:"Comment", user_id:4)
# Vote.create(voteable_id:7, voteable_type:"Comment", user_id:3)
# Vote.create(voteable_id:5, voteable_type:"Comment", user_id:2)
# Vote.create(voteable_id:3, voteable_type:"Comment", user_id:1)


# #questions
# Vote.create(voteable_id:4, voteable_type:"Question", user_id:1)
# Vote.create(voteable_id:3, voteable_type:"Question", user_id:2)
# Vote.create(voteable_id:2, voteable_type:"Question", user_id:3)
# Vote.create(voteable_id:1, voteable_type:"Question", user_id:4)


#Question_Tags
QuestionTag.create(tag_id: 1, question_id: 1)
QuestionTag.create(tag_id: 2, question_id:2)
QuestionTag.create(tag_id: 3, question_id:2)
QuestionTag.create(tag_id:5, question_id:3)
QuestionTag.create(tag_id:4, question_id:3)
QuestionTag.create(tag_id:4, question_id:4)
QuestionTag.create(tag_id:5, question_id:4)
QuestionTag.create(tag_id:6, question_id:5)

