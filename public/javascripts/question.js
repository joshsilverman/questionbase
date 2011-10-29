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

            // BR
            var newRow = table.insertRow(table.rows.length);

            var row = newRow.insertCell(0);
            var topicElement = document.createElement("br");
            row.appendChild(topicElement);  

            // Question
            var newRow = table.insertRow(table.rows.length);

            var label = newRow.insertCell(0);
            var element = document.createElement("label");
            var text = document.createTextNode("Question")
            element.appendChild(text);
            label.appendChild(element);

            var row = newRow.insertCell(1);
            var questionElement = document.createElement("input");
            questionElement.type = "text";
            row.appendChild(questionElement);
            questionElement.observe("keypress", function() { submitElement.value = "Save"; });
            
            // Correct answer
            var newRow = table.insertRow(table.rows.length);

            var label = newRow.insertCell(0);
            var element = document.createElement("label");
            var text = document.createTextNode("Correct answer")
            element.appendChild(text);
            label.appendChild(element);

            var row = newRow.insertCell(1);
            var correctElement = document.createElement("input");
            correctElement.type = "text";
            row.appendChild(correctElement);
            correctElement.observe("keypress", function() { submitElement.value = "Save"; });

            // Incorrect answer #1
            var newRow = table.insertRow(table.rows.length);

            var label = newRow.insertCell(0);
            var element = document.createElement("label");
            var text = document.createTextNode("Incorrect answer #1")
            element.appendChild(text);
            label.appendChild(element);

            var row = newRow.insertCell(1);
            var incorrectElement1 = document.createElement("input");
            incorrectElement1.type = "text";
            row.appendChild(incorrectElement1);
            incorrectElement1.observe("keypress", function() { submitElement.value = "Save"; });

            // Incorrect answer #2
            var newRow = table.insertRow(table.rows.length);

            var label = newRow.insertCell(0);
            var element = document.createElement("label");
            var text = document.createTextNode("Incorrect answer #2")
            element.appendChild(text);
            label.appendChild(element);

            var row = newRow.insertCell(1);
            var incorrectElement2 = document.createElement("input");
            incorrectElement2.type = "text";
            row.appendChild(incorrectElement2);
            incorrectElement2.observe("keypress", function() { submitElement.value = "Save"; });

            // Incorrect answer #3
            var newRow = table.insertRow(table.rows.length);

            var label = newRow.insertCell(0);
            var element = document.createElement("label");
            var text = document.createTextNode("Incorrect answer #3")
            element.appendChild(text);
            label.appendChild(element);

            var row = newRow.insertCell(1);
            var incorrectElement3 = document.createElement("input");
            incorrectElement3.type = "text";
            row.appendChild(incorrectElement3);   
            incorrectElement3.observe("keypress", function() { submitElement.value = "Save"; });
            
            // Topic
            var newRow = table.insertRow(table.rows.length);

            var label = newRow.insertCell(0);
            var element = document.createElement("label");
            var text = document.createTextNode("Topic")
            element.appendChild(text);
            label.appendChild(element);

            var row = newRow.insertCell(1);
            var topicElement = document.createElement("input");
            topicElement.type = "text";
            row.appendChild(topicElement);                      
            topicElement.observe("keypress", function() { submitElement.value = "Save"; });

            // Submit
            var newRow = table.insertRow(table.rows.length);

            var submitButton = newRow.insertCell(0);
            var submitElement = document.createElement("input");
            submitElement.type = "button";
            submitElement.value = "Save";
            submitButton.observe("click", function() {
                submitElement.value = "Saved";
                createNewQuestion({"question_id" : question_id, 
                    "question" : questionElement.value,
                    "correct_answer" : correctElement.value, 
                    "incorrect_answer_1" : incorrectElement1.value,
                    "incorrect_answer_2" : incorrectElement2.value, 
                    "incorrect_answer_3" : incorrectElement3.value, 
                    "topic" : topicElement.value, 
                    "chapter_id" : chapter_id
                });
            });
            submitButton.appendChild(submitElement);  

            // BR
            var newRow = table.insertRow(table.rows.length);

            var row = newRow.insertCell(0);
            var brElement = document.createElement("br");
            row.appendChild(brElement);  
                        
            // HR
            // var newRow = table.insertRow(table.rows.length);

            // var row = newRow.insertCell(0);
            // var hrElement = document.createElement("hr");
            // hrElement.width = 500;
            // row.appendChild(hrElement);  
        }
    });    
}

var createNewQuestion = function(question) {
    new Ajax.Request("/questions/save_question", {
        method: "post",
        parameters: question,
        onFailure: function() {
           alert("Failed to save question.");
        },
        onSuccess: function() {
            
        }
    });
}





