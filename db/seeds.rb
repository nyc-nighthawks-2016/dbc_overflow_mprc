#Users
User.create(username:"marcoman", email:"marco@gmail.com", password:"password")
User.create(username:"robcav", email:"robcav@gmail.com", password:"password")
User.create(username:"patrick", email:"patrick@gmail.com", password:"password")
User.create(username:"caitlinc", email:"caitlin@gmail.com", password:"password")


#Question
Question.create(question: "How do I find the length of a string?", description:"I dont know how to find the length of the string. :(", user_id:1)
Question.create(question: "syntax to access object model in DOM",description:"Javascript is hard.", user_id:2)
Question.create(question: "How do I change font color using css3?", description:"Idk how to change the font color", user_id:1)
Question.create(question: "How do I create header tags in html?", description:"I need to make headers.", user_id:3)
Question.create(question: "How do I select everything in DB using SQL?", description:"Idk SQL :*", user_id:4)

#Answers
Answer.create(answer:"use .length", question_id: 1, user_id:2)
Answer.create(answer:"use $('')", question_id: 2, user_id:4)
Answer.create(answer:"set color:(color)", question_id: 3, user_id:3)
Answer.create(answer:"use SELECT * FROM (tablename)", question_id: 5, user_id:1)

#Comments
#comments on questions
Comment.create(comment:"great question", commentable_id:1, commentable_type:"Question", user_id:4)
Comment.create(comment:"stupid question", commentable_id:2, commentable_type:"Question", user_id:3)
Comment.create(comment:"go back to school", commentable_id:3, commentable_type:"Question", user_id:2)
Comment.create(comment:"interesting", commentable_id:4, commentable_type:"Question", user_id:1)

#comments on answers
Comment.create(comment:"agreed", commentable_id:4, commentable_type:"Answer", user_id:4)
Comment.create(comment:"no way", commentable_id:3, commentable_type:"Answer", user_id:2)
Comment.create(comment:"tell me more", commentable_id:2, commentable_type:"Answer", user_id:1)
Comment.create(comment:"please clarify", commentable_id:1, commentable_type:"Answer", user_id:3)

#Tags
Tag.create(name:"Ruby")
Tag.create(name:"Jquery")
Tag.create(name:"Javascript")
Tag.create(name:"CSS")
Tag.create(name:"HTML")
Tag.create(name:"SQL")

#Votes
#answers
Vote.create(voteable_id: 2, voteable_type:"Answer", user_id:1)
Vote.create(voteable_id: 1, voteable_type:"Answer", user_id:3)
Vote.create(voteable_id:4, voteable_type:"Answer", user_id:2)
Vote.create(voteable_id:3, voteable_type:"Answer", user_id:4)


#comments
Vote.create(voteable_id:8, voteable_type:"Comment", user_id:4)
Vote.create(voteable_id:7, voteable_type:"Comment", user_id:3)
Vote.create(voteable_id:5, voteable_type:"Comment", user_id:2)
Vote.create(voteable_id:3, voteable_type:"Comment", user_id:1)


#questions
Vote.create(voteable_id:4, voteable_type:"Question", user_id:1)
Vote.create(voteable_id:3, voteable_type:"Question", user_id:2)
Vote.create(voteable_id:2, voteable_type:"Question", user_id:3)
Vote.create(voteable_id:1, voteable_type:"Question", user_id:4)


#Question_Tags
QuestionTag.create(tag_id: 1, question_id: 1)
QuestionTag.create(tag_id: 2, question_id:2)
QuestionTag.create(tag_id: 3, question_id:2)
QuestionTag.create(tag_id:5, question_id:3)
QuestionTag.create(tag_id:4, question_id:3)
QuestionTag.create(tag_id:4, question_id:4)
QuestionTag.create(tag_id:5, question_id:4)
QuestionTag.create(tag_id:6, question_id:5)

