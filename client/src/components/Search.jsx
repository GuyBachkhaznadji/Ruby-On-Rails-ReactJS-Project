import React, { Component } from 'react';
import '../styles/search.css';

class Search extends Component {

  handleClick(event){
    if (this.props.concSearch){
      const key = event.target.name;
      const rating = event.target.value;
      this.props.handleRate(rating, key);
    }
  }

  handleCopyClick(elementName){
    var copyText = document.getElementById(elementName);;
    copyText.select();
    document.execCommand("Copy");
  }

  render() {

    var conciseRating = null;
    var compRating = null;
    var conciseCopy = null;
    var compCopy = null;

    if(this.props.concSearch){
      conciseCopy = <button id="cons-copy" onClick={() => {this.handleCopyClick("conc-search")}}>Copy</button>
      compCopy = <button id="comp-copy" onClick={() => {this.handleCopyClick("comp-search")}}>Copy</button>

      conciseRating = <section className="search-rating">
      <h3>Search Quality</h3>
      <section className="search-rating-buttons">
        <input className="good"
          name="conciseRating"
          value="Good"
          type="button"
          alt="Concise search dislike button"
          onClick={this.handleClick.bind(this)}/>

        <input className="bad"
          name="conciseRating"
          value="Bad"
          type="button"
          alt="Concise search like button"
          onClick={this.handleClick.bind(this)}/>
      </section>
      <p>{this.props.conciseFlag}</p>
    </section>

      compRating = <section className="search-rating">
      <h3>Search Quality</h3>
      <section className="search-rating-buttons">
        <input className="good"
          name="compRating"
          value="Good"
          type="button"
          alt="Comprehensive search dislike button"
          onClick={this.handleClick.bind(this)}/>
        <input className="bad"
          name="compRating"
          value="Bad"
          type="button"
          alt="Comprehensive search like button"
          onClick={this.handleClick.bind(this)}/>
        </section>
        <p>{this.props.compFlag}</p>
      </section>
    }

    return (
      <article id="searches">
        <section className="search">
          <h2>Concise Search</h2>
          <textarea  
          rows="8" 
          cols="40" 
          type="text" 
          id="conc-search" 
          value={this.props.concSearch}/>
          {conciseCopy}
          {conciseRating}

        </section>
        <section className="search">
          <h2>Comprehensive Search</h2>
          <textarea           
          rows="8" 
          cols="40"  
          type="text" 
          id="comp-search" 
          value={this.props.compSearch}/>
            {compCopy}
            {compRating}
    
         </section>
      </article>

      
    );
  }
}

export default Search;
