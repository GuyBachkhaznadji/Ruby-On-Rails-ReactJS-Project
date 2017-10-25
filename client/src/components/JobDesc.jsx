import React, { Component } from 'react';
import '../styles/job_desc.css';

class JobDesc extends Component {
    handleClick(){
        const userJobDec = document.querySelector("#job-desc-input");
        this.props.handleJobDescSubmitted(userJobDec.value);

    }

    render() {
    return (
      <article className="job-desc">
        <h2>Job Description</h2>
          <textarea id="job-desc-input" 
          name="job-desc-input" 
          rows="10" 
          cols="50" 
          placeholder="Put your job description here!" 
          form="job-desc-form"/>
          <section id="search-button-box">
            <input id="search-button"type="button" 
            value="Search!" 
            onClick={this.handleClick.bind(this)}/>
          </section>
      </article>

      
    );
  }
}

export default JobDesc;
