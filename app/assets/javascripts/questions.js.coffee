window.Application ||= {}

$(document).ready -> Application.initializeListeners()

Application.initializeListeners = ->
	$('.field').each () ->
		this.addEventListener "keypress", () ->
			console.log this.id
			#STOPPED HERE!!
			console.log $('#submit_' + this.id.to_s)


Application.addQuestionRow = (chapter_id) ->
	table = $('#questions')[0]

	# BR
	newRow = table.insertRow table.rows.length

	topicElement = document.createElement "br"
	newRow.appendChild topicElement 

	# Question
	newRow = table.insertRow table.rows.length 

	element = document.createElement "label"
	text = document.createTextNode "Question"
	element.appendChild text 
	newRow.appendChild element 

	questionElement = document.createElement "textarea" 
	newRow.appendChild questionElement 
	questionElement.addEventListener "keypress", () ->
		submitElement.value = "Save"
	questionElement.focus

	# Correct answer
	newRow = table.insertRow table.rows.length 

	element = document.createElement "label" 
	text = document.createTextNode "Correct answer" 
	element.appendChild text 
	newRow.appendChild element 

	correctElement = document.createElement "input" 
	correctElement.className = "field" 
	newRow.appendChild correctElement 
	correctElement.addEventListener "keypress", () ->
		submitElement.value = "Save"

    # Incorrect answer #1
	newRow = table.insertRow table.rows.length 

	element = document.createElement "label" 
	text = document.createTextNode "Incorrect answer #1" 
	element.appendChild text 
	newRow.appendChild element 

	incorrectElement1 = document.createElement "input" 
	incorrectElement1.className = "field" 
	newRow.appendChild incorrectElement1 
	incorrectElement1.addEventListener "keypress", () ->
		submitElement.value = "Save"

    # Incorrect answer #2
	newRow = table.insertRow table.rows.length 

	element = document.createElement "label" 
	text = document.createTextNode "Incorrect answer #2" 
	element.appendChild text 
	newRow.appendChild element 

	incorrectElement2 = document.createElement "input" 
	incorrectElement2.className = "field" 
	newRow.appendChild incorrectElement2 
	incorrectElement2.addEventListener "keypress", () ->
		submitElement.value = "Save"

    # Incorrect answer #3
	newRow = table.insertRow table.rows.length 

	element = document.createElement "label" 
	text = document.createTextNode "Incorrect answer #3" 
	element.appendChild text 
	newRow.appendChild element 

	incorrectElement3 = document.createElement "input" 
	incorrectElement3.className = "field" 
	newRow.appendChild incorrectElement3    
	incorrectElement3.addEventListener "keypress", () ->
		submitElement.value = "Save"

    # Topic
	newRow = table.insertRow table.rows.length 

	element = document.createElement "label" 
	text = document.createTextNode "Topic" 
	element.appendChild text 
	newRow.appendChild element 

	topicElement = document.createElement "input" 
	topicElement.className = "field" 
	newRow.appendChild topicElement                       
	topicElement.addEventListener "keypress", () ->
		submitElement.value = "Save"

    # BR
	newRow = table.insertRow table.rows.length 

	brElement = document.createElement "br" 
	newRow.appendChild brElement   

    # Submit
	newRow = table.insertRow table.rows.length 

	submitElement = document.createElement "input" 
	submitElement.type = "button" 
	submitElement.value = "Save" 
	submitElement.question_id = -1 if submitElement.question_id == undefined
	submitElement.addEventListener "click", (event) ->
		question =
			"question_id" : submitElement.question_id
			"question" : questionElement.value
			"correct_answer" : correctElement.value
			"incorrect_answer1" : incorrectElement1.value
			"incorrect_answer2" : incorrectElement2.value
			"incorrect_answer3" : incorrectElement3.value
			"topic" : topicElement.value
			"chapter_id" : chapter_id
		$.ajax 
			url: "/questions/save_question"
			type: "POST"
			data: question
			success: (e) ->
				submitElement.question_id = e
				submitElement.value = "Saved"
			error: (e) -> 
				alert "Something went wrong!"
	newRow.appendChild submitElement   

    # BR
	newRow = table.insertRow table.rows.length 

	brElement = document.createElement "br" 
	newRow.appendChild brElement   
                
    # HR
	newRow = table.insertRow table.rows.length 

	hrElement = document.createElement "hr" 
	hrElement.width = "auto" 
	newRow.appendChild hrElement   

	window.scrollTo 0, document.body.scrollHeight  	