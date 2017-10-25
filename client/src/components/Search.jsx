import React, { Component } from 'react';
import '../styles/search.css';

class Search extends Component {

  handleClick(event){
    if (this.props.concSearch){
      const key = event.target.name;
      const rating = event.target.value;

      var button = document.querySelector("#" + event.target.id);
      button.value = "Flagged!";

      console.log(event.target);
      console.log(button);
      console.log(button.value);

      this.props.handleRate(rating, key);
    }
  }

  handleCopyClick(elementName){
    var copyText = document.getElementById(elementName);;
    copyText.select();
    document.execCommand("Copy");
  }

  render() {

    var searches = null
    var conciseRating = null;
    var compRating = null;
    var conciseCopy = null;
    var compCopy = null;
    var conciseGoodButton = <input className="good"
          id="concise-rating-good"
          name="conciseRating"
          value="Good"
          type="button"
          alt="Concise search like button"
          onClick={this.handleClick.bind(this)}/>
    var conciseBadButton = <input className="bad"
          id="concise-rating-bad"
          name="conciseRating"
          value="Bad"
          type="button"
          alt="Concise search dislike button"
          onClick={this.handleClick.bind(this)}/>
  var compGoodButton = <input className="good"
          id="comp-rating-good"
          name="compRating"
          value="Good"
          type="button"
          alt="Comprehensive search like button"
          onClick={this.handleClick.bind(this)}/>
  var compBadButton = <input className="bad"
          id="comp-rating-bad"
          name="compRating"
          value="Bad"
          type="button"
          alt="Comprehensive search dislike button"
          onClick={this.handleClick.bind(this)}/>
  
    if(this.props.concSearch){
      searches = <article id="searches">
        <section className="search">
          <h2>Concise Search</h2>
          <textarea  
          rows="8" 
          cols="50" 
          type="text" 
          id="conc-search" 
          value={this.props.concSearch}/>
          <button className="copy-buttons" id="cons-copy" onClick={() => {this.handleCopyClick("conc-search")}}>Copy</button>
          <section className="search-rating">
            <h3>Rate This Search</h3>
              <section className="search-rating-buttons">
                {conciseGoodButton}
                {conciseBadButton}
          </section>
          <p>{this.props.conciseFlag}</p>
        </section>
      </section>
      <section className="search">
        <h2>Comprehensive Search</h2>
        <textarea           
          rows="8" 
          cols="50"  
          type="text" 
          id="comp-search" 
          value={this.props.compSearch}/>
        <button className="copy-buttons" id="comp-copy" onClick={() => {this.handleCopyClick("comp-search")}}>Copy</button>    
        <section className="search-rating">
          <h3>Rate This Search</h3>
          <section className="search-rating-buttons">
                {compGoodButton}
                {compBadButton}
          </section>
          <p>{this.props.compFlag}</p>
        </section>    
      </section>
    </article>

    }

    return (
      <article>
        {searches}
      </article>
    );
  }
}

export default Search;
