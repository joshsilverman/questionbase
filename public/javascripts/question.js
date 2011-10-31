var saveQuestion = function(id, chapter_id) {
    // console.log($('correct_answer_' + id));
    params = {"question_id" : id,
        "question" : $('question_' + id).value,
        "correct_answer" : $('correct_answer_' + id).value,
        "incorrect_answer_1" : $('incorrect_answer_1_' + id).value,
        "incorrect_answer_2" : $('incorrect_answer_2_' + id).value,
        "incorrect_answer_3" : $('incorrect_answer_3_' + id).value,
        "topic" : $('topic_' + id).value,
        "chapter_id" : chapter_id
    };
    new Ajax.Request("/questions/save_question", {
        method: "post",
        parameters: params,
        onFailure: function() {
           alert("Failed to save question.");
        },
    });   
}

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

            var topicElement = document.createElement("br");
            newRow.appendChild(topicElement);  

            // Question
            var newRow = table.insertRow(table.rows.length);

            var element = document.createElement("label");
            var text = document.createTextNode("Question")
            element.appendChild(text);
            newRow.appendChild(element);

            var questionElement = document.createElement("textarea");
            newRow.appendChild(questionElement);
            questionElement.observe("keypress", function() { submitElement.value = "Save"; });
            
            // Correct answer
            var newRow = table.insertRow(table.rows.length);

            var element = document.createElement("label");
            var text = document.createTextNode("Correct answer")
            element.appendChild(text);
            newRow.appendChild(element);

            var correctElement = document.createElement("input");
            correctElement.className = "field";
            newRow.appendChild(correctElement);
            correctElement.observe("keypress", function() { submitElement.value = "Save"; });

            // Incorrect answer #1
            var newRow = table.insertRow(table.rows.length);

            var element = document.createElement("label");
            var text = document.createTextNode("Incorrect answer #1")
            element.appendChild(text);
            newRow.appendChild(element);

            var incorrectElement1 = document.createElement("input");
            incorrectElement1.className = "field";
            newRow.appendChild(incorrectElement1);
            incorrectElement1.observe("keypress", function() { submitElement.value = "Save"; });

            // Incorrect answer #2
            var newRow = table.insertRow(table.rows.length);

            var element = document.createElement("label");
            var text = document.createTextNode("Incorrect answer #2")
            element.appendChild(text);
            newRow.appendChild(element);

            var incorrectElement2 = document.createElement("input");
            incorrectElement2.className = "field";
            newRow.appendChild(incorrectElement2);
            incorrectElement2.observe("keypress", function() { submitElement.value = "Save"; });

            // Incorrect answer #3
            var newRow = table.insertRow(table.rows.length);

            var element = document.createElement("label");
            var text = document.createTextNode("Incorrect answer #3")
            element.appendChild(text);
            newRow.appendChild(element);

            var incorrectElement3 = document.createElement("input");
            incorrectElement3.className = "field";
            newRow.appendChild(incorrectElement3);   
            incorrectElement3.observe("keypress", function() { submitElement.value = "Save"; });
            
            // Topic
            var newRow = table.insertRow(table.rows.length);

            var element = document.createElement("label");
            var text = document.createTextNode("Topic")
            element.appendChild(text);
            newRow.appendChild(element);

            var topicElement = document.createElement("input");
            topicElement.className = "field";
            newRow.appendChild(topicElement);                      
            topicElement.observe("keypress", function() { submitElement.value = "Save"; });
            
            // BR
            var newRow = table.insertRow(table.rows.length);

            var brElement = document.createElement("br");
            newRow.appendChild(brElement);  

            // Submit
            var newRow = table.insertRow(table.rows.length);

            var submitElement = document.createElement("input");
            submitElement.type = "button";
            submitElement.value = "Save";
            submitElement.observe("click", function() {
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
            newRow.appendChild(submitElement);  

            // BR
            var newRow = table.insertRow(table.rows.length);

            var brElement = document.createElement("br");
            newRow.appendChild(brElement);  
                        
            // HR
            var newRow = table.insertRow(table.rows.length);

            var hrElement = document.createElement("hr");
            hrElement.width = "auto";
            newRow.appendChild(hrElement);  
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
    });
}





