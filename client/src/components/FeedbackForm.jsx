import React, { Component } from 'react';
import '../styles/feedback_form.css';

class FeedbackForm extends Component {
    
    sendFeedback(data){
        var request = new XMLHttpRequest();
        request.open("POST", "api/feedbacks");
        request.setRequestHeader("Content-Type", "application/json");
        request.onload = function(){
          if(request.status === 200){
            // var jsonString = request.responseText;
            // var feedback = JSON.parse(jsonString);
          }
        };
        request.send(JSON.stringify(data));
      }

    handleClick(){
        const userFeedback = document.querySelector("#feedback-input");
        const sendButton = document.querySelector("#send-feedback");
        sendButton.value = "Sent!";
        const feedback = {comments: userFeedback.value};
        this.sendFeedback(feedback);
    }
    
    render() {
      if (!this.props.isOpen){
        return null
      }
  
      return (
        <div>
          <div  id="modal">{this.props.children}
            <section id="modal-feedback">
                <button id="x" onClick={() => this.props.closeModal()}>X</button>
                <h1>Feedback</h1>
                <textarea id="feedback-input" 
                name="feedback-input" 
                rows="8" 
                cols="50" 
                placeholder="Tell me what you think!"/>
                <input id="send-feedback" type="button" 
                value="Send" 
                onClick={this.handleClick.bind(this)}/>
            </section>
          </div>
          <div id="backdrop" onClick={e => this.close(e)}/>
        </div>
      )
    }
  
    close(e) {
      e.preventDefault()
  
      if (this.props.onClose) {
        this.props.onClose()
      }
    }
  }
  
    

export default FeedbackForm;
