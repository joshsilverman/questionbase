var addQuestionRow = function(chapter_id) {
    new Ajax.Request("/questions/new", {
        method: "get",
        onFailure: function() {
           alert("Failed to save question.");
        },
        onSuccess: function(response) {
            var response = JSON.parse(response.request.transport.responseText);
            var question_id = response["question_id"];

            var table = $('questions');
            var newRow = table.insertRow(table.rows.length);

            var questionLabel = newRow.insertCell(0);
            var questionElement = document.createElement("label");
            var questionText = document.createTextNode("Question")
            questionElement.appendChild(questionText);
            questionLabel.appendChild(questionElement);

            var rowQuestion = newRow.insertCell(1);
            var questionElement = document.createElement("input");
            questionElement.type = "text";
            rowQuestion.appendChild(questionElement);

            var rowCorrect = newRow.insertCell(2);
            var correctElement = document.createElement("input");
            correctElement.type = "text";
            rowCorrect.appendChild(correctElement);

            var rowIncorrect1 = newRow.insertCell(3);
            var incorrect1Element = document.createElement("input");
            incorrect1Element.type = "text";
            rowIncorrect1.appendChild(incorrect1Element);

            var rowIncorrect2 = newRow.insertCell(4);
            var incorrect2Element = document.createElement("input");
            incorrect2Element.type = "text";
            rowIncorrect2.appendChild(incorrect2Element);
            
            var rowIncorrect3 = newRow.insertCell(5);
            var incorrect3Element = document.createElement("input");
            incorrect3Element.type = "text";
            rowIncorrect3.appendChild(incorrect3Element);    

            var rowTopic = newRow.insertCell(6);
            var topicElement = document.createElement("input");
            topicElement.type = "text";
            rowTopic.appendChild(topicElement); 

            var submitButton = newRow.insertCell(7);
            var submitElement = document.createElement("input");
            submitElement.type = "button";
            submitElement.value = "Save";
            submitButton.observe("click", function() {
                createNewQuestion({"question_id" : question_id, 
                    "question" : questionElement.value,
                    "correct_answer" : correctElement.value, 
                    "incorrect_answer_1" : incorrect1Element.value,
                    "incorrect_answer_2" : incorrect2Element.value, 
                    "incorrect_answer_3" : incorrect3Element.value, 
                    "topic" : topicElement.value, 
                    "chapter_id" : chapter_id
                });
            });
            submitButton.appendChild(submitElement);              
        }
    });    
}

var createNewQuestion = function(question) {
    new Ajax.Request("/questions/save_question", {
        method: "post",
        parameters: question,
        onFailure: function() {
           // alert("Failed to save question.");
        },
        onSuccess: function() {
            
        }
    });
}





